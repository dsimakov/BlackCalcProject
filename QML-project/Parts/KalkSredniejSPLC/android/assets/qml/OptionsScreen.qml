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

//Średnia ocen z toku studiów
                     Rectangle {
                         anchors.top: container.top
                               id: setStudyGradesButton
                               property int number: 0
                               width: parent.width
                               height: main.height / 10
                               property real grade: 3.0

                               Text {
                                   text: "Ustaw średnią ocen z toku studiów. Obecnie: "+parent.grade.toString()
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
                                       changeGrade(parent)
                                   }
                                   onPressed: {
                                       clickAnimation0.start()
                                   }
                               }
                           }


                     //Średnia ocen z pracy
                                          Rectangle {
                                              anchors.top: setStudyGradesButton.bottom
                                                    id: setWorkGradesButton
                                                    property int number: 1
                                                    width: parent.width
                                                    height: main.height / 10
                                                    property real grade: 3.0

                                                    Text {
                                                        text: "Ustaw ocenę z pracy. Obecnie: "+parent.grade.toString()
                                                        anchors {
                                                            left: parent.left; leftMargin: 20
                                                            //right: arrowsetWorkGrades.right; rightMargin: 20
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
                                                            changeGrade(parent)
                                                        }
                                                        onPressed: {
                                                            clickAnimation1.start()
                                                        }
                                                    }
                                                }

                                          //Średnia ocen z prezentacji
                                          Rectangle {
                                              anchors.top: setWorkGradesButton.bottom
                                                    id: enablePresentationButton
                                                    width: parent.width
                                                    height: main.height / 10

                                                    Text {
                                                        text:(setPresentationGradesButton.grade==0.0? "Uruchom tryb kalkulatora magisterskiego.":"Wyłącz tryb kalkulatora magisterskiego.")
                                                        anchors {
                                                            left: parent.left; leftMargin: 20
                                                            //right: arrowsetExamGrades.right; rightMargin: 20
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
                                                            if(setPresentationGradesButton.grade==0.0)
                                                                setPresentationGradesButton.grade=3.0
                                                            else
                                                                setPresentationGradesButton.grade=0.0
                                                        }
                                                        onPressed: {
                                                            clickAnimationEnablePresentation.start()
                                                        }
                                                    }
                                                }
                                                               Rectangle {
                                                                   anchors.top: enablePresentationButton.bottom
                                                                         id: setPresentationGradesButton
                                                                         property int number: 2
                                                                         width: parent.width
                                                                         height: main.height / 10
                                                                         property real grade: 0.0

                                                                         Text {
                                                                             text: "Ustaw ocenę z prezentacji. Obecnie: "+(parent.grade===0.0? "brak, egzamin inżynierski":parent.grade.toString())
                                                                             anchors {
                                                                                 left: parent.left; leftMargin: 20
                                                                                 //right: arrowsetExamGrades.right; rightMargin: 20
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
                                                                                 changeGrade(parent)
                                                                             }
                                                                             onPressed: {
                                                                                 clickAnimation2.start()
                                                                             }
                                                                         }
                                                                     }
                     Rectangle {
                         anchors.top: setPresentationGradesButton.bottom
                               id: predictionButton
                               width: parent.width
                               height: main.height / 10

                               Text {
                                   text: "Przejdź do kroku predykcji ocen"
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
                                       itemSelected(setStudyGradesButton.grade,setWorkGradesButton.grade,setPresentationGradesButton.grade)
                                   }
                                   onPressed: {
                                       clickAnimation.start()
                                   }
                               }
                           }




                 }
            }
        }
    }


  SequentialAnimation{
      id: clickAnimation0
      PropertyAnimation {target: setStudyGradesButton; properties: "color"; to: "steelblue"; duration: 100}
    PropertyAnimation {target: setStudyGradesButton; properties: "color"; to: "white"; duration: 1500}
  }

  SequentialAnimation{
      id: clickAnimation1
      PropertyAnimation {target: setWorkGradesButton; properties: "color"; to: "steelblue"; duration: 100}
    PropertyAnimation {target: setWorkGradesButton; properties: "color"; to: "white"; duration: 1500}
  }

  SequentialAnimation{
      id: clickAnimation2
      PropertyAnimation {target: setPresentationGradesButton; properties: "color"; to: "steelblue"; duration: 100}
    PropertyAnimation {target: setPresentationGradesButton; properties: "color"; to: "white"; duration: 1500}
  }

  SequentialAnimation{
      id: clickAnimationEnablePresentation
      PropertyAnimation {target: enablePresentationButton; properties: "color"; to: "steelblue"; duration: 100}
    PropertyAnimation {target: enablePresentationButton; properties: "color"; to: "white"; duration: 1500}
  }

  SequentialAnimation{
      id: clickAnimation
      PropertyAnimation {target: predictionButton; properties: "color"; to: "steelblue"; duration: 100}
    PropertyAnimation {target: predictionButton; properties: "color"; to: "white"; duration: 1500}
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
    // Show either sub-list or the details screen
    function itemSelected(studygrade,workgrade,presentationgrade) {
            var component = Qt.createComponent("PredictionScreen.qml");
        var predictionText="Wyniki predykcji przeprowadzonej z podanych danych<br><table border=\"1\">";
        predictionText+="<tr>"
        predictionText+="<td>Ocena pytania nr 1</td>"
        predictionText+="<td>Ocena pytania nr 2</td>"
        predictionText+="<td>Ocena pytania nr 3</td>"
        predictionText+="<td>Ocena koncowa</td>"
        predictionText+="</tr>"
        var startj,startk
        startj=startk=3
        for(var i=3;i<=5;i+=0.5)
        {
            for(var j=startj;j<=5;j+=0.5)
            {
                for(var k=startk;k<=5;k+=0.5)
                {
                    var endGrade=0.0
                    endGrade=0.5*studygrade
                    if (presentationgrade==0)
                        endGrade+=0.25*workgrade
                    else
                        endGrade+=0.25*((workgrade+presentationgrade)/2)
                    endGrade+=0.25*((i+j+k)/3)
                    endGrade=Math.round(endGrade*100)/100
                    predictionText+="<tr>"
                    predictionText+="<td>"+i.toString()+"</td>"
                    predictionText+="<td>"+j.toString()+"</td>"
                    predictionText+="<td>"+k.toString()+"</td>"

                    predictionText+="<td>"+endGrade.toString()+"</td>"
                    predictionText+="</tr>"

                }
                startk+=0.5
                if (startk>5)
                    startk=5.0
            }
            startj+=0.5

            if (startj>5)
                startj=5.0
        }
        predictionText+="</table>"
            if (component.status == Component.Ready) {
                var predicitionScreen = component.createObject(main);
                predicitionScreen.titleText = "Predykcja"
                predicitionScreen.previousScreen = screen
                predicitionScreen.state = "visible"
                predicitionScreen.text=predictionText
                screen.state = "before"

        }
    }


    function changeGrade(component) {
        var componentToSet=component
        changeGradePanel.changedItem=component.number
           changeGradePanel.visible=true
        changeGradePanel.grade=Math.round(componentToSet.grade*100)/100
        changeGradePanel.mostSignificantGrade = changeGradePanel.grade.toString()[0]
        var lsg = parseInt(changeGradePanel.mostSignificantGrade)
        var LSG = Math.round((changeGradePanel.grade-lsg)*100)
        changeGradePanel.leastSignificantGrade = LSG.toString()
       // helpScreen.enabled=false

    }
}
