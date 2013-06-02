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

    WorkerScript
    {
        id:test
        source: "drawWorker.js"
        onMessage: {
            if(messageObject.error==true)
            {
                waitCircle.visible=false
                errorRect.visible=true;
            }

            if(messageObject.end==false){
            //console.log("add point(" + messageObject.i+","+messageObject.y+")");
            diagonalLine.addPoint(messageObject.i,messageObject.y);
                waitCircleText.text=messageObject.percent+"%"
            }
            else
            {
                waitCircle.visible=false
                diagonalLine.updateCanvas()
            }
        }

    }

    function show(functionString,frameLeft,frameRight,frameDown,frameUp,drawMinX,drawMaxX) {
        waitCircle.visible=true;
        frameLeftActive=frameLeft
        frameRightActive=frameRight
        frameDownActive=frameDown
        frameUpActive=frameUp
        drawMinXActive=drawMinX
        drawMaxXActive=drawMaxX
        errorRect.visible=false;
        diagonalLine.functionToDraw=functionString;
        diagonalLine.recalculateScales(rect.width,rect.height,frameLeft,frameRight,frameDown,frameUp); //prepare window
        var entryPixelLeftX=diagonalLine.axisSizeToPixelX(drawMinX);
        var endPixelRightX=diagonalLine.axisSizeToPixelX(drawMaxX);
        test.sendMessage({functionToDraw:diagonalLine.functionToDraw,min:entryPixelLeftX,max:endPixelRightX,ax:diagonalLine.pixelToAxisSizeX(1), ay:diagonalLine.axisSizeToPixelY2(1.0)})

        //GraphFunctions.drawGraph(diagonalLine.functionToDraw,drawMinX,drawMaxX); //count points
        }
    property double frameLeftActive
    property double frameRightActive
    property double frameDownActive
    property double frameUpActive
    property double drawMinXActive
    property double drawMaxXActive
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
                    drawArea.xmouse=mouseX
                    drawArea.ymouse=mouseY


                }
            }
        }
    }

    Rectangle{
        id:waitCircle
        anchors.centerIn: parent
        width: parent.width/2
        height: parent.height/2
        Column{
            width: parent.width
            height: parent.height
            Row{
                Rectangle { width: waitCircle.width; height: waitCircle.height/3; color: "transparent"
                    Text {anchors.centerIn: parent
                        id: waitText
                        text: qsTr("Proszę czekać...")
                        font.pixelSize: waitCircle.height*0.1
                    }

            }
            }
            Row{
                Rectangle { width: waitCircle.width; height: waitCircle.height/3; color: "transparent"
                    Text {anchors.centerIn: parent
                        id: waitCircleText
                        text: qsTr("0%")
                        font.pixelSize: waitCircle.height*0.1
                    }

            }
            }
            Row{
                Rectangle { width: waitCircle.width; height: waitCircle.height/3; color: "transparent"
                    AnimatedImage {
                            source: "images/busy.gif"
                            anchors.centerIn: parent
                        }
            }
            }
        }



        color: "white"
        radius: 5;
        visible:false

        onVisibleChanged: {waitCircleText.text="0%"}
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
                                waitCircle.visible=true;
                                var entryPixelLeftX=diagonalLine.axisSizeToPixelX(drawMinXActive);
                                var endPixelRightX=diagonalLine.axisSizeToPixelX(drawMaxXActive);
                                diagonalLine.clearCanvas();
                                test.sendMessage({functionToDraw:diagonalLine.functionToDraw,min:entryPixelLeftX,max:endPixelRightX,ax:diagonalLine.pixelToAxisSizeX(1), ay:diagonalLine.axisSizeToPixelY2(1.0)})
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
                                    waitCircle.visible=true;
                                    var entryPixelLeftX=diagonalLine.axisSizeToPixelX(drawMinXActive);
                                    var endPixelRightX=diagonalLine.axisSizeToPixelX(drawMaxXActive);
                                    diagonalLine.clearCanvas();
                                    test.sendMessage({functionToDraw:diagonalLine.functionToDraw,min:entryPixelLeftX,max:endPixelRightX,ax:diagonalLine.pixelToAxisSizeX(1), ay:diagonalLine.axisSizeToPixelY2(1.0)})
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
                                    waitCircle.visible=true;
                                    var entryPixelLeftX=diagonalLine.axisSizeToPixelX(drawMinXActive);
                                    var endPixelRightX=diagonalLine.axisSizeToPixelX(drawMaxXActive);
                                    diagonalLine.clearCanvas();
                                    test.sendMessage({functionToDraw:diagonalLine.functionToDraw,min:entryPixelLeftX,max:endPixelRightX,ax:diagonalLine.pixelToAxisSizeX(1), ay:diagonalLine.axisSizeToPixelY2(1.0)})
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
                                    waitCircle.visible=true;
                                    var entryPixelLeftX=diagonalLine.axisSizeToPixelX(drawMinXActive);
                                    var endPixelRightX=diagonalLine.axisSizeToPixelX(drawMaxXActive);
                                    diagonalLine.clearCanvas();
                                    test.sendMessage({functionToDraw:diagonalLine.functionToDraw,min:entryPixelLeftX,max:endPixelRightX,ax:diagonalLine.pixelToAxisSizeX(1), ay:diagonalLine.axisSizeToPixelY2(1.0)})
                                        blockZoom=false;
                                    }
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
