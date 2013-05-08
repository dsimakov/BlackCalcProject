//import Qt 4.7
import QtQuick 1.0

/*
 * Options Screen
 *
 */
Screen {
    id: screen

    TextBox {
        id: description
        anchors.top: topBarBottom
        backgroundcolor: "white"
    }

    TextBoxWTextEdit {
        id: pluginsFolder
        text: "Ścieżka do katalogu z pluginami"
        anchors.top: description.bottom
        backgroundcolor: "white"

    }

    TextBox {
        id: errorBox
        text: "Not implemented yet!"
        backgroundcolor: "orange"
        anchors.centerIn: parent
        visible: true

    }

    Component.onCompleted: {
        description.text=formatText("hahaha")

    }

    function formatText(str) {
        var formatedText = "<h1> Tytuł </h1><hr><br>"+str
        return formatedText
    }
}
