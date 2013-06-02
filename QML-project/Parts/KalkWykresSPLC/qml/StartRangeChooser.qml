import QtQuick 1.0

/*
 * Text Box oomponent to display text content inside a rectangle with underlay shadow.
 *
 */
Item {
    id: item
    property real leftFrame
    property real rightFrame
    property real downFrame
    property real upFrame
    property real minXGraph
    property real maxXGraph

    property alias backgroundcolor: setbox.color
    signal buttonClicked()

    function showRangeChooserPanel()
    {
        visible=true;
    }

    width: screen.width
    height: screen.height


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
    //shadow
    Rectangle{
        color: "grey";
        width: screen.width
        height: 2*screen.height
        anchors.top: parent.top;
        opacity: 0.9
    }

    // Text box
    Rectangle {
        anchors.horizontalCenter:parent.horizontalCenter
        y: parent.height / 11
        //anchors.centerIn: parent
        id: setbox
        width: parent.width*0.9
        height: parent.height*0.4
        radius: 5
        property int ew: (width-60)/5
        property int ewtext: ((width-60)/5)+0.5*ew+5//5->spacing
        property int eh: (height-40)/3
        Column { /* inner column */
            width: parent.width
            height: parent.height

                x: 10; y: 10
                spacing: 10
                Row {
                    Rectangle { width: setbox.ew*5+40; height: setbox.eh/2-5; color: "transparent"
                        Text {
                            id: frameText
                            text: qsTr("Ustawianie ramki")
                            anchors.centerIn: parent
                            font.pixelSize: parent.height*0.4
                        }
                    }
                }
                Row { /* inner row */
                        spacing: 10

                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color
                            Text {
                                id: upLabel
                                text: qsTr("Góra")
                                anchors.centerIn: parent
                                font.pixelSize: parent.height*0.4
                            }}
                        Rectangle { width: setbox.ewtext; height: setbox.eh; color: "lightgrey"
                            TextInput{
                                id:upText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height*0.5
                                focus: true
                                font.pixelSize: parent.height*0.4
                                maximumLength: 8
                                validator: DoubleValidator { bottom:-9999; top: 9999}
                            }
                        }
                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color
                            Text {
                                id: downLabel
                                text: qsTr("Dół")
                                anchors.centerIn: parent
                                font.pixelSize: parent.height*0.4
                            }}


                        Rectangle { width: setbox.ewtext; height: setbox.eh; color: "lightgrey"
                            TextInput{
                                id:downText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height*0.5
                                focus: true
                                font.pixelSize: parent.height*0.4
                                maximumLength: 8
                                validator: DoubleValidator { bottom:-9999; top: 9999}
                            }
                        }
                      }
                Row { /* inner row */
                        spacing: 10
                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color
                            Text {
                                id: leftLabel
                                text: qsTr("Lewo")
                                anchors.centerIn: parent
                                font.pixelSize: parent.height*0.4
                            }}
                        Rectangle { width: setbox.ewtext; height: setbox.eh; color: "lightgrey"
                            TextInput{
                                id:leftText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height*0.5
                                focus: true
                                font.pixelSize: parent.height*0.4
                                maximumLength: 8
                                validator: DoubleValidator { bottom:-9999; top: 9999}
                            }
                        }
                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color
                            Text {
                                id: rightLabel
                                text: qsTr("Prawo")
                                anchors.centerIn: parent
                                font.pixelSize: parent.height*0.4
                            }}


                        Rectangle { width: setbox.ewtext; height: setbox.eh; color: "lightgrey"
                            TextInput{
                                id:rightText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height*0.5
                                focus: true
                                font.pixelSize: parent.height*0.4
                                maximumLength: 8
                                validator: DoubleValidator { bottom:-9999; top: 9999}
                            }
                        }
                      }
                Row {
                    Rectangle {id:acceptRangeRect; width: setbox.ew*5+40; height: setbox.eh/2-5; color: "steelblue"
                        Text {
                            id: acceptText
                            text: qsTr("OK")
                            anchors.centerIn: parent
                            font.pixelSize: parent.height*0.4
                        }
                        MouseArea{
                            anchors.fill: parent

                            onPressed: {
                                acceptRangeRect.color="grey"
                            }

                            onReleased: {
                                acceptRangeRect.color="steelblue"
                            }
                            onClicked: {
                                item.visible=false;
                                buttonClicked()
                            }
                        }
                    }
                }
              }
    }
}

