import QtQuick 1.0

/*
 * Predictions Screen
 *
 */
Screen {
    property alias text: helpText.text

    id: screen

    Rectangle {
        id: prediction
        anchors.top: topBarBottom
        width:parent.width
        height: parent.height- (parent.height / 11)

        Rectangle {

            id:helpScreen
            width:prediction.width; height:prediction.height

            Flickable {
                id: flickArea
                 anchors.fill: parent
                 contentWidth: helpText.width; contentHeight: helpText.height
                 flickableDirection: Flickable.VerticalFlick
                 clip: true

                 TextEdit{
                      id: helpText
                       wrapMode: TextEdit.Wrap
                       width:helpScreen.width;
                       readOnly:true
                       font.pixelSize: main.height / 10 / 3
                       textFormat: Text.RichText
                }
            }
        }
    }


}
