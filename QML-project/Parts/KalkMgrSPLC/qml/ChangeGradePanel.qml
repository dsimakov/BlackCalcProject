import QtQuick 1.0

/*
 * Text Box oomponent to display text content inside a rectangle with underlay shadow.
 *
 */
Item {
    id: item
    property alias mostSignificantGrade: gradeMSV.text
    property alias leastSignificantGrade: gradeLSV.text
    property int changedItem

    property alias text: textboxText.text
    property alias backgroundcolor: textboxrectangle.color
    property real grade
    signal buttonClicked(int number, real grade)

    width: screen.width - screen.width/5
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

    Rectangle{
        color: "grey";
        width: screen.width+screen.width/5
        height: screen.height
        opacity: 0.9
        anchors.left: screen.left
        x: -screen.width/5
    }


    // Text box
    Rectangle {
        anchors.centerIn: parent
        id: textboxrectangle
        width: parent.width
        height: parent.width/2
        x: 10; y: 10
        radius: 5

        Text {
            id: textboxText
            anchors.top: parent.top
            font.pixelSize: main.height / 10 / 3
            textFormat: Text.RichText
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            width: parent.width - 40
            x: 20
        }

        Rectangle{
            color:parent.color
            anchors.top: textboxText.bottom
            width: parent.width
            height: parent.height-textboxText.height
            radius: 5
             Rectangle{
                 color:parent.color
                width: parent.width
                height: 0.8*parent.height
                anchors.top:parent.top
                id: changes


                Rectangle{
                    color:parent.color
                    id:leftPart
                    width: 0.5*parent.width
                    height: parent.height
                    anchors.left: parent.left

                    Rectangle{
                        color:parent.color
                        id:upPartLeft
                        width: parent.width
                        height: 0.5*parent.height
                        anchors.top: parent.top

                        Rectangle{
                            width: 0.5*parent.width
                            height: 0.5*parent.height
                            color:"white"
                            anchors.centerIn: parent
                            Text {
                                id: gradeMSV
                                anchors.centerIn: parent
                                font.pixelSize: main.height / 10
                                textFormat: Text.RichText
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                            }
                        }
                    }
                    Rectangle{
                        color:parent.color
                        id: downPartLeft
                        width: parent.width
                        height: 0.5*parent.height
                        anchors.bottom: parent.bottom


                        Rectangle{
                            color:parent.color
                            id:downPartLeftLeftPart
                            width: 0.5*parent.width
                            height: parent.height
                            anchors.left: parent.left
                            Rectangle{
                                gradient: normal
                                radius: 10
                                anchors.centerIn: parent
                                width: 0.8*parent.width
                                height: 0.8*parent.height
                                Text {
                                    id: msgMinusButtonText
                                    text: "-"
                                    anchors.centerIn: parent
                                    font.pixelSize: main.height / 10
                                    textFormat: Text.RichText
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        var msgGrade = parseInt(gradeMSV.text)
                                        msgGrade-=1;
                                        if(msgGrade<3)
                                            msgGrade=3
                                        gradeMSV.text=msgGrade.toString()}
                                        onPressed: {
                                            parent.gradient = selected
                                        }
                                        onReleased: {
                                            parent.gradient = normal
                                        }


                                }

                            }
                        }
                        Rectangle{
                            color:parent.color
                            id:downPartLeftRightPart
                            width: 0.5*parent.width
                            height: parent.height
                            anchors.right: parent.right
                            Rectangle{
                                radius: 10
                                anchors.centerIn: parent
                                width: 0.8*parent.width
                                height: 0.8*parent.height
                                gradient: normal
                                Text {
                                    id: msgPlusButtonText
                                    text: "+"
                                    anchors.centerIn: parent
                                    font.pixelSize: main.height / 10
                                    textFormat: Text.RichText
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        var msgGrade = parseInt(gradeMSV.text)
                                        msgGrade+=1;
                                        if(msgGrade>=5)
                                        {
                                            msgGrade=5
                                            gradeLSV.text="0"
                                        }
                                        else if(msgGrade<3){
                                            msgGrade=3
                                        }
                                        gradeMSV.text=msgGrade.toString()
                                    }
                                    onPressed: {
                                        parent.gradient = selected
                                    }
                                    onReleased: {
                                        parent.gradient = normal
                                    }
                                }

                            }
                        }
                    }
                }
                Rectangle{
                    color:parent.color
                    id: rightPart
                    width: 0.5*parent.width
                    height: parent.height
                    anchors.right: parent.right

                    Rectangle{
                        color:parent.color
                        id:upPartRight
                        width: parent.width
                        height: 0.5*parent.height
                        anchors.top: parent.top
                        Rectangle{
                            width: 0.5*parent.width
                            height: 0.5*parent.height
                            color:"white"
                            anchors.centerIn: parent
                            Text {
                                id: gradeLSV
                                anchors.centerIn: parent
                                font.pixelSize: main.height / 10
                                textFormat: Text.RichText
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                width:font.pixelSize*1.5

                            }
                        }




                    }
                    Rectangle{
                        color:parent.color
                        id: downPartRight
                        width: parent.width
                        height: 0.5*parent.height
                        anchors.bottom: parent.bottom
                        Rectangle{
                            color:parent.color
                            id:downPartRightLeftPart
                            width: 0.5*parent.width
                            height: parent.height
                            anchors.left: parent.left
                            Rectangle{
                                radius: 10
                                anchors.centerIn: parent
                                width: 0.8*parent.width
                                height: 0.8*parent.height
                                gradient: normal
                                Text {
                                    id: lsgMinusButtonText
                                    text: "-"
                                    anchors.centerIn: parent
                                    font.pixelSize: main.height / 10
                                    textFormat: Text.RichText
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        var msgGrade = parseInt(gradeLSV.text)
                                        msgGrade-=1;
                                        if(msgGrade<0)
                                            msgGrade=0
                                        gradeLSV.text=msgGrade.toString()
                                    }
                                    onPressed: {
                                        parent.gradient = selected
                                    }
                                    onReleased: {
                                        parent.gradient = normal
                                    }
                                }
                            }
                        }
                        Rectangle{
                            color:parent.color
                            id:downPartRightRightPart
                            width: 0.5*parent.width
                            height: parent.height
                            anchors.right: parent.right
                            Rectangle{
                                radius: 10
                                anchors.centerIn: parent
                                width: 0.8*parent.width
                                height: 0.8*parent.height
                                gradient: normal
                                Text {
                                    id: lsgPlusButtonText
                                    text: "+"
                                    anchors.centerIn: parent
                                    font.pixelSize: main.height / 10
                                    textFormat: Text.RichText
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        var msgGrade = parseInt(gradeLSV.text)
                                        if(gradeMSV.text!="5"){
                                        msgGrade+=1;
                                        if(msgGrade>=100)
                                            msgGrade=99
                                        gradeLSV.text=msgGrade.toString()
                                    }}
                                    onPressed: {
                                        parent.gradient = selected
                                    }
                                    onReleased: {
                                        parent.gradient = normal
                                    }
                                }

                            }
                        }

                    }
                }
            }

            Rectangle{
                color:parent.color
                width: parent.width
                height: 0.2*parent.height
                anchors.bottom:parent.bottom
                id: buttons
                Rectangle{
                    color:parent.color
                    id:leftbutton
                    width: 0.5*parent.width
                    height: parent.height
                    anchors.left: parent.left
                    Rectangle{
                        id: cancelButton
                        radius: 10
                        gradient: normal
                        anchors.centerIn: parent
                        width: 0.8*parent.width
                        height: 0.8*parent.height
                        Text {
                            id: cancelButtonText
                            text: "Anuluj"
                            anchors.centerIn: parent
                            font.pixelSize: main.height / 10 /3
                            textFormat: Text.RichText
                        }
                        MouseArea{

                                anchors.fill: parent
                                onClicked:{
                                    item.visible=false
                                    flickArea.interactive=true
                                }
                                onPressed: {
                                    parent.gradient = selected
                                }
                                onReleased: {
                                    parent.gradient = normal
                                }


                        }
                    }
                }
                Rectangle{
                    color:parent.color
                    id: rightButton
                    width: 0.5*parent.width
                    height: parent.height
                    anchors.right: parent.right
                    Rectangle{
                        id: okButton
                        gradient: normal
                        radius: 10
                        anchors.centerIn: parent
                        width: 0.8*parent.width
                        height: 0.8*parent.height
                        Text {
                            id: okButtonText
                            text: "Zatwierdź"
                            anchors.centerIn: parent
                            font.pixelSize: main.height / 10 /3
                            textFormat: Text.RichText
                        }
                        MouseArea{

                                anchors.fill: parent
                                onClicked:{
                                    var lsg=parseInt(gradeLSV.text)/100
                                    var msg=parseInt(gradeMSV.text)
                                    grade=msg+lsg
                                    item.buttonClicked(changedItem,grade)
                                    item.visible=false
                                    flickArea.interactive=true
                                }
                                onPressed: {
                                    parent.gradient = selected
                                }
                                onReleased: {
                                    parent.gradient = normal
                                }

                        }
                    }

                }
            }
        }


    }
}
