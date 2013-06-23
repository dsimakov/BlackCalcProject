import QtQuick 1.0
import "fill_list.js" as Script
/*
 * Screen including ListView with selectable items.
 *
 */
Screen {
    id: screen
    // Normal state button gradient
    Gradient {
        id: normal
        GradientStop { position: 0.5; color: "#7690B3" }
        GradientStop { position: 0.7; color: "#4A6C9B" }
        GradientStop { position: 1.0; color: "#4A6C9B" }
    }

    // Selected button gradient
    Gradient {
        id: selected
        GradientStop { position: 0.5; color: "#6B93E7" }
        GradientStop { position: 0.7; color: "#2463DE" }
        GradientStop { position: 1.0; color: "#2463DE" }
    }


    Rectangle {
        id: prediction
        anchors.top: topBarBottom
        width:parent.width
        height: parent.height- (parent.height / 11)
color: "transparent"
        Rectangle{
            color: "transparent"
            id: addgrade
            anchors.top:parent.top
            anchors.left: parent.left
            width: parent.width/5
            height: parent.height

            Rectangle{
                id: graderectangle
                property double grade: 3.0
                width: parent.width
                height: (parent.height / 6)+addgrade.height/10
                color: "transparent"
                Text {
                    id: gradetext
                    text: qsTr("Podaj ocenę:")
                    anchors.centerIn: parent
                    height: parent.height / 4
                    font.pixelSize: parent.height / 6
                }
                Rectangle{
                    anchors.top: gradetext.bottom
                    width: parent.width
                    height: addgrade.height/10
                    color: "transparent"

                    Rectangle{
                        id:ocenaminus
                        height: parent.height
                        width: parent.width/3
                        color: "transparent"

                        Rectangle{
                            width: 0.8*parent.width
                            height: 0.8*parent.height
                            gradient: normal
                            radius: 10
                            anchors.centerIn: parent
                            color: "transparent"
                            Text {
                                text: "-"
                                anchors.centerIn: parent
                                font.pixelSize: parent.height / 2
                                textFormat: Text.RichText
                            }
                            MouseArea{
                                anchors.fill: parent
                                property int interval: 500
                                onPressed: {
                                    if(graderectangle.grade>0.0)
                                        graderectangle.grade-=0.5
                                    minusgradetimer.running=true
                                    parent.gradient = selected
                                }
                                onReleased: {
                                    minusgradetimer.running=false
                                    parent.gradient = normal
                                }

                                Timer {
                                    id:minusgradetimer
                                         interval: 500; running: false; repeat: true
                                         onTriggered: {
                                             if(graderectangle.grade>0.0)
                                                 graderectangle.grade-=0.5
                                             if(interval>100)
                                                interval*=0.8
                                         }
                                         onRunningChanged:interval=500
                                     }


                            }

                        }


                    }
                    Rectangle{
                        id:ocena
                        anchors.left: ocenaminus.right
                        height: parent.height
                        width: parent.width/3
                        color: "transparent"

                        Text {
                            id: gradetextshow
                            text: graderectangle.grade.toString()
                            anchors.centerIn: parent
                            height: parent.height/2
                            font.pixelSize: parent.height/2
                        }
                    }
                    Rectangle{
                        id:ocenaplus
                        anchors.left: ocena.right
                        height: parent.height
                        width: parent.width/3
                        color: "transparent"









                        Rectangle{
                            width: 0.8*parent.width
                            height: 0.8*parent.height
                            gradient: normal
                            radius: 10
                            anchors.centerIn: parent
                            color: "transparent"
                            Text {
                                text: "+"
                                anchors.centerIn: parent
                                font.pixelSize: parent.height / 2
                                textFormat: Text.RichText
                            }
                            MouseArea{
                                anchors.fill: parent
                                property int interval: 500
                                onPressed: {
                                    if(graderectangle.grade<6.0)
                                        graderectangle.grade+=0.5
                                    plusgradetimer.running=true
                                    parent.gradient = selected
                                }
                                onReleased: {
                                    plusgradetimer.running=false
                                    parent.gradient = normal
                                }

                                Timer {
                                    id:plusgradetimer
                                         interval: 500; running: false; repeat: true
                                         onTriggered: {
                                             if(graderectangle.grade<6.0)
                                                 graderectangle.grade+=0.5
                                             if(interval>100)
                                                interval*=0.8
                                         }
                                         onRunningChanged:interval=500
                                     }
                            }
                        }
                    }
                }
            }

            Rectangle{
                id: weightrectangle
                property int weight: 0
                anchors.top:graderectangle.bottom
                width: parent.width
                height: (parent.height / 6)+addgrade.height/10
                color: "transparent"
                Text {
                    id: weighttext
                    text: qsTr("Podaj wagę:")
                    anchors.centerIn: parent
                    height: parent.height / 4
                    font.pixelSize: parent.height / 6
                }
                Rectangle{
                    anchors.top: weighttext.bottom
                    width: parent.width
                    height: addgrade.height/10
                    color: "transparent"
                    Rectangle{
                        id:wagaminus
                        height: parent.height
                        width: parent.width/3
                        color: "transparent"

                        Rectangle{
                            width: 0.8*parent.width
                            height: 0.8*parent.height
                            gradient: normal
                            radius: 10
                            anchors.centerIn: parent
                            color: "transparent"
                            Text {
                                text: "-"
                                anchors.centerIn: parent
                                font.pixelSize: parent.height / 2
                                textFormat: Text.RichText
                            }
                            MouseArea{
                                anchors.fill: parent
                                property int interval: 500
                                onPressed: {
                                    if(weightrectangle.weight>0)
                                        weightrectangle.weight-=1
                                    minusweighttimer.running=true
                                    parent.gradient = selected
                                }
                                onReleased: {
                                    minusweighttimer.running=false
                                    parent.gradient = normal
                                }

                                Timer {
                                    id:minusweighttimer
                                         interval: 500; running: false; repeat: true
                                         onTriggered: {
                                             if(weightrectangle.weight>0)
                                                 weightrectangle.weight-=1
                                             if(interval>100)
                                                interval*=0.8
                                         }
                                         onRunningChanged:interval=500
                                     }
                            }
                        }


                    }
                    Rectangle{
                        id:waga
                        anchors.left: wagaminus.right
                        height: parent.height
                        width: parent.width/3
                        color: "transparent"
                        Text {
                            text: weightrectangle.weight.toString()
                            anchors.centerIn: parent
                            height: parent.height/2
                            font.pixelSize: parent.height/2
                        }
                    }
                    Rectangle{
                        id:wagaplus
                        anchors.left: waga.right
                        height: parent.height
                        width: parent.width/3
                        color: "transparent"


                        Rectangle{
                            width: 0.8*parent.width
                            height: 0.8*parent.height
                            gradient: normal
                            radius: 10
                            anchors.centerIn: parent
                            color: "transparent"
                            Text {
                                text: "+"
                                anchors.centerIn: parent
                                font.pixelSize: parent.height / 2
                                textFormat: Text.RichText
                            }
                            MouseArea{
                                anchors.fill: parent
                                property int interval: 500
                                onPressed: {
                                    if(weightrectangle.weight<30)
                                        weightrectangle.weight+=1
                                    plusweighttimer.running=true
                                    parent.gradient = selected
                                }
                                onReleased: {
                                    plusweighttimer.running=false
                                    parent.gradient = normal
                                }

                                Timer {
                                    id:plusweighttimer
                                         interval: 500; running: false; repeat: true
                                         onTriggered: {
                                             if(weightrectangle.weight<30)
                                                 weightrectangle.weight+=1
                                             if(interval>100)
                                                interval*=0.8
                                         }
                                         onRunningChanged:interval=500
                                     }
                            }
                        }

                    }
                }
            }



            Rectangle{
                id: addrectangle
                width: parent.width
                height: (parent.height / 6)
                radius: 10
                anchors.top:weightrectangle.bottom
                color: "transparent"

                Rectangle{
                    width: 0.8*parent.width
                    height: 0.8*parent.height
                    gradient: normal
                    radius: 10
                    anchors.centerIn: parent
                    color: "transparent"
                    Text {
                        text: "Dodaj ocenę"
                        anchors.centerIn: parent
                        font.pixelSize: weightrectangle.height/6
                        textFormat: Text.RichText
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            Script.addGrade(graderectangle.grade,weightrectangle.weight)
                            Script.makeList(list_model_id)
                            parent.gradient = selected
                        }
                        onReleased: {
                            parent.gradient = normal
                        }


                    }
                }
            }

            Rectangle{
                id: clearrectangle
                width: parent.width
                height: (parent.height / 6)
                radius: 10
                anchors.top:addrectangle.bottom
                color: "transparent"

                Rectangle{
                    width: 0.8*parent.width
                    height: 0.8*parent.height
                    gradient: normal
                    radius: 10
                    anchors.centerIn: parent
                    color: "transparent"
                    Text {
                        text: "Wyczyść"
                        anchors.centerIn: parent
                        font.pixelSize: weightrectangle.height/6
                        textFormat: Text.RichText
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            Script.clearGradeList()
                            Script.makeList(list_model_id)
                            parent.gradient = selected
                        }
                        onReleased: {
                            parent.gradient = normal
                        }


                    }
                }
            }

        }
        Rectangle{
            id: listgrade
            anchors.top:parent.top
            anchors.left: addgrade.right
            width: 4*parent.width/5
            height: parent.height
            color: "transparent"

            Rectangle{
                id: list
                anchors.top:parent.top
                width: parent.width
                height: 9*parent.height/10
                color: "transparent"

                Text {
                    id: bkgtext
                    text: "Lista ocen"
                    anchors.centerIn: parent
                    font.pixelSize: parent.height / 4
                    opacity: 0.5
                }


                ListView {
                    id: listview

                    property bool scrolled: false
                    width: parent.width
                    height: parent.height
                    anchors.top:parent.top

                    model: ListModel { id: list_model_id }
                    delegate: listDelegate
                    clip: true
                    cacheBuffer: height * 2

                    onMovementStarted: { scrolled = true; currentIndex = -1;}
                    onMovementEnded: { scrolled = false }
                    onCountChanged: { currentIndex = -1 }

                    // ScrollBar component attached to the list
                    ScrollBar { list: listview }


                }
                Component {
                    id: listDelegate


                    Rectangle {
                        id: background
                        width: ListView.view.width
                        height: ListView.view.height / 10
                        gradient: list.currentIndex == index && !list.scrolled ? selected : null

                        Text {
                            id: gradelistcomponenttext
                            text: key == null ? "" : key
                            anchors {
                                left: parent.left; leftMargin: 20
                                rightMargin: 20
                                verticalCenter: parent.verticalCenter
                            }
                            font.pixelSize: parent.height / 3
                            elide: Text.ElideRight
                        }

                        Text {
                            id:helptext
                            text: "Naciśnij by usunąć"
                            anchors {
                                leftMargin: 20
                                right: arrow.left; rightMargin: 20
                                verticalCenter: parent.verticalCenter
                            }
                            font.pixelSize: parent.height / 4
                            opacity: 0.4
                        }

                        Image {
                            id: arrow
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
                                console.log("Clicked element: "+index.toString())
                                Script.deleteGrade(index)
                                Script.makeList(list_model_id)

                            }
                            onPressed: {
                                clickAnimation.start()
                            }
                        }
                        SequentialAnimation{
                            id: clickAnimation
                            PropertyAnimation {target: background; properties: "color"; to: "steelblue"; duration: 100}
                          PropertyAnimation {target: background; properties: "color"; to: "white"; duration: 500}
                        }
                    }
                }
            }

            Rectangle{
                id: conclusion
                anchors.bottom:parent.bottom
                width: parent.width
                height: parent.height/10
                color: "transparent"
                Rectangle{
                    id: conclusionbkg
                    anchors.bottom:parent.bottom
                    width: parent.width
                    height: parent.height
                    color: "steelblue"
                    radius: 5
                    opacity: 0.5
                }

                Text {
                    id: avgtext
                    property string number: "Brak"
                    property int number_weight: 0
                    text: qsTr("Średnia: "+number+" suma wag: "+number_weight.toString())
                    anchors {
                        left: parent.left; leftMargin: 20
                        verticalCenter: parent.verticalCenter
                    }
                    font.pixelSize: parent.height / 2
                    elide: Text.ElideRight
                }
            }
        }

}
}
