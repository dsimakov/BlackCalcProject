#include <QApplication>
#include <QLibrary>
#include "mainwidget.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    
    /*MainWidget w;
    w.showMaximized();
*/
    typedef void (*initFunction)(void);

    QString pathToLibrary="/accounts/devuser/liblibrary.so";



    initFunction init =
            (initFunction) QLibrary::resolve(pathToLibrary, "init");
    init();
    
    return a.exec();
}

