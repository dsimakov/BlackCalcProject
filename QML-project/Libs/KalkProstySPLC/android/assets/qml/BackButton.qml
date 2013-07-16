//import Qt 4.7
import QtQuick 1.0

/*
 * Button for navigating back one screen
 *
 */
Rectangle {
    id: backButton
    width: backText.width * 2.5
    height: parent.height - 10
    anchors.verticalCenter: parent.verticalCenter
    x: 5
    radius: 10
    visible: previousScreen != null
    gradient: normal

    Text {
        id: backText
        text: "Wstecz"
        anchors.centerIn: parent
        font.pixelSize: 12
        font.bold: true
        color: "white"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            previousScreen.state = "visible"
            screen.state = "after"
        }
        onPressed: {
            backButton.gradient = selected
        }
        onReleased: {
            backButton.gradient = normal
        }
    }

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
}
