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
    Q_PROPERTY(QColor color READ color)
    Q_PROPERTY(int penWidth READ penWidth)

public:
    static QList<QPoint> pointsArray;

    Q_INVOKABLE int addPoint(int x, int y) {
        //QmlCanvas::pointsArray.append(QPoint(x,y));
        QmlCanvas::pointsArray.append(QPoint(x,y));
        std::cout<<"Dodano punkt x:"<<x<<" y:"<<y<<" Ilość elementów:"<<QmlCanvas::pointsArray.count()<<std::endl;

        return 0;
         }

    QmlCanvas(QDeclarativeItem *parent = 0) :
            QDeclarativeItem(parent)
    {
        // Important, otherwise the paint method is never called
        setFlag(QGraphicsItem::ItemHasNoContents, false);
    }

    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
    {
        QPen pen(Qt::black, 2);
        painter->setPen(pen);

        if(smooth() == true) {
            painter->setRenderHint(QPainter::Antialiasing, true);
        }

        drawAxis(painter);
        drawFunction(painter);
    }

    // Get methods

    QColor color() const { return QmlCanvas::m_color; }
    int penWidth() const { return QmlCanvas::m_penWidth; }
    double fleftX() const { return QmlCanvas::leftX; }
    double frightX() const { return QmlCanvas::rightX; }
    double fupY() const { return QmlCanvas::upY; }
    int setRoot(int) const { return 0; }


    /*Methods to draw*/

    void drawAxis(QPainter *painter)
    {

    }

    void drawFunction(QPainter *painter)
    {
        std::cout<<"frameMinX="<<QmlCanvas::frameMinX<<" hFM="<<QmlCanvas::horizontalFrameMove<<" LeftX="<<QmlCanvas::leftX<<std::endl;
        int minx=axisSizeToPixelX(QmlCanvas::frameMinX)+QmlCanvas::horizontalFrameMove+(abs(axisSizeToPixelX(QmlCanvas::minX)-axisSizeToPixelX(QmlCanvas::frameMinX)));
        int maxx=axisSizeToPixelX(QmlCanvas::frameMaxX)+QmlCanvas::horizontalFrameMove+(abs(axisSizeToPixelX(QmlCanvas::minX)-axisSizeToPixelX(QmlCanvas::frameMinX)));
        std::cout<<"minx= "<<minx<<" maxx="<<maxx<<std::endl;
        if(maxx<0)
            return;
       /* if(minx<0)
            minx=-minx;*/
        for(int i=minx;i<maxx-1;++i)
        {
            if((i>0)&&(i<QmlCanvas::pointsArray.count()-1)){
                painter->drawLine(abs(minx)-QmlCanvas::pointsArray[i].x(),(QmlCanvas::verticalFrameMove)+QmlCanvas::pointsArray[i].y(),abs(minx)-QmlCanvas::pointsArray[i+1].x(),(QmlCanvas::verticalFrameMove)+pointsArray[i+1].y());
               // std::cout<<"x= "<<QmlCanvas::pointsArray[i].x()<<" x+1="<<QmlCanvas::pointsArray[i+1].x()<<std::endl;
            }

        }

    }
    Q_INVOKABLE void setMinMaxToCalc(double minX,double maxX)
    {
        QmlCanvas::pointsArray.clear();
        QmlCanvas::minX=minX;
        QmlCanvas::maxX=maxX;
    }

    Q_INVOKABLE void moveFrameByPixels(int deltaX,int deltaY)
    {
        std::cout<<"bef frameMinX="<<QmlCanvas::frameMinX<<std::endl;
        std::cout<<"bef frameMaxX="<<QmlCanvas::frameMaxX<<std::endl;
        QmlCanvas::frameMinX-=pixelToAxisSizeX(deltaX);
        std::cout<<"frameMinX="<<QmlCanvas::frameMinX<<" pTAS="<<pixelToAxisSizeX(deltaX)<<std::endl;
        QmlCanvas::frameMaxX-=pixelToAxisSizeX(deltaX);
        std::cout<<"frameMaxX="<<QmlCanvas::frameMaxX<<" pTAS="<<pixelToAxisSizeX(deltaX)<<std::endl;
        QmlCanvas::verticalFrameMove-=deltaY;
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



    Q_INVOKABLE void recalculateScales(int objectWidth,int objectHeight,double leftX,double rightX,double downY,double upY)
    {
        QmlCanvas::leftX=leftX;
        QmlCanvas::rightX=rightX;
        QmlCanvas::upY=upY;
        QmlCanvas::downY=downY;
        QmlCanvas::width=objectWidth;
        QmlCanvas::height=objectHeight;

        //SKALOWANIE DLA X
        /*jeśli różne znaki*/
        double horizontalSize,horizontalCenter;
        if((QmlCanvas::leftX<0) && (QmlCanvas::rightX>0)){
        horizontalSize=abs(QmlCanvas::leftX)+abs(QmlCanvas::rightX);
        if(abs(leftX)>rightX)
            {
                horizontalCenter=-(abs(QmlCanvas::rightX)-abs(QmlCanvas::leftX));
            }
        else
            {
                horizontalCenter=abs(QmlCanvas::rightX)-abs(QmlCanvas::leftX);
            }
        } else
            /*jeśli obydwa większe od zera*/
            if((QmlCanvas::leftX>0) && (QmlCanvas::rightX>0))
            {
                horizontalCenter=horizontalSize=(abs(QmlCanvas::rightX)-abs(QmlCanvas::leftX));

            } else
                /*jeśli obydwa mniejsze od zera*/
                if((QmlCanvas::leftX<0) && (QmlCanvas::rightX<0))
                {
                    horizontalCenter=horizontalSize=(abs(QmlCanvas::leftX)-abs(QmlCanvas::rightX));
                    horizontalCenter=-horizontalCenter;
                }
        QmlCanvas::perOnePixelX=(horizontalSize*1.0)/width;


        //SKALOWANIE DLA Y
        /*jeśli różne znaki*/
        double verticalSize,verticalCenter;
        if((QmlCanvas::upY>0) && (QmlCanvas::downY<0)){
            verticalSize=abs(QmlCanvas::upY)+abs(QmlCanvas::downY);
            if(abs(downY)>upY)
                {
                    verticalCenter=-(abs(QmlCanvas::upY)-abs(QmlCanvas::downY));
                }
            else
                {
                    verticalCenter=abs(QmlCanvas::upY)-abs(QmlCanvas::downY);
                }
            } else
            /*jeśli obydwa większe od zera*/
            if((QmlCanvas::upY>0) && (QmlCanvas::downY>0))
            {
                verticalCenter=verticalSize=abs(QmlCanvas::upY)-abs(QmlCanvas::downY);
            } else
                /*jeśli obydwa mniejsze od zera*/
                if((QmlCanvas::upY<0) && (QmlCanvas::downY<0))
                {
                    verticalCenter=verticalSize=abs(QmlCanvas::downY)-abs(QmlCanvas::upY);
                    verticalCenter=-verticalCenter;
                }
        QmlCanvas::perOnePixelY=(verticalSize*1.0)/height;

        //wyliczanie położenia wykresu w przestrzeni. no raczej przesunięcia środka
        QmlCanvas::horizontalFrameMove=axisSizeToPixelX(horizontalSize/2.0);
        QmlCanvas::verticalFrameMove=axisSizeToPixelY(verticalSize/2.0);
        std::cout<<"hPM="<<QmlCanvas::horizontalFrameMove<<" vPM="<<QmlCanvas::verticalFrameMove<<std::endl;
        QmlCanvas::frameMinX=leftX;
        QmlCanvas::frameMaxX=rightX;
        update();

    }

signals:

    void colorChanged();
    void penWidthChanged();
    void onCreate();


protected:
    void updateSize() {
    }

    static QColor m_color;
    static int m_penWidth;

    static double leftX;
    static double rightX;
    static double upY;
    static double downY;

    static double minX;
    static double frameMinX;
    static double frameMaxX;
    static double maxX;

    //Zmienne o ile przesunąć rysowane punkty już na wykresie
    static int horizontalFrameMove;
    static int verticalFrameMove;

    static int width;
    static int height;
    static double perOnePixelX; //dopisać funkcje odwrotne
    static double perOnePixelY; //dopisać funkcje odwrotne
};

QML_DECLARE_TYPE(QmlCanvas)

#endif // LINE_H
