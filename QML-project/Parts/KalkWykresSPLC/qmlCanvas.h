#ifndef LINE_H
#define LINE_H

#include <QDeclarativeItem>
#include <QPainter>
#include <qmath.h>
#include <QList>
#include <QPoint>
#include <iostream>

class QmlCanvas : public QDeclarativeItem
{
    Q_OBJECT
    //Q_PROPERTY(QColor color READ color)

public:
    typedef struct Node
    {
            int x;
            int y;
            struct Node *next;
            struct Node *previous;
    }node;

    /*FrameArray methods*/
    static node* frameArray;
    static node* frameArrayFirstElement;
    static node* frameArrayLastElement;

    Q_INVOKABLE void initFrameArray(int elementsCount) {
        QmlCanvas::frameArray=(node *)malloc(sizeof(node));
        node *temp1=QmlCanvas::frameArray;
        temp1->y=0;

        /*init circular list*/
        node *temp2;
        for(int i=0;i<elementsCount-1;++i)
        {
            temp2=(node *)malloc(sizeof(node));
            temp2->y=i+1;
            temp1->next=temp2;
            temp2->previous=temp1;
            temp1=temp2;
        }
        //last element with first
        temp2->next=QmlCanvas::frameArray;


        QmlCanvas::frameArrayFirstElement=frameArray;
        QmlCanvas::frameArrayLastElement=temp2;
        QmlCanvas::frameArrayFirstElement->previous=QmlCanvas::frameArrayLastElement;

    }

    Q_INVOKABLE void drawFrameList(int elementsCount) {
        node *temp1;
        std::cout<<"forward check"<<std::endl;
                temp1=QmlCanvas::frameArrayFirstElement;
                for(int i=0;i<elementsCount+2;++i)
                {
                    std::cout<<"i:"<<i<<" y:"<<temp1->y<<std::endl;
                    temp1=temp1->next;
                }
         }

    Q_INVOKABLE void addLeftPoint(int newLeftValue) {
            QmlCanvas::frameArrayLastElement=QmlCanvas::frameArrayLastElement->previous;
            QmlCanvas::frameArrayFirstElement=QmlCanvas::frameArrayLastElement->next;

            QmlCanvas::frameArrayFirstElement->y=newLeftValue;
         }

    Q_INVOKABLE void addRightPoint(int newRightValue) {

            QmlCanvas::frameArrayFirstElement=QmlCanvas::frameArrayFirstElement->next;
            QmlCanvas::frameArrayLastElement=QmlCanvas::frameArrayFirstElement->previous;

            QmlCanvas::frameArrayLastElement->y=newRightValue;
         }

    Q_INVOKABLE double getLeftX() {
        return QmlCanvas::leftX;
         }
    Q_INVOKABLE double getRightX() {
        return QmlCanvas::rightX;
         }


    Q_INVOKABLE void updateCanvas() {
        update();
         }

    QmlCanvas(QDeclarativeItem *parent = 0) :
            QDeclarativeItem(parent)
    {
        // Important, otherwise the paint method is never called
        setFlag(QGraphicsItem::ItemHasNoContents, false);
        configureCanvas();
    }

    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
    {
        if(antialiasing)
            painter->setRenderHint(QPainter::Antialiasing);

        if(smooth() == true) {
            painter->setRenderHint(QPainter::Antialiasing, true);
        }

        drawFunction(painter);
    }

    // Get methods

    Q_INVOKABLE void configureCanvas() {
        antialiasing=true;
        xMoveMultiplier=1.0;
        yMoveMultiplier=1.0;
        return;
         }

    void drawRotatedText(QPainter *painter, float degrees, int x, int y, const QString &text)
    {
      painter->save();
      painter->translate(x, y);
      painter->rotate(degrees);
      painter->drawText(0, 0, text);
      painter->restore();
    }

    void drawFunction(QPainter *painter)
    {

        QPen penAxis(Qt::black, 2);
        QPen penHelpAxis(Qt::gray, 1);
        QPen penHelpAxisText(Qt::black, 1);
        QPen penFunction(Qt::red, 2);
        QFont font=painter->font() ;
        font.setPointSize ( 10 );
        painter->setFont(font);
        painter->eraseRect(0,0,width,height);

        int leftXtoPixel=axisSizeToPixelX(QmlCanvas::leftX);
        int downYtoPixel=axisSizeToPixelY(QmlCanvas::downY);
        int upYtoPixel=axisSizeToPixelY(QmlCanvas::upY);
        int YPixels=axisSizeToPixelY(0)+axisSizeToPixelY(QmlCanvas::upY);
        int y1,y2;
        for(int i=downYtoPixel;i<upYtoPixel;++i)
        {
            if(i%(height/10)==0)
            {
                painter->setPen(penHelpAxis);
                painter->drawLine(0,(YPixels)-i,width,(YPixels)-i);

                painter->setPen(penHelpAxisText);
                painter->drawText(20,(YPixels)-i,QString::number(pixelToAxisSizeY(i),'g',3));
            }
            if(i==0)
            {

                painter->setPen(penAxis);
                painter->drawLine(0,(YPixels)-i,width,(YPixels)-i);
            }
        }
        node *temp1;
        temp1=QmlCanvas::frameArrayFirstElement;
        for(int i=0;i<width-1;++i)
        {
            //rysowanie osi Y
            if(leftXtoPixel%(height/10)==0)
            {
                painter->setPen(penHelpAxis);
                painter->drawLine(i,0,i,height);
                painter->setPen(penHelpAxisText);
                drawRotatedText(painter,90,i,height-(height/9),QString::number(pixelToAxisSizeX(leftXtoPixel),'g',3));
            }
            if(leftXtoPixel==0)
            {
                painter->setPen(penAxis);
                painter->drawLine(i,0,i,height);
            }
            leftXtoPixel++;

            y1=temp1->y;
            temp1=temp1->next;
            y2=temp1->y;
            painter->setPen(penFunction);
            painter->drawLine(i,(YPixels)-y1,i+1,(YPixels)-y2);
        }
    }

    Q_INVOKABLE void moveFrameByPixels(int deltaX,int deltaY)
    {
        QmlCanvas::leftX+=pixelToAxisSizeX(deltaX)*xMoveMultiplier;
        QmlCanvas::rightX+=pixelToAxisSizeX(deltaX)*xMoveMultiplier;
        QmlCanvas::downY-=pixelToAxisSizeY(deltaY)*yMoveMultiplier;
        QmlCanvas::upY-=pixelToAxisSizeY(deltaY)*yMoveMultiplier;
        //std::cout<<"new ranges: l:"<<QmlCanvas::leftX<<",r:"<<QmlCanvas::rightX<<",d:"<<QmlCanvas::downY<<",u:"<<QmlCanvas::upY<<std::endl;
        update();

    }

    Q_INVOKABLE double pixelToAxisSizeX(int pixelX)
    {
        return (QmlCanvas::perOnePixelX*pixelX);
    }
    Q_INVOKABLE double pixelToAxisSizeY(int pixelY)
    {
        return (QmlCanvas::perOnePixelY*pixelY);
    }

    Q_INVOKABLE int axisSizeToPixelX(double axisSizeX)
    {
        return (axisSizeX/QmlCanvas::perOnePixelX);
    }
    Q_INVOKABLE int axisSizeToPixelY(double axisSizeY)
    {
        return (axisSizeY/QmlCanvas::perOnePixelY);
    }

    Q_INVOKABLE double axisSizeToPixelY2(double axisSizeY)
    {
        return (axisSizeY/QmlCanvas::perOnePixelY);
    }

    Q_INVOKABLE double absf(double value)
    {
        return value < 0.0f ? -value : value;
    }


    Q_INVOKABLE void recalculateScales(int objectWidth,int objectHeight,double leftX,double rightX,double downY,double upY)
    {
        QmlCanvas::leftX=leftX;
        QmlCanvas::rightX=rightX;
        QmlCanvas::upY=upY;
        QmlCanvas::downY=downY;
        QmlCanvas::width=objectWidth;
        QmlCanvas::height=objectHeight;
        //std::cout<<"ranges: l:"<<QmlCanvas::leftX<<",r:"<<QmlCanvas::rightX<<",d:"<<QmlCanvas::downY<<",u:"<<QmlCanvas::upY<<std::endl;

        //SKALOWANIE DLA X
        /*jeśli różne znaki*/
        double horizontalSize,horizontalCenter;
        if((QmlCanvas::leftX<0) && (QmlCanvas::rightX>0)){
        horizontalSize=absf(QmlCanvas::leftX)+absf(QmlCanvas::rightX);
        horizontalSize*=1.0;
        if(absf(leftX)>rightX)
            {
                horizontalCenter=-(absf(QmlCanvas::rightX)-absf(QmlCanvas::leftX));
            }
        else
            {
                horizontalCenter=absf(QmlCanvas::rightX)-absf(QmlCanvas::leftX);
            }
        } else
            /*jeśli obydwa większe od zera*/
            if((QmlCanvas::leftX>0) && (QmlCanvas::rightX>0))
            {
                horizontalCenter=horizontalSize=(absf(QmlCanvas::rightX)-absf(QmlCanvas::leftX));

            } else
                /*jeśli obydwa mniejsze od zera*/
                if((QmlCanvas::leftX<0) && (QmlCanvas::rightX<0))
                {
                    horizontalCenter=horizontalSize=(absf(QmlCanvas::leftX)-absf(QmlCanvas::rightX));
                    horizontalCenter=-horizontalCenter;
                }
        QmlCanvas::perOnePixelX=(horizontalSize*1.0)/width;

        //SKALOWANIE DLA Y
        /*jeśli różne znaki*/
        double verticalSize,verticalCenter;
        if((QmlCanvas::upY>0) && (QmlCanvas::downY<0)){
            verticalSize=absf(QmlCanvas::upY)+absf(QmlCanvas::downY);
            if(absf(downY)>upY)
                {
                    verticalCenter=-(absf(QmlCanvas::upY)-absf(QmlCanvas::downY));
                }
            else
                {
                    verticalCenter=absf(QmlCanvas::upY)-absf(QmlCanvas::downY);
                }
            } else
            /*jeśli obydwa większe od zera*/
            if((QmlCanvas::upY>0) && (QmlCanvas::downY>0))
            {
                verticalCenter=verticalSize=absf(QmlCanvas::upY)-absf(QmlCanvas::downY);
            } else
                /*jeśli obydwa mniejsze od zera*/
                if((QmlCanvas::upY<0) && (QmlCanvas::downY<0))
                {
                    verticalCenter=verticalSize=absf(QmlCanvas::downY)-absf(QmlCanvas::upY);
                    verticalCenter=-verticalCenter;
                }
        QmlCanvas::perOnePixelY=(verticalSize*1.0)/height;
    }

signals:

    void onCreate();


protected:

    static long double leftX;
    static long double rightX;
    static long double upY;
    static long double downY;

    static int width;
    static int height;
    static double perOnePixelX; //dopisać funkcje odwrotne
    static double perOnePixelY; //dopisać funkcje odwrotne

    //opcje
    bool antialiasing;
    float xMoveMultiplier;
    float yMoveMultiplier;

};

QML_DECLARE_TYPE(QmlCanvas)

#endif // LINE_H
