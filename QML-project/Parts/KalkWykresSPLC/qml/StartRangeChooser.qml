import QtQuick 1.0

/*
 * Text Box oomponent to display text content inside a rectangle with underlay shadow.
 *
 */
Item {
    id: item

    property alias backgroundcolor: setbox.color
    signal buttonClicked(double l, double r, double d,double u)

    function showRangeChooserPanel(l, r, d, u)
    {
        leftText.text=l
        rightText.text=r
        downText.text=d
        upText.text=u

       /* leftText.text.replace(",",".")
        rightText.text.replace(",",".")
        downText.text.replace(",",".")
        upText.text.replace(",",".")*/


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
                                if(parseFloat(upText.text)>parseFloat(downText.text)){
                                    if(parseFloat(rightText.text)>parseFloat(leftText.text)){
                                        buttonClicked(parseFloat(leftText.text.replace(",",".")),parseFloat(rightText.text.replace(",",".")),parseFloat(downText.text.replace(",",".")),parseFloat(upText.text.replace(",",".")))
                                        item.visible=false;
                                    }
                                    else{
                                        errorRangeText.text="prawo<lewo"
                                        errorRange.visible=true
                                    }
                                }
                                else{
                                    errorRangeText.text="góra<dół"
                                    errorRange.visible=true
                                }



                            }
                        }
                    }
                }
              }
    }

    Rectangle{
            id:errorRange
            anchors.centerIn: parent
            width: parent.width/2
            height: parent.height/2
            Column{
                width: parent.width
                height: parent.height
                Row{
                    Rectangle { width: errorRange.width; height: errorRange.height/3; color: "transparent"
                        Text {anchors.centerIn: parent
                            id: waitText
                            text: qsTr("Błędnie podany rozmiar")
                            font.pixelSize: errorRange.height*0.1
                        }

                }
                }
                Row{
                    Rectangle { width: errorRange.width; height: errorRange.height/3; color: "transparent"
                        Text {anchors.centerIn: parent
                            id: errorRangeText
                            text: qsTr("")
                            font.pixelSize: errorRange.height*0.1
                        }

                }
                }
                Row{
                    Rectangle { width: errorRange.width; height: errorRange.height/3; color: "steelblue"
                        Text {anchors.centerIn: parent
                            text: qsTr("OK")
                            font.pixelSize: errorRange.height*0.1
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                errorRange.visible=false
                            }
                        }
                }
                }
            }



            color: "white"
            radius: 5;
            visible:false

        }
}

