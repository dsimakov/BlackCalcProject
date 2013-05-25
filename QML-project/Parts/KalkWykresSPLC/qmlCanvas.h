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
    Q_PROPERTY(double fleftX READ fleftX )
    Q_PROPERTY(double frightX READ frightX)
    Q_PROPERTY(double fupY READ fupY)
    Q_PROPERTY(double fdownY READ fdownY)
    Q_PROPERTY(double fscaleX READ fscaleX)
    Q_PROPERTY(double fscaleY READ fscaleY)
    Q_PROPERTY(double fzeroX READ fzeroX)
    Q_PROPERTY(double fzeroY READ fzeroY)

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
    double fdownY() const { return QmlCanvas::downY; }
    double fscaleX() const { return QmlCanvas::scaleX; }
    double fscaleY() const { return QmlCanvas::scaleY; }
    double fzeroX() const { return QmlCanvas::zeroX; }
    double fzeroY() const { return QmlCanvas::zeroY; }

    /*Methods to draw*/

    void drawAxis(QPainter *painter)
    {
        painter->drawLine(0, QmlCanvas::zeroY, QmlCanvas::width, QmlCanvas::zeroY);
        painter->drawLine(QmlCanvas::zeroX , 0, QmlCanvas::zeroX, QmlCanvas::height);
    }

    void drawFunction(QPainter *painter)
    {
        for(int i=0;i<QmlCanvas::pointsArray.count()-1;++i)
        {
            painter->drawLine(QmlCanvas::pointsArray[i].x(),QmlCanvas::pointsArray[i].y(),QmlCanvas::pointsArray[i+1].x(),pointsArray[i+1].y());
        }

    }

    Q_INVOKABLE void recalculateScales(int objectWidth,int objectHeight,double leftX,double rightX,double upY,double downY)
    {
        QmlCanvas::leftX=leftX;
        QmlCanvas::rightX=rightX;
        QmlCanvas::upY=upY;
        QmlCanvas::downY=downY;
        QmlCanvas::width=objectWidth;
        QmlCanvas::height=objectHeight;

         //przygotowanie informacji do rysowania osi
        if (!((QmlCanvas::leftX>0) || (QmlCanvas::rightX<0)))
        {
            QmlCanvas::ratioY=(abs(upY)*1.0)/(abs(downY)+abs(upY));
            QmlCanvas::zeroY=QmlCanvas::height*QmlCanvas::ratioY;
        }

        if (!((QmlCanvas::downY>0) || (QmlCanvas::upY<0)))
        {
            QmlCanvas::ratioX=(abs(QmlCanvas::leftX)*1.0)/(abs(QmlCanvas::leftX)+abs(QmlCanvas::rightX));
            QmlCanvas::zeroX=QmlCanvas::width*QmlCanvas::ratioX;
        }

        //SKALOWANIE DLA X
        /*jeśli różne znaki*/
        if((QmlCanvas::leftX<0) && (QmlCanvas::rightX>0)){
        QmlCanvas::scaleX=((abs(QmlCanvas::leftX)+abs(QmlCanvas::rightX))*1.0)/QmlCanvas::width;
        } else
            /*jeśli obydwa większe od zera*/
            if((QmlCanvas::leftX>0) && (QmlCanvas::rightX>0))
            {
            QmlCanvas::scaleX=((abs(QmlCanvas::rightX)-abs(QmlCanvas::leftX))*1.0)/QmlCanvas::width;\
            } else
                /*jeśli obydwa mniejsze od zera*/
                if((QmlCanvas::leftX<0) && (QmlCanvas::rightX<0))
                {
                    QmlCanvas::scaleX=((abs(QmlCanvas::leftX)-abs(QmlCanvas::rightX))*1.0)/QmlCanvas::width;
                }

        //SKALOWANIE DLA Y
        /*jeśli różne znaki*/
        if((QmlCanvas::upY>0) && (QmlCanvas::downY<0)){
        QmlCanvas::scaleY=-(QmlCanvas::height*1.0)/(abs(QmlCanvas::upY)+abs(QmlCanvas::downY)); //minus z powodu, że na górze osi Y jest zero a na dole full
        } else
            /*jeśli obydwa większe od zera*/
            if((QmlCanvas::upY>0) && (QmlCanvas::downY>0))
            {
            QmlCanvas::scaleY=-(QmlCanvas::height*1.0)/(abs(QmlCanvas::upY)-abs(QmlCanvas::downY)); //minus z powodu, że na górze osi Y jest zero a na dole full
            } else
                /*jeśli obydwa mniejsze od zera*/
                if((QmlCanvas::upY<0) && (QmlCanvas::downY<0))
                {
                    QmlCanvas::scaleY=-(QmlCanvas::height*1.0)/(abs(QmlCanvas::downY)-abs(QmlCanvas::upY)); //minus z powodu, że na górze osi Y jest zero a na dole full
                }
        update();

    }

signals:

    void colorChanged();
    void penWidthChanged();
    void xChanged();


protected:
    void updateSize() {
    }

    static QColor m_color;
    static int m_penWidth;

    static double leftX;
    static double rightX;
    static double upY;
    static double downY;
    static double scaleX;
    static double scaleY;
    static double ratioX;
    static double ratioY;
    static int zeroX;
    static int zeroY;

    static int width;
    static int height;
    static double perOnePixelX; //dopisać funkcje odwrotne
    static double perOnePixelY; //dopisać funkcje odwrotne
};

QML_DECLARE_TYPE(QmlCanvas)

#endif // LINE_H
