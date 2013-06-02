#include <QApplication>

#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include "qmlapplicationviewer.h"
#include <QList>
#include <QPoint>
#include "qmlCanvas.h"

QList<QPoint> QmlCanvas::pointsArray;

long double QmlCanvas::leftX;
long double QmlCanvas::rightX;
long double QmlCanvas::upY;
long double QmlCanvas::downY;
int QmlCanvas::width;
int QmlCanvas::height;

double QmlCanvas::perOnePixelX; //dopisać funkcje odwrotne
double QmlCanvas::perOnePixelY; //dopisać funkcje odwrotne
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QmlCanvas::pointsArray.clear();
    qmlRegisterType<QmlCanvas>("QmlCanvas", 1, 0, "QmlCanvas");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockLandscape);
    viewer.setResizeMode(QmlApplicationViewer::SizeRootObjectToView);
    viewer.setMainQmlFile(QLatin1String("qml/main.qml"));
    //viewer.setWindowState(Qt::WindowFullScreen);
    viewer.showExpanded();

    return app.exec();
}
