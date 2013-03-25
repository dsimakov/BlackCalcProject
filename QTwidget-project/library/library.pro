#-------------------------------------------------
#
# Project created by QtCreator 2013-03-25T19:22:37
#
#-------------------------------------------------

QT       += svg multimedia

TARGET = library
TEMPLATE = lib

DEFINES += LIBRARY_LIBRARY

SOURCES += library.cpp \
    firstwindow.cpp

HEADERS += library.h\
        library_global.h \
    firstwindow.h

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}

FORMS += \
    firstwindow.ui

RESOURCES += \
    mainResources.qrc
