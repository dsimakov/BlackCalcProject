import QtQuick 1.0

 Rectangle {
     id: rect

     property alias text : displayText.text
     property alias currentOperation : operationText

     color: "white"

     Text {
         id: displayText
         anchors {
             right: parent.right; verticalCenter: parent.verticalCenter; verticalCenterOffset: -1
             rightMargin: 6; left: operationText.right
         }
         font.pixelSize: parent.height * .6; text: "0"; horizontalAlignment: Text.AlignRight; elide: Text.ElideRight
         color: "#343434"; smooth: true; font.bold: true
     }
     Text {
         id: operationText
         font.bold: true; font.pixelSize: parent.height * .7
         color: "#343434"; smooth: true
         anchors { left: parent.left; leftMargin: 6; verticalCenterOffset: -3; verticalCenter: parent.verticalCenter }
     }
 }
