//import Qt 4.7
import QtQuick 1.0

/*
 * The main QML-file that is loaded first.
 * Handles loading of the XML-data.
 *
 */
Rectangle {
    id: main

    property string xml

    width: 1024
    height: 600

    // Background gradient
    gradient: Gradient {
        GradientStop { position: 0.0; color: "silver" }
        GradientStop { position: 1.0; color: "gray" }
    }

    // First list of Mammals
    ListScreen {
        state: "visible"
        titleText: "Wybór Kalkulatora"
    }

    // Error popup
    TextBox {
        id: errorBox
        text: "Error synek"
        z: 100
        anchors.centerIn: parent
        visible: false

    }



    // Request XML-data with XMLHttpRequest-object when the main component is loaded.
    Component.onCompleted: {
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.DONE) {
                if (doc.status == 200 || doc.status == 0) {
                    main.xml = doc.responseText
                } else {
                    // Something went wrong. Show the error
                    errorBox.text = "Error " + doc.status;
                    errorBox.visible = true;
                }
            }
        }

        // Reads the data from a local file
        doc.open("GET", "ListData.plist");

        // Reads the data from network
        //doc.open("GET", "http://yourservername.com/ListData.plist");

        doc.send();
    }

}


