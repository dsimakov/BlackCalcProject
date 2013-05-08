import QtQuick 1.0

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

            id:graph
            anchors.fill: parent
            color:"steelblue"
            property string functionToDraw
            property double leftX
            property double rightX
            property double upY
            property double downY
            property double scaleX
            property double scaleY
            property double ratioX
            property double ratioY
            property int zeroX
            property int zeroY



            MouseArea{
                anchors.fill: parent
                property int xmouse
                property int ymouse
                property double tmpleftX
                property double tmprightX
                property double tmpupY
                property double tmpdownY

                onPressed:
                {
                    xmouse=mouseX
                    ymouse=mouseY
                    tmpleftX=graph.leftX
                    tmprightX=graph.rightX
                    tmpupY=graph.upY
                    tmpdownY=graph.downY
                    var l
                    var r
                    var u
                    var d
                    var deltaX
                    var deltaY
                    deltaX=10
                    deltaY=10
                    l=tmpleftX+(deltaX*graph.scaleX)
                    r=tmprightX+(deltaX*graph.scaleX)
                    u=tmpupY+(deltaY/graph.scaleY)
                    d=tmpdownY+(deltaY/graph.scaleY)

                    GraphFunctions.recalculateScales(graph,l,r,u,d)
                    GraphFunctions.testDrawSin(graph)
                    GraphFunctions.drawGraph(graph)

                }

                onMousePositionChanged: {
                   /* var l
                    var r
                    var u
                    var d
                    var deltaX
                    var deltaY
                    deltaX=mouseX-xmouse
                    deltaY=mouseY-ymouse
                    l=leftX+(deltaX*GraphFunctions.scaleX)
                    r=rightX+(deltaX*GraphFunctions.scaleX)
                    u=upY+(deltaY*GraphFunctions.scaleY)
                    d=downY+(deltaY*GraphFunctions.scaleY)

                    GraphFunctions.recalculateScales(graph,l,r,u,d)
                    GraphFunctions.drawGraph(graph)*/

                }

                onClicked: {
                /*    GraphFunctions.recalculateScales(parent,-4,3,1,-2)
                    GraphFunctions.testDrawSin()
                    GraphFunctions.drawGraph(parent)*/

                }
            }
        }
    }
}
