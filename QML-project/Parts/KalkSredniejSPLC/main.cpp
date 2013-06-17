#include <QApplication>

#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include "qmlapplicationviewer.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setApplicationName("BBAvgCalc ");
       app.setApplicationVersion("1.0rc LGPL 3.0 lic.");
       app.setOrganizationName("Silesian University of Technology Students");
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockLandscape);
    viewer.setResizeMode(QmlApplicationViewer::SizeRootObjectToView);
    //viewer.setMainQmlFile(":/qml/main.qml");
    viewer.setSource(QUrl("qrc:/qml/main.qml"));
    viewer.setWindowState(Qt::WindowFullScreen);
    viewer.showExpanded();

    return app.exec();
}
