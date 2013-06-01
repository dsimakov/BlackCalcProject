import QtQuick 1.0
import QmlCanvas 1.0

import "graph.js" as GraphFunctions
/*
 * Screen including ListView with selectable items.
 *
 */
Screen {
    id: screen
    property alias functionString: rect.func
    function show(functionString,frameLeft,frameRight,frameDown,frameUp,drawMinX,drawMaxX) {
        /*diagonalLine.recalculateScales(rect.width,rect.height,-10,15,-5,5); //prepare window
        GraphFunctions.drawGraph(diagonalLine.functionToDraw,-125,110); //count points
*/
        error.visible=false;
        diagonalLine.functionToDraw=functionString;
        diagonalLine.recalculateScales(rect.width,rect.height,frameLeft,frameRight,frameDown,frameUp); //prepare window
        GraphFunctions.drawGraph(diagonalLine.functionToDraw,drawMinX,drawMaxX); //count points
        }

    Rectangle {
        id: prediction
        anchors.top: topBarBottom
        width:parent.width
        height: parent.height- (parent.height / 11)

        Rectangle {
            id :rect
            property bool evenClick : false
            property string func

            anchors.fill: parent; color: "lightsteelblue"

            property int test
            QmlCanvas {
                id: diagonalLine

                anchors.fill: parent;

                property string functionToDraw
            }


            MouseArea {
                anchors.fill: parent
                id: drawArea
                property int xmouse
                property int ymouse
                onPressed: {
                    drawArea.xmouse=mouseX
                    drawArea.ymouse=mouseY

                }
                onMousePositionChanged: {
                    var deltaX=0
                    var deltaY=0
                    deltaX=drawArea.xmouse-mouseX
                    deltaY=drawArea.ymouse-mouseY
                    diagonalLine.moveFrameByPixels(deltaX,deltaY);
                    drawArea.xmouse=mouseX
                    drawArea.ymouse=mouseY


                }
            }
        }
    }

    Rectangle{
        id:error
        anchors.centerIn: parent
        width: parent.width/2
        height: parent.height/2
        Text {
            anchors.centerIn: parent
            id: errorText
            text: qsTr("Błędnie wprowadzona funkcja")
            font.pixelSize: main.width / 30
        }
        color: "red"
        radius: 5;
        visible:false


    }
}
