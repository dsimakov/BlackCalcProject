import QtQuick 1.1

import QtQuick 1.0

 Rectangle {
     id: button

     property alias operation: buttonText.text
     property alias gradient: button.gradient

     signal clicked

     //border { left: 10; top: 10; right: 10; bottom: 10 }

     radius: 15

     Rectangle {
         id: shade
         anchors.fill: button; radius: 15; color: "black"; opacity: 0
     }

     Text {
         id: buttonText
         anchors.centerIn: parent; anchors.verticalCenterOffset: -1
         font.pixelSize: parent.width > parent.height ? parent.height * .5 : parent.width * .5
         style: Text.Sunken; color: "white"; styleColor: "black"; smooth: true
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: {
             doOp(operation)
             button.clicked()
         }
     }

     states: State {
         name: "pressed"; when: mouseArea.pressed == true
         PropertyChanges { target: shade; opacity: .4 }
     }
 }
