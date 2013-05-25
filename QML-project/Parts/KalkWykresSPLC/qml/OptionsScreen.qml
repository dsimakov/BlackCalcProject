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
                    diagonalLine.recalculateScales(rect.width,rect.height,-4,3,2,-2);

                    drawArea.xmouse=mouseX
                    drawArea.ymouse=mouseY

                }
                onMousePositionChanged: {

                    var l=0.0
                    var r=0.0
                    var u=0.0
                    var d=0.0
                    var deltaX=0
                    var deltaY=0
                    deltaX=drawArea.xmouse-mouseX
                    deltaY=drawArea.ymouse-mouseY
                    //FATALBUG najpierwej coś obliczam a potem dane przygotowuję dafuq...
                    console.log(drawArea.tmpleftX)
                    console.log(deltaX)
                    console.log(diagonalLine.fscaleX)
                    l=drawArea.tmpleftX+(deltaX*diagonalLine.fscaleX)
                    r=drawArea.tmprightX+(deltaX*diagonalLine.fscaleX)
                    u=drawArea.tmpupY+(deltaY/diagonalLine.fscaleY)
                    d=drawArea.tmpdownY+(deltaY/diagonalLine.fscaleY)

                    diagonalLine.recalculateScales(rect.width,rect.height,l,r,u,d)
                    GraphFunctions.drawGraph(diagonalLine)
                   /* if(rect.evenClick) { diagonalLine.x1 = mouseX; diagonalLine.y1 = mouseY }
                    else { diagonalLine.x2 = mouseX; diagonalLine.y2 = mouseY }*/

                }
            }
        }
    }
}
