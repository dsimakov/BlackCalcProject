import QtQuick 1.0
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

            id:helpScreen
            width:prediction.width; height:prediction.height

            Flickable {
                id: flickArea
                 anchors.fill: parent
                 contentWidth: container.width; contentHeight: container.height+100
                 flickableDirection: Flickable.VerticalFlick
                 clip: true

                 Rectangle{
                     id: container
                     width:helpScreen.width;
                     height: 300

//funkcja
                     Rectangle {
                         anchors.top: container.top
                               id: setFunctionButton
                               property string functionToDraw: "exp(-x)*sin(1/x)*sin(x)/x"
                               width: parent.width
                               height: main.height / 10

                               Text {
                                   text: "Funkcja. Obecnie: "+parent.functionToDraw
                                   anchors {
                                       left: parent.left; leftMargin: 20
                                       //right: arrowsetGrades.right; rightMargin: 20
                                       verticalCenter: parent.verticalCenter
                                   }
                                   font.pixelSize: main.height / 10 / 3
                                   elide: Text.ElideRight
                               }

                               Rectangle {
                                   width: parent.width
                                   height: 1
                                   color: "#BBBBBB"
                                   anchors.bottom: parent.bottom
                               }

                               MouseArea {
                                   anchors.fill: parent
                                   onClicked: {
                                       if(flickArea.interactive==true){
                                       flickArea.interactive=false;
                                       funcPanel.functions=parent.functionToDraw;
                                       funcPanel.showFunctionPanel();
                                       funcPanel.enabled=true;}
                                   }
                                   onPressed: {
                                       if(flickArea.interactive==true)
                                       clickAnimation0.start()
                                   }
                               }
                           }


                     //Ustaw zakresy
                                          Rectangle {
                                              anchors.top: setFunctionButton.bottom
                                                    id: setFrameButton
                                                    width: parent.width
                                                    height: main.height / 10
                                                    property real leftFrame: -1.0
                                                    property real rightFrame: 1.0
                                                    property real downFrame: -2.0
                                                    property real upFrame: 2.0

                                                    Text {
                                                        text: "Ustaw warunki początkowe. Obecnie: L:"+parent.leftFrame+" P:"+parent.rightFrame+" D:"+parent.downFrame+" G:"+parent.upFrame
                                                        anchors {
                                                            left: parent.left; leftMargin: 20
                                                            verticalCenter: parent.verticalCenter
                                                        }
                                                        font.pixelSize: main.height / 10 / 3
                                                        elide: Text.ElideRight
                                                    }

                                                    Rectangle {
                                                        width: parent.width
                                                        height: 1
                                                        color: "#BBBBBB"
                                                        anchors.bottom: parent.bottom
                                                    }

                                                    MouseArea {
                                                        anchors.fill: parent
                                                        onClicked: {
                                                            if(flickArea.interactive==true){
                                                                flickArea.interactive=false;
                                                                rangePanel.showRangeChooserPanel(setFrameButton.leftFrame,setFrameButton.rightFrame,setFrameButton.downFrame,setFrameButton.upFrame)
                                                            }
                                                        }
                                                        onPressed: {
                                                            if(flickArea.interactive==true)
                                                            clickAnimation2.start()
                                                        }
                                                    }
                                                }



                                          //rysuj wykres

                     Rectangle {
                         anchors.top: setFrameButton.bottom
                               id: drawButton
                               width: parent.width
                               height: main.height / 10

                               Text {
                                   text: "Przejdź do rysowania wykresu"
                                   anchors {
                                       left: parent.left; leftMargin: 20
                                       right: arrowPrediction.right; rightMargin: 20
                                       verticalCenter: parent.verticalCenter
                                   }
                                   font.pixelSize: main.height / 10 / 3
                                   elide: Text.ElideRight
                               }

                               Image {
                                   id: arrowPrediction
                                   source: "images/arrow.png"
                                   anchors {
                                       verticalCenter: parent.verticalCenter
                                       right: parent.right; rightMargin: 20
                                   }
                               }

                               Rectangle {
                                   width: parent.width
                                   height: 1
                                   color: "#BBBBBB"
                                   anchors.bottom: parent.bottom
                               }

                               MouseArea {
                                   anchors.fill: parent
                                   onClicked: {
                                       if(flickArea.interactive==true){
                                           draw()
                                       }
                                   }
                                   onPressed: {
                                       if(flickArea.interactive==true)
                                       clickAnimation.start()
                                   }
                                }
                       }
                 }
            }
        }
    }


    SequentialAnimation{
        id: clickAnimation
        PropertyAnimation {target: drawButton; properties: "color"; to: "steelblue"; duration: 100}
      PropertyAnimation {target: drawButton; properties: "color"; to: "white"; duration: 1500}
    }
    SequentialAnimation{
        id: clickAnimation0
        PropertyAnimation {target: setFunctionButton; properties: "color"; to: "steelblue"; duration: 100}
      PropertyAnimation {target: setFunctionButton; properties: "color"; to: "white"; duration: 1500}
    }

  SequentialAnimation{
      id: clickAnimation2
      PropertyAnimation {target: setFrameButton; properties: "color"; to: "steelblue"; duration: 100}
    PropertyAnimation {target: setFrameButton; properties: "color"; to: "white"; duration: 1500}
  }

  DrawFunctionChooser{
      id: funcPanel
      backgroundcolor: "#b7c4c8"
      visible: false
      onButtonClicked: {
        setFunctionButton.functionToDraw=funcText
          flickArea.interactive=true
  }
}

StartRangeChooser{
      id: rangePanel
      backgroundcolor: "#b7c4c8"
      visible: false
      onButtonClicked: {
setFrameButton.leftFrame=l
setFrameButton.rightFrame=r
setFrameButton.downFrame=d
setFrameButton.upFrame=u
          flickArea.interactive=true
  }
}


    // Item clicked on the list.
    function draw() {

            var component = Qt.createComponent("DrawingScreen.qml");
            if (component.status == Component.Ready) {
                var functionscreen = component.createObject(main);
                functionscreen.titleText = "Wykres"
                functionscreen.previousScreen = screen
                functionscreen.state = "visible"
                functionscreen.show(setFunctionButton.functionToDraw,setFrameButton.leftFrame,setFrameButton.rightFrame,setFrameButton.downFrame,setFrameButton.upFrame);
                screen.state = "before"


        }
    }


    function changeStartRange() {

    }
}
