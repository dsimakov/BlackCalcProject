import QtQuick 1.1

Rectangle {
    width: 720
    height: 720
    Text {
        text: qsTr("Hello World Ludzie:d")
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
}


