#include <QApplication>

#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include "qmlapplicationviewer.h"

int main(int argc, char *argv[])
{    
    QApplication app(argc, argv);
    app.setApplicationName("BBMgrCalc ");
       app.setApplicationVersion("1.0rc LGPL 3.0 lic.");
       app.setOrganizationName("Silesian University of Technology Students");
       QLocale::setDefault(QLocale(QLocale::English, QLocale::UnitedStates));
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockLandscape);
    viewer.setResizeMode(QmlApplicationViewer::SizeRootObjectToView);
    viewer.setSource(QUrl("qrc:/qml/main.qml"));
    viewer.setWindowState(Qt::WindowFullScreen);
    viewer.showExpanded();

    return app.exec();
}
