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
                                                                rangePanel.showRangeChooserPanel()
                                                            }
                                                        }
                                                        onPressed: {
                                                            if(flickArea.interactive==true)
                                                            clickAnimation2.start()
                                                        }
                                                    }
                                                }

                                          Rectangle {
                                              anchors.top: setFrameButton.bottom
                                                    id: setRangeButton
                                                    width: parent.width
                                                    height: main.height / 10

                                                    property real minXGraph: -10
                                                    property real maxXGraph: 10

                                                    Text {
                                                        text: "Ustaw warunki początkowe. Obecnie: zakres <"+parent.minXGraph+","+parent.maxXGraph+">"
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
                                                                graphRangePanel.showRangeChooserPanel()
                                                            }
                                                        }
                                                        onPressed: {
                                                            if(flickArea.interactive==true)
                                                            clickAnimation1.start()
                                                        }
                                                    }
                                                }

                                          //rysuj wykres

                     Rectangle {
                         anchors.top: setRangeButton.bottom
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
                                           wait.visible=true;
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
      id: clickAnimation1
      PropertyAnimation {target: setRangeButton; properties: "color"; to: "steelblue"; duration: 100}
    PropertyAnimation {target: setRangeButton; properties: "color"; to: "white"; duration: 1500}
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

          flickArea.interactive=true
  }
}

GraphRangeChooser{
      id: graphRangePanel
      backgroundcolor: "#b7c4c8"
      visible: false
      onButtonClicked: {

          flickArea.interactive=true
  }
}


  Rectangle{
      id:wait
      anchors.centerIn: parent
      width: parent.width/2
      height: parent.height/2

      property int ew: (width)/2
      property int eh: (height)/4






      Column { /* inner column */
          width: parent.width
          height: parent.height
              Row { /* inner row */
                      Rectangle { width: 2*wait.ew+10; height: wait.eh; color: "transparent"
                          Text {anchors.centerIn: parent
                              id: zoomText
                              text: qsTr("To może zająć dużo czasu")
                              font.pixelSize: parent.height*0.5
                          }}

                    }
              Row { /* inner row */
                      spacing:10
                      Rectangle { id: drawOKButton; width: wait.ew; height: wait.eh; border.color: "black";  color: "steelblue"; radius: 5
                          Text {
                              id:executeButtonText
                              anchors.centerIn: parent
                              text: qsTr("Wykonaj")
                              font.pixelSize: parent.height*0.5
                          }
                      MouseArea{
                          anchors.fill: parent
                          onPressed: {
                              drawOKButton.color="grey"
                          }

                          onReleased: {
                              drawOKButton.color="steelblue"
                          }

                          onClicked: {
                              draw()
                          }
                      }}
                      Rectangle { id: drawCancelButton;width: wait.ew; height: wait.eh; border.color: "black";  color: "steelblue"; radius: 5
                          Text {anchors.centerIn: parent
                              text: qsTr("Anuluj")
                              font.pixelSize: parent.height*0.5
                          }
                          MouseArea{
                              anchors.fill: parent
                              onPressed: {
                                  drawCancelButton.color="grey"
                              }

                              onReleased: {
                                  drawCancelButton.color="steelblue"
                              }
                              onClicked: {
                                  wait.visible=false}
                          }}

                    }

      }
      color: "white"
      radius: 5;
      visible:false

  }



    // Item clicked on the list.
    function draw() {

            var component = Qt.createComponent("DrawingScreen.qml");
            if (component.status == Component.Ready) {
                var functionscreen = component.createObject(main);
                functionscreen.titleText = "Wykres"
                functionscreen.previousScreen = screen
                functionscreen.state = "visible"
                functionscreen.show(setFunctionButton.functionToDraw,setFrameButton.leftFrame,setFrameButton.rightFrame,setFrameButton.downFrame,setFrameButton.upFrame,setRangeButton.minXGraph,setRangeButton.maxXGraph);
                screen.state = "before"


        }
            wait.visible=false;
    }


    function changeStartRange() {

    }
}
