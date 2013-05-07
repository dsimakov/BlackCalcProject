//import Qt 4.7
import QtQuick 1.0

/*
 * Details Screen
 *
 */
Screen {
    id: screen

    property alias xml: listModel.xml
    property alias query: listModel.query
    property int index

    // XmlListModel for parsing details data
    XmlListModel {
        id: listModel

        XmlRole { name: "dict"; query: "string()" }

        onStatusChanged: {
            if (status == XmlListModel.Ready) {
                description.text = formatText(get(index).dict)
            }
        }
    }

    TextBox {
        id: description
        anchors.top: topBarBottom
    }

    TextBox {
        id: errorBox
        text: "Not implemented yet!"
        backgroundcolor: "orange"
        anchors.centerIn: parent
        visible: true

    }

    // Formats the text in RichText format
    function formatText(str) {
        var lines = str.split("\n")
        var formatedText = ""
        for (var i = 0; i < lines.length; i++) {
            formatedText += (i == 0 || i % 2 == 0 ? lines[i] : "<b>" + lines[i] + "</b>") + "<br>"
        }
        return formatedText
    }
}
