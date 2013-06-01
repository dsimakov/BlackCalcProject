import QtQuick 1.0

/*
 * Text Box oomponent to display text content inside a rectangle with underlay shadow.
 *
 */
Item {
    id: item
    property int changedItem

    property alias backgroundcolor: textboxrectangle.color
    property alias functions: functionText.text
    signal buttonClicked(string funcText)

    function showFunctionPanel()
    {
        visible=true;
    }

    width: screen.width
    height: screen.height/2
    anchors.top: parent.top;


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
    Rectangle{
        color: "grey";
        width: screen.width
        height: 2*screen.height
        anchors.top: parent.top;
        opacity: 0.9
    }

    // Text box
    Rectangle {
        anchors.centerIn: parent
        id: textboxrectangle
        width: parent.width
        height: parent.height/5
        radius: 5
        TextInput{
            id:functionText
            width: parent.width-(parent.width/10)-3
            height: parent.height
            focus: true
            font.pixelSize: main.height / 12
            x:3

        }
        Rectangle{
            anchors.left:functionText.right
            width: parent.width/10
            height: parent.height
            color: "yellow"
            MouseArea{

                anchors.fill: parent
                onClicked: {
                    item.visible=false;
                    buttonClicked(functionText.text)
                }
            }
        }
    }
}
