//import Qt 4.7
import QtQuick 1.0
/*
 * Text Box oomponent to display text content inside a rectangle with underlay shadow.
 *
 */
Item {

    property alias text: textboxText.text
    property alias backgroundcolor: textboxrectangle.color

    width: parent.width
    height: childrenRect.height

    // Transparent "shadow"
    Rectangle {
        color: "#44000000"
        width: parent.width - 20
        height: textboxText.height
        x: 15; y: 15
        radius: 5
    }

    // Text box
    Rectangle {
        id: textboxrectangle
        color: "white"
        width: parent.width - 20
        height: 105
        x: 10; y: 10
        radius: 5

        Text {
            id: textboxText
            anchors.centerIn: parent
            font.pixelSize: main.height / 10 / 3
            textFormat: Text.RichText
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            width: parent.width - 40
            x: 20
        }

        Rectangle{
            id: plac
            color: "#b1deff"
            width: parent.width - 20
            height: 30
            x: 15; y: 10
            radius: 5
            border.color: "black"
            anchors.top:textboxText.bottom
            TextInput {
                id: path
                text: "/home/devuser"
                onTextChanged: {
                    animacja.start()
                }
            }
        }
        SequentialAnimation{
            id: animacja
          PropertyAnimation {target: plac; properties: "color"; to: "green"; duration: 100}
          PropertyAnimation {target: plac; properties: "color"; to: "white"; duration: 100}
        }
    }
}
