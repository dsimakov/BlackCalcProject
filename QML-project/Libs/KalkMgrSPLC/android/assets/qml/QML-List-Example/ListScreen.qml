//import Qt 4.7
import QtQuick 1.0
/*
 * Screen including ListView with selectable items.
 *
 */
Screen {
    id: screen

    property alias query: listModel.query

    // ListView for displaying the items parsed from the XML-data
    ListView {
        id: list

        property bool scrolled: false

        width: parent.width
        anchors.top: topBarBottom
        anchors.bottom: parent.bottom
        model: listModel
        delegate: listDelegate
        clip: true
        cacheBuffer: height * 2

        onMovementStarted: { scrolled = true; currentIndex = -1 }
        onMovementEnded: { scrolled = false }
        onCountChanged: { currentIndex = -1 }

        // ScrollBar component attached to the list
        ScrollBar { list: list }
    }

    // Loading animation. Visible only when the XmlListModel is loading
    AnimatedImage {
        source: "images/busy.gif"
        anchors.centerIn: list
        visible: listModel.status == XmlListModel.Loading
    }

    // XmlListModel for parsing the list data
    XmlListModel {
        id: listModel
        xml: main.xml
        query: "/plist/dict/dict/dict/key"

        XmlRole { name: "key"; query: "string()" }
    }

    // Delegate for defining a template for an item in the list
    Component {
        id: listDelegate

        Rectangle {
            id: background
            width: ListView.view.width
            height: ListView.view.height / 10
            gradient: list.currentIndex == index && !list.scrolled ? selected : null

            Text {
                text: key == null ? "" : key
                anchors {
                    left: parent.left; leftMargin: 20
                    right: arrow.right; rightMargin: 20
                    verticalCenter: parent.verticalCenter
                }
                font.pixelSize: parent.height / 3
                elide: Text.ElideRight
            }

            Image {
                id: arrow
                source: "images/arrow.png"
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right; rightMargin: 20
                }
            }

            Rectangle {
                width: parent.width
                height: 1
                color: "#BBBBBB"
                anchors.bottom: parent.bottom
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    itemSelected(index)
                }
                onPressed: {
                    clickAnimation.start()
                }
                onReleased: {

                }
            }
            SequentialAnimation{
                id: clickAnimation
                PropertyAnimation {target: background; properties: "color"; to: "steelblue"; duration: 100}
              PropertyAnimation {target: background; properties: "color"; to: "white"; duration: 1500}
            }
        }

    }

    // Item clicked on the list.
    // Show either sub-list or the details screen
    function itemSelected(index) {
            var component = Qt.createComponent("DetailsScreen.qml");
            if (component.status == Component.Ready) {
                var detailsScreen = component.createObject(main);
                detailsScreen.titleText = list.model.get(index).key
                detailsScreen.index = index
                detailsScreen.query = listModel.query.replace("/key", "/dict")
                detailsScreen.xml = main.xml
                detailsScreen.previousScreen = screen
                detailsScreen.state = "visible"
                screen.state = "before"

        }
    }
}
