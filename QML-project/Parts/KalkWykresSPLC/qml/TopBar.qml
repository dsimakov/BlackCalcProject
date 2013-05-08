import QtQuick 1.0
import "graph.js" as GraphFunctions

/*
 * Top bar including Back button and Title text
 *
 */
Rectangle {
    id: topbar

    property alias titleText: title.text
    property alias isExtraPageEnabled: extraPage.enabled
    z: 100
    width: parent.width
    height: parent.height / 11
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#B0BCCC" }
        GradientStop { position: 1.0; color: "#6E84A2" }
    }

    BackButton {}

    Text {
        id: title
        anchors.centerIn: parent
        font.pixelSize: parent.height / 3
        font.bold: true
        color: "white"
    }

    Rectangle {
        color: "#48576B"
        width: parent.width
        height: 1
        anchors.bottom: parent.bottom
    }



    MouseArea {
        id: extraPage
        x: 124
        y: 0
        width: 236
        height: 58
        anchors.leftMargin: 124
        anchors.fill: parent
        onClicked: {
            GraphFunctions.recalculateScales(graph,-4,3,1,-2)
            GraphFunctions.testDrawSin(graph)
            GraphFunctions.drawGraph(graph)
        }
    }

    function itemSel() {
            var component = Qt.createComponent("OptionsScreen.qml");
            if (component.status == Component.Ready) {
                var optionsScreen = component.createObject(main);
                optionsScreen.previousScreen = screen
                optionsScreen.titleText = "opcje dodatkowe"
                optionsScreen.state = "visible"
                screen.state = "before"

        }
    }
}
