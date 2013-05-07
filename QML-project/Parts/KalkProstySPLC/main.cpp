#include <QApplication>

#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include "qmlapplicationviewer.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockLandscape);
    viewer.setResizeMode(QmlApplicationViewer::SizeRootObjectToView);
    viewer.setMainQmlFile(QLatin1String("qml/main.qml"));
    viewer.setWindowState(Qt::WindowFullScreen);
    viewer.showExpanded();

    return app.exec();
}
