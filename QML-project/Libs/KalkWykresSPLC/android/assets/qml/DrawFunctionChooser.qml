import QtQuick 1.0

/*
 * Text Box oomponent to display text content inside a rectangle with underlay shadow.
 *
 */
Item {
    id: item
    property double minXGraph
    property double maxXGraph

    property alias backgroundcolor: setbox.color
    property alias functions: functionText.text
    signal buttonClicked(string funcText)

    function showFunctionPanel()
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
        property int eh: (height-30)/2
        Column { /* inner column */
            width: parent.width
            height: parent.height

                x: 10; y: 10
                spacing: 10
                Row {
                    Rectangle { width: setbox.ew*5+40; height: setbox.eh/2-5; color: "transparent"
                        Text {
                            id: frameText
                            text: qsTr("Ustawianie rysowanej funkcji")
                            anchors.centerIn: parent
                            font.pixelSize: parent.height*0.4
                        }
                    }
                }
                Row { /* inner row */
                        spacing: 10


                        Rectangle { width: setbox.ew*5+40; height: setbox.eh; color: "lightgrey"
                            TextInput{
                                id:functionText
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height*0.5
                                focus: true
                                font.pixelSize: parent.height*0.4

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
                                buttonClicked(functionText.text)
                            }
                        }
                   }
              }
         }
    }
}

