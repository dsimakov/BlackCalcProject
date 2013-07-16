import QtQuick 1.0
import "calcFunctions.js" as CalcEngine
/*
 * Screen including ListView with selectable items.
 *
 */
Screen {
    id: screen

    property string rotateLeft: "\u2939"
    property string rotateRight: "\u2935"
    property string leftArrow: "\u2190"
    property string division : "\u00f7"
    property string multiplication : "\u00d7"
    property string squareRoot : "\u221a"
    property string plusminus : "\u00b1"
    property string root: "\u00B2"
    property string oneOver: "\u215F"

    function doOp(operation) { CalcEngine.doOperation(operation) }

    Gradient {
        id: normal
        GradientStop { position: 0.5; color: "#7690B3" }
        GradientStop { position: 0.7; color: "#4A6C9B" }
        GradientStop { position: 1.0; color: "#4A6C9B" }
    }

    Gradient{
        id: functions
        GradientStop { position: 0.5; color: "#cda4c9" }
        GradientStop { position: 0.7; color: "#9b4a94" }
        GradientStop { position: 1.0; color: "#9b4a94" }
    }

    Gradient{
        id: operations
        GradientStop { position: 0.5; color: "#a8cda4" }
        GradientStop { position: 0.7; color: "#549b4a" }
        GradientStop { position: 1.0; color: "#549b4a" }
    }

    Rectangle {
        id: prediction
        anchors.top: topBarBottom
        width:parent.width
        height: parent.height- (parent.height / 11)
        Rectangle{
            id: resultRectangle
            anchors.top:parent.top
            width: parent.width
            height: parent.height/5
            Rectangle{
                anchors.centerIn: parent
                width: parent.width-parent.width/11
                height: parent.height-parent.height/11
                color: "white"
                radius: 15
                Display{
                    id: display
                    anchors.fill: parent
                }
            }

        }

        Rectangle{
            id: buttonsRectangle
            anchors.bottom:parent.bottom
            width: parent.width
            height: (parent.height/5)*4

            Rectangle{
                id: firstLine
                anchors.top:parent.top
                width: parent.width
                height: parent.height/5
                Rectangle{
                    id:a1
                    anchors.left:parent.left
                    width: parent.width/4
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "?"
                        gradient: functions
                    }
                }
                Rectangle{
                    id:a2
                    anchors.left:a1.right
                    width: parent.width/4
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: leftArrow
                        gradient: functions
                    }
                }
                Rectangle{
                    id:a3
                    anchors.left:a2.right
                    width: parent.width/4
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "C"
                        gradient: functions
                    }
                }
                Rectangle{
                    id:a4
                    anchors.left:a3.right
                    width: parent.width/4
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "AC"
                        gradient: functions
                    }
                }
            }

            Rectangle{
                id: secondLine
                anchors.top:firstLine.bottom
                width: parent.width
                height: parent.height/5
                Rectangle{
                    id:b1
                    anchors.left:parent.left
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "7"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:b2
                    anchors.left:b1.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "8"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:b3
                    anchors.left:b2.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "9"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:b4
                    anchors.left:b3.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: division
                        gradient: operations
                    }
                }
                Rectangle{
                    id:b5
                    anchors.left:b4.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: squareRoot
                        gradient: operations
                    }
                }
                Rectangle{
                    id:b6
                    anchors.left:b5.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "MC"
                        gradient: operations
                    }
                }

            }
            Rectangle{
                id: thirdLine
                anchors.top:secondLine.bottom
                width: parent.width
                height: parent.height/5
                Rectangle{
                    id:c1
                    anchors.left:parent.left
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "4"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:c2
                    anchors.left:c1.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "5"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:c3
                    anchors.left:c2.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "6"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:c4
                    anchors.left:c3.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: multiplication
                        gradient: operations
                    }
                }
                Rectangle{
                    id:c5
                    anchors.left:c4.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "x"+root
                        gradient: operations
                    }
                }
                Rectangle{
                    id:c6
                    anchors.left:c5.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "M+"
                        gradient: operations
                    }
                }
            }
            Rectangle{
                id: forthLine
                anchors.top:thirdLine.bottom
                width: parent.width
                height: parent.height/5
                Rectangle{
                    id:d1
                    anchors.left:parent.left
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "1"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:d2
                    anchors.left:d1.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "2"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:d3
                    anchors.left:d2.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "3"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:d4
                    anchors.left:d3.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "-"
                        gradient: operations
                    }
                }
                Rectangle{
                    id:d5
                    anchors.left:d4.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: oneOver+"x"
                        gradient: operations
                    }
                }
                Rectangle{
                    id:d6
                    anchors.left:d5.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "M-"
                        gradient: operations
                    }
                }
            }
            Rectangle{
                id: fifthLine
                anchors.top:forthLine.bottom
                width: parent.width
                height: parent.height/5
                Rectangle{
                    id:e1
                    anchors.left:parent.left
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "0"
                        gradient: normal
                    }
                }
                Rectangle{
                    id:e2
                    anchors.left:e1.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "."
                        gradient: normal
                    }
                }
                Rectangle{
                    id:e3
                    anchors.left:e2.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: plusminus
                        gradient: operations
                    }
                }
                Rectangle{
                    id:e4
                    anchors.left:e3.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "+"
                        gradient: operations
                    }
                }
                Rectangle{
                    id:e5
                    anchors.left:e4.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "="
                        gradient: operations
                    }
                }
                Rectangle{
                    id:e6
                    anchors.left:e5.right
                    width: parent.width/6
                    height: parent.height
                    Button{
                        anchors.centerIn: parent
                        width: parent.width-parent.width/10
                        height: parent.height-parent.height/10
                        operation: "MR"
                        gradient: operations
                    }
                }
            }

        }
      }
}
