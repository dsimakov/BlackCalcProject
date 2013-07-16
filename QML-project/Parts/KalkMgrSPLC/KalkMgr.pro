# Add more folders to ship with the application, here
folder_01.source = qml
folder_01.target =
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# Avoid auto screen rotation
#DEFINES += ORIENTATIONLOCK

# Needs to be defined for Symbian
#DEFINES += NETWORKACCESS

symbian:TARGET.UID3 = 0xE77F3DFD

# Define QMLJSDEBUGGER to allow debugging of QML in debug builds
# (This might significantly increase build time)
# DEFINES += QMLJSDEBUGGER

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    lib.c

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/BackButton.qml \
    qml/ChangeGradePanel.qml \
    qml/TopBar.qml \
    qml/Extraoptions.qml \
    qml/ExtraOptionsModel.qml \
    qml/main.qml \
    qml/OptionsScreen.qml \
    qml/PredictionScreen.qml \
    qml/Screen.qml \
    qml/ScrollBar.qml \
    qml/TopBar.qml \
    qml/OptionsList/OptionsScreenItem.qml \
    qml/images/icon.png \
    bar-descriptor.xml \
    QML-List-Example.png \
    QML-List-Example.svg \
    icon.png \
    KalkMgr.pro.user \
    functions.js

HEADERS +=

RESOURCES += \
    mgrcalcres.qrc

qnx {
    QMAKE_LFLAGS += '-Wl,-rpath,\'./app/native/lib\''

    PACKAGE_ARGS = \
        $${PWD}/bar-descriptor.xml $$TARGET \
        -e $${PWD}/icon.png icon.png \
        -e $$[QT_INSTALL_LIBS]/libQtCore.so.5 lib/libQtCore.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtGui.so.5 lib/libQtGui.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtOpenGL.so.5 lib/libQtOpenGL.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtNetwork.so.5 lib/libQtNetwork.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtWidgets.so.5 lib/libQtWidgets.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtQuick.so.5 lib/libQtQuick.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtQml.so.5 lib/libQtQml.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtSql.so.5 lib/libQtSql.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtV8.so.5 lib/libQtV8.so.5 \
        -e $$[QT_INSTALL_LIBS]/libQtXmlPatterns.so.5 lib/libQtXmlPatterns.so.5 \
        -e $$[QT_INSTALL_PLUGINS]/platforms/libqnx.so plugin/platforms/libqnx.so \
        -e $$[QT_INSTALL_IMPORTS]/ qml/

    package.target = $${TARGET}.bar
    package.depends = $$TARGET
    package.commands = blackberry-nativepackager \
        -package $${TARGET}.bar \
        -devMode -debugToken $$(DEBUG_TOKEN) \
        $${PACKAGE_ARGS}

    QMAKE_EXTRA_TARGETS += package

    OTHER_FILES += bar-descriptor.xml
}
