import QtQuick 1.0
import QmlCanvas 1.0

import "graph.js" as GraphFunctions
/*
 * Screen including ListView with selectable items.
 *
 */
Screen {
    id: screen

    Rectangle {
        id: prediction
        anchors.top: topBarBottom
        width:parent.width
        height: parent.height- (parent.height / 11)

        Rectangle {
            id :rect
            property bool evenClick : false

            anchors.fill: parent; color: "lightsteelblue"

            property int test
            QmlCanvas {
                id: diagonalLine

                anchors.fill: parent;
                property string functionToDraw: "sin(x)"
            }

            MouseArea {
                anchors.fill: parent
                id: drawArea
                property int xmouse
                property int ymouse
                property double tmpleftX
                property double tmprightX
                property double tmpupY
                property double tmpdownY
                onClicked: {
                    diagonalLine.recalculateScales(rect.width,rect.height,-5,5,-2,2);
                    GraphFunctions.drawGraph(diagonalLine,-5,5);
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
}
