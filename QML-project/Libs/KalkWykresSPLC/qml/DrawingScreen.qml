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

    function show(functionString,frameLeft,frameRight,frameDown,frameUp) {
        frameLeftActive=frameLeft
        frameRightActive=frameRight
        frameDownActive=frameDown
        frameUpActive=frameUp
        errorRect.visible=false;
        diagonalLine.functionToDraw=functionString;
        diagonalLine.recalculateScales(rect.width,rect.height,frameLeft,frameRight,frameDown,frameUp); //prepare window
        diagonalLine.initFrameArray(rect.width);
        GraphFunctions.prepareFrameList(rect.width,diagonalLine.functionToDraw);
        }
    property double frameLeftActive
    property double frameRightActive
    property double frameDownActive
    property double frameUpActive
    property bool blockZoom: false

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

                    //liczenie nowych pozycji ramki
                    var i;
                    if(deltaX>0)//przesuniecie w lewo
                    {//dodajemy pkty z prawej strony
                        var right=diagonalLine.axisSizeToPixelX(diagonalLine.getRightX())-deltaX
                        for(i=0;i<deltaX;++i)
                        {

                            diagonalLine.addRightPoint(GraphFunctions.recalc(diagonalLine.functionToDraw,right))
                            right++;
                        }
                    }
                    else if(deltaX<0)//przesunięcie w prawo
                    {//dodajemy pkty z lewej strony
                        var left=diagonalLine.axisSizeToPixelX(diagonalLine.getLeftX())-deltaX
                        for(i=0;i<-deltaX;++i)
                        {
                            diagonalLine.addLeftPoint(GraphFunctions.recalc(diagonalLine.functionToDraw,left))
                            left--;
                        }
                    }
                    //diagonalLine.drawFrameList(width)

                    drawArea.xmouse=mouseX
                    drawArea.ymouse=mouseY


                }
            }
        }
    }

    Rectangle{
        id:errorRect
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

    Rectangle{
        id:zoomContainer
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width/5
        height: parent.height/4
        color: "transparent"
    Rectangle{
        id:zoom
        width: zoomContainer.width-20
        height: zoomContainer.height-20
        property int ew: (width)/2
        property int eh: (height)/4

        Column { /* inner column */
            width: parent.width
            height: parent.height
                Row { /* inner row */
                        Rectangle { width: 2*zoom.ew+10; height: zoom.eh; color: "transparent"
                            Text {anchors.centerIn: parent
                                id: zoomText
                                text: qsTr("zoom")
                                font.pixelSize: parent.height*0.9
                            }}

                      }
                Row { /* inner row */
                        spacing:10
                        Rectangle { width: zoom.ew; height: zoom.eh; border.color: "black";  color: "steelblue"; radius: 5
                            Text {anchors.centerIn: parent
                                text: qsTr("+")
                                font.pixelSize: parent.height*0.9
                            }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(blockZoom==false){
                                    blockZoom=true;
                                frameLeftActive/=2.0
                                frameRightActive/=2.0
                                diagonalLine.recalculateScales(rect.width,rect.height,frameLeftActive,frameRightActive,frameDownActive,frameUpActive);
                                GraphFunctions.prepareFrameList(rect.width,diagonalLine.functionToDraw);
                                    blockZoom=false;

                                }

                                }
                        }}
                        Rectangle { width: zoom.ew; height: zoom.eh; border.color: "black";  color: "steelblue"; radius: 5
                            Text {anchors.centerIn: parent
                                text: qsTr("+")
                                font.pixelSize: parent.height*0.9
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    if(blockZoom==false){
                                        blockZoom=true;
                                    frameUpActive/=2.0
                                    frameDownActive/=2.0
                                    diagonalLine.recalculateScales(rect.width,rect.height,frameLeftActive,frameRightActive,frameDownActive,frameUpActive);
                                    GraphFunctions.prepareFrameList(rect.width,diagonalLine.functionToDraw);
                                        blockZoom=false;
                                    }
                                    }
                            }}

                      }
                Row { /* inner row */
                    spacing:10
                        Rectangle { width: zoom.ew; height: zoom.eh;  color: "transparent"
                            Text {anchors.centerIn: parent
                                id: xText
                                text: qsTr("X")
                                font.pixelSize: parent.height*0.9
                            }}
                        Rectangle { width: zoom.ew; height: zoom.eh;  color: "transparent"
                            Text {anchors.centerIn: parent
                                id: yText
                                text: qsTr("Y")
                                font.pixelSize: parent.height*0.9
                            }}
                }
                Row { /* inner row */
                    spacing:10
                        Rectangle { width: zoom.ew; height: zoom.eh; border.color: "black";  color: "steelblue"; radius: 5
                            Text {anchors.centerIn: parent
                                text: qsTr("-")
                                font.pixelSize: parent.height*0.9
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    if(blockZoom==false){
                                        blockZoom=true;
                                    frameLeftActive*=2.0
                                    frameRightActive*=2.0
                                    diagonalLine.recalculateScales(rect.width,rect.height,frameLeftActive,frameRightActive,frameDownActive,frameUpActive);
                                    GraphFunctions.prepareFrameList(rect.width,diagonalLine.functionToDraw);
                                        blockZoom=false;
                                    }
                                }
                            }}
                        Rectangle { width: zoom.ew; height: zoom.eh; border.color: "black";  color: "steelblue"; radius: 5
                            Text {anchors.centerIn: parent
                                text: qsTr("-")
                                font.pixelSize: parent.height*0.9
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    if(blockZoom==false){
                                        blockZoom=true;
                                    frameUpActive*=2.0
                                    frameDownActive*=2.0
                                    diagonalLine.recalculateScales(rect.width,rect.height,frameLeftActive,frameRightActive,frameDownActive,frameUpActive);
                                    GraphFunctions.prepareFrameList(rect.width,diagonalLine.functionToDraw);

                                    blockZoom=false;}
                                                                    }
                            }}
                }
        }
        color: "transparent"
        radius: 5;
        visible:true

}
    }
}
