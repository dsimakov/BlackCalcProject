#include <QApplication>

#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include "qmlapplicationviewer.h"

int main(int argc, char *argv[])
{
    system("export QQNX_PHYSICAL_SCREEN_SIZE=150,100");
    QApplication app(argc, argv);
    app.setApplicationName("BBSimpleCalc ");
       app.setApplicationVersion("1.0rc LGPL 3.0 lic.");
       app.setOrganizationName("Silesian University of Technology Students");
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockLandscape);
    viewer.setResizeMode(QmlApplicationViewer::SizeRootObjectToView);
    viewer.setSource(QUrl("qrc:/qml/main.qml"));
    viewer.setWindowState(Qt::WindowFullScreen);
    viewer.showExpanded();

    return app.exec();
}
