import QtQuick 1.0

 GridView {
     //width: 300; height: 200
anchors.fill: parent
     model: ExtraOptionsModel{}
     delegate: Column {
         Rectangle{
             width: 100
             height: 100
             color: "red"
         Image { source: portrait; anchors.horizontalCenter: parent.horizontalCenter }
         Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
         MouseArea {
             id: mouseArea
             anchors.fill: parent
             onClicked: onClick
         }
         }
     }
 }
