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
                                                    id: setRangeButton
                                                    property int number: 1
                                                    width: parent.width
                                                    height: main.height / 10
                                                    property real leftFrame: -5.0
                                                    property real rightFrame: 5.0
                                                    property real downFrame: -2.0
                                                    property real upFrame: 2.0
                                                    property real minXGraph: -10.0
                                                    property real maxXGraph: 10.0

                                                    Text {
                                                        text: "Ustaw warunki początkowe. Obecnie: L:"+parent.leftFrame+" P:"+parent.rightFrame+" D:"+parent.downFrame+" G:"+parent.upFrame+" zakres <"+parent.minXGraph+","+parent.maxXGraph+">"
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
                                       if(flickArea.interactive==true)
                                       draw()
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

  FunctionPanel{
      id: funcPanel
      backgroundcolor: "#b7c4c8"
      visible: false
      onButtonClicked: {
        setFunctionButton.functionToDraw=funcText
          flickArea.interactive=true
  }
}

  RangeChooser{
      id: rangePanel
      backgroundcolor: "#b7c4c8"
      visible: false
      onButtonClicked: {

          flickArea.interactive=true
  }
}


  ChangeGradePanel{
    id:changeGradePanel
    onButtonClicked: {
        helpScreen.enabled=true
        switch (changedItem)
        {
        case 0:
            setStudyGradesButton.grade=Math.round(grade*100)/100
            break
        case 1:
            setWorkGradesButton.grade=Math.round(grade*100)/100
            break
        case 2:
            setPresentationGradesButton.grade=Math.round(grade*100)/100
            break
        }
    }

  anchors.centerIn : parent
  backgroundcolor: "#b7c4c8"
  visible: false
  text: "Ustawianie ocen"
  }



    // Item clicked on the list.
    function draw() {
            var component = Qt.createComponent("DrawingScreen.qml");
            if (component.status == Component.Ready) {
                var predicitionScreen = component.createObject(main);
                predicitionScreen.titleText = "Wykres"
                predicitionScreen.previousScreen = screen
                predicitionScreen.state = "visible"
                predicitionScreen.show(setFunctionButton.functionToDraw,setRangeButton.leftFrame,setRangeButton.rightFrame,setRangeButton.downFrame,setRangeButton.upFrame,setRangeButton.minXGraph,setRangeButton.maxXGraph);
                screen.state = "before"

        }
    }


    function changeStartRange() {

    }
}
