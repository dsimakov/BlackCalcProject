import QtQuick 1.0
import "../functions.js" as Functions


/*
 * Text Box oomponent to display text content inside a rectangle with underlay shadow.
   *
      */
Item {
    id: item
    property alias mostSignificantGrade: gradeText.text
    property int changedItem

    property alias text: textboxText.text
    property alias backgroundcolor: textboxrectangle.color
    property real grade
    signal buttonClicked(int number, real grade)

    width: screen.width - screen.width / 5
    height: screen.height

    // Normal state button gradient
    Gradient {
        id: normal
        GradientStop {
            position: 0.5
            color: "#7690B3"
        }
        GradientStop {
            position: 0.7
            color: "#4A6C9B"
        }
        GradientStop {
            position: 1.0
            color: "#4A6C9B"
        }
    }

    // Selected button gradient
    Gradient {
        id: selected
        GradientStop {
            position: 0.5
            color: "#6B93E7"
        }
        GradientStop {
            position: 0.7
            color: "#2463DE"
        }
        GradientStop {
            position: 1.0
            color: "#2463DE"
        }
    }

    onVisibleChanged:  {
        gradeText.forceActiveFocus()
        gradeText.positionAt(0)
        gradeText.openSoftwareInputPanel()
    }

    Rectangle {
        color: "grey"
        width: screen.width + screen.width / 5
        height: screen.height
        opacity: 0.9
        anchors.left: screen.left
        x: -screen.width / 5
    }

    // Text box
    Rectangle {
        id: textboxrectangle
        width: parent.width
        height: parent.height / 3
        x: 10
        y: 100
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

        Rectangle {
            color: parent.color
            anchors.top: textboxText.bottom
            width: parent.width
            height: parent.height - textboxText.height
            radius: 5
            Rectangle {
                color: parent.color
                width: parent.width
                height: 0.6 * parent.height
                anchors.top: parent.top
                id: changes

                    Rectangle {
                        color: parent.color
                        id: upPartLeft
                        width: parent.width
                        height: parent.height
                        anchors.top: parent.top



                        Rectangle {
                            width: 0.5 * parent.width
                            height: 0.5 * parent.height
                            color: "white"
                            anchors.centerIn: parent
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    gradeText.forceActiveFocus()
                                    gradeText.positionAt(0)
                                    gradeText.openSoftwareInputPanel()
                                }
                            }
                            TextInput {
                                id: gradeText
                                anchors.centerIn: parent
                                height: parent.height * 0.5
                                focus: true
                                font.pixelSize: parent.height * 0.4
                                maximumLength: 4
                                validator: DoubleValidator {
                                    decimals: 2
                                    bottom: 2.0
                                    top: 5.0
                                }
                                onTextChanged: {
                                    gradeText.text=gradeText.text.replace(",", ".")
                                    if (parseFloat(gradeText.text) > 5.0)
                                        gradeText.text = "5.0"
                                    if (parseFloat(gradeText.text) < 2.0)
                                        gradeText.text = "2.0"
                                }
                            }
                    }

                }
            }

            Rectangle {
                color: parent.color
                width: parent.width
                height: 0.4 * parent.height
                anchors.bottom: parent.bottom
                id: buttons
                Rectangle {
                    color: parent.color
                    id: leftbutton
                    width: 0.5 * parent.width
                    height: parent.height
                    anchors.left: parent.left
                    Rectangle {
                        id: cancelButton
                        radius: 10
                        gradient: normal
                        anchors.centerIn: parent
                        width: 0.8 * parent.width
                        height: 0.8 * parent.height
                        Text {
                            id: cancelButtonText
                            text: "Anuluj"
                            anchors.centerIn: parent
                            font.pixelSize: main.height / 10 / 3
                            textFormat: Text.RichText
                        }
                        MouseArea {

                            anchors.fill: parent
                            onClicked: {
                                item.visible = false
                                flickArea.interactive = true
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
                Rectangle {
                    color: parent.color
                    id: rightButton
                    width: 0.5 * parent.width
                    height: parent.height
                    anchors.right: parent.right
                    Rectangle {
                        id: okButton
                        gradient: normal
                        radius: 10
                        anchors.centerIn: parent
                        width: 0.8 * parent.width
                        height: 0.8 * parent.height
                        Text {
                            id: okButtonText
                            text: "Zatwierdź"
                            anchors.centerIn: parent
                            font.pixelSize: main.height / 10 / 3
                            textFormat: Text.RichText
                        }
                        MouseArea {

                            anchors.fill: parent
                            onClicked: {
                                grade = parseFloat(gradeText.text.replace(",","."))
                                console.debug(gradeText.text)
                                item.buttonClicked(changedItem, grade)
                                item.visible = false
                                flickArea.interactive = true
                                gradeText.closeSoftwareInputPanel()
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
