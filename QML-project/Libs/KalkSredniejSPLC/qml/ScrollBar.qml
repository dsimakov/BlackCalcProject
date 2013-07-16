//import Qt 4.7
import QtQuick 1.0

/*
 * ScrollBar component that can be used with a ListView
 *
 */
Item {
    id: scrollbar

    property ListView list

    anchors.right: list.right;
    anchors.top: list.top
    width: 8;
    height: list.height;
    opacity: 0
    visible: list.contentHeight > list.height
    clip: true

    Rectangle {
        anchors.fill: parent;
        color: "black";
        opacity: 0.33
    }

    BorderImage {
        source: "images/scrollbar.png"
        border { left: 1; right: 1; top: 1; bottom: 1 }
        x: 2
        y: list.contentY * scrollbar.height / list.contentHeight
        width: parent.width - 4
        height: list.height * list.height / list.contentHeight
    }

    states: State {
        name: "visible"
        when: list.movingVertically
        PropertyChanges {
            target: scrollbar;
            opacity: 1.0
        }
    }

    transitions: Transition {
        from: "visible"; to: ""
        NumberAnimation {
            properties: "opacity";
            duration: 500
        }
    }
}
