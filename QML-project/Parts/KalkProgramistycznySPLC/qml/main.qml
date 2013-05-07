
import QtQuick 1.0

Rectangle {
    id: main

    width: 1024
    height: 600

    // Background gradient
    gradient: Gradient {
        GradientStop { position: 0.0; color: "white" }
        GradientStop { position: 1.0; color: "gray" }
    }

    ProgCalcScreen {
        state: "visible"
        titleText: "Kalkulator programistyczny"
    }
}


