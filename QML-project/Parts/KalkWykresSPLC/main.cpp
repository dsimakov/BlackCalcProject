#include <QApplication>

#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include "qmlapplicationviewer.h"
#include <QList>
#include <QPoint>
#include "qmlCanvas.h"

QList<QPoint> QmlCanvas::pointsArray;
int QmlCanvas::m_x1;
int QmlCanvas::m_y1;
int QmlCanvas::m_x2;
int QmlCanvas::m_y2;
QColor QmlCanvas::m_color(Qt::black);
int QmlCanvas::m_penWidth;

double QmlCanvas::leftX;
double QmlCanvas::rightX;
double QmlCanvas::upY;
double QmlCanvas::downY;
double QmlCanvas::scaleX=1.0;
double QmlCanvas::scaleY=1.0;
double QmlCanvas::ratioX;
double QmlCanvas::ratioY;
int QmlCanvas::zeroX;
int QmlCanvas::zeroY;
int QmlCanvas::width;
int QmlCanvas::height;

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

     qmlRegisterType<QmlCanvas>("QmlCanvas", 1, 0, "QmlCanvas");
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setResizeMode(QmlApplicationViewer::SizeRootObjectToView);
    viewer.setMainQmlFile(QLatin1String("qml/main.qml"));
    //viewer.setWindowState(Qt::WindowFullScreen);
    viewer.showExpanded();

    return app.exec();
}
