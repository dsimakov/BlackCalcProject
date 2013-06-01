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
    Rectangle {
        id:shadow
        width: parent.width
        height: parent.height
        visible: isVisible
        color: "black"
        opacity: 0.0


    }

    // Text box
    Rectangle {
        anchors.centerIn: parent
        id: setbox
        width: parent.width*3/5
        height: parent.height*3/5
        radius: 5
        property int ew: (width-60)/5
        property int eh: (height-50)/4

        Column { /* inner column */
            width: parent.width
            height: parent.height

                x: 10; y: 10
                spacing: 10
                Row { /* inner row */
                        spacing: 10
                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh; color: "blue"

                            TextInput{
                                id:upText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                focus: true
                                font.pixelSize: parent.height*5/8

                            }
                        }
                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color}
                      }
                Row { /* inner row */
                        spacing: 10
                        Rectangle { width: setbox.ew; height: setbox.eh; color: "red"
                            TextInput{
                                id:minText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                focus: true
                                font.pixelSize: parent.height*5/8

                            }
                        }
                        Rectangle { width: setbox.ew; height: setbox.eh; color: "green"
                            TextInput{
                                id:leftText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                focus: true
                                font.pixelSize: parent.height*5/8

                            }
                        }
                        Rectangle { width: setbox.ew; height: setbox.eh; color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh; color: "blue"
                            TextInput{
                                id:rightText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                focus: true
                                font.pixelSize: parent.height*5/8

                            }
                        }
                        Rectangle { width: setbox.ew; height: setbox.eh; color: "blue"
                            TextInput{
                                id:maxText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                focus: true
                                font.pixelSize: parent.height*5/8

                            }
                        }
                      }
                Row { /* inner row */
                        spacing: 10
                        Rectangle { width: setbox.ew; height: setbox.eh;  color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh;  color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh; color: "blue"
                            TextInput{
                                id:downText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                focus: true
                                font.pixelSize: parent.height*5/8

                            }
                        }
                        Rectangle { width: setbox.ew; height: setbox.eh;  color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh;  color: setbox.color}
                      }
                Row { /* inner row */
                        spacing: 10
                        Rectangle { width: setbox.ew; height: setbox.eh;  color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh;  color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh;  color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh;  color: setbox.color}
                        Rectangle { width: setbox.ew; height: setbox.eh; color: "blue"
                            Text {
                                anchors.centerIn: parent
                                id: apply
                                text: qsTr("Zatwierdź")
                            }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                item.visible=false;
                                buttonClicked()
                                //przetwórz:d
                            }
                        }}
                      }
              }
    }
}
