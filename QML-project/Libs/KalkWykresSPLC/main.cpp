#include <QApplication>

#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include "qmlapplicationviewer.h"
#include <QList>
#include <QPoint>
#include "qmlCanvas.h"
#include "library.h"

QmlCanvas::node* QmlCanvas::frameArray;
QmlCanvas::node* QmlCanvas::frameArrayFirstElement;
QmlCanvas::node* QmlCanvas::frameArrayLastElement;

long double QmlCanvas::leftX;
long double QmlCanvas::rightX;
long double QmlCanvas::upY;
long double QmlCanvas::downY;
int QmlCanvas::width;
int QmlCanvas::height;

double QmlCanvas::perOnePixelX; //dopisać funkcje odwrotne
double QmlCanvas::perOnePixelY; //dopisać funkcje odwrotne

extern "C"{
/**
 * Method inits and starts choose calc
 */

 void Q_DECL_EXPORT init()
{
     qmlRegisterType<QmlCanvas>("QmlCanvas", 1, 0, "QmlCanvas");
     QmlApplicationViewer viewer;
     viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockLandscape);
     viewer.setResizeMode(QmlApplicationViewer::SizeRootObjectToView);
     viewer.setSource(QUrl("qrc:/qml/main.qml"));
     viewer.setWindowState(Qt::WindowFullScreen);
     viewer.showExpanded();

}

 /**
  * Method returns info about calc for main stage of BlackCalc
  */
 QString Q_DECL_EXPORT getInfo()
 {
     QString info="Informacje na temat biblioteki, proszę uzupełnić";
    return info;
 }

 /**
  * Method returns icon for main stage of BlackCalc
  */

 QImage Q_DECL_EXPORT getIcon()
 {
     QImage result;
     QPixmap icon=QPixmap( ":/icons/mainIcon.png"); //icon stored in mainResources
     result=icon.toImage();
    return result;
 }

}

