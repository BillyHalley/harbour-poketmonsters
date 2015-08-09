import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {

    Functions {
        id: functions
    }

    property string text
    width: (screen.width - Theme.paddingLarge*2 )
    height: width/3
    border.width: 1
    border.color: Theme.primaryColor
    color: "transparent"
    Label {
        id: consoleLabel
        width: parent.width - Theme.paddingMedium*2
        anchors {
            bottom: parent.bottom
            bottomMargin: Theme.paddingSmall/2
            left: parent.left
            leftMargin: Theme.paddingMedium
        }
        font.pixelSize: lineCount > 3 ? Theme.fontSizeMedium : Theme.fontSizeLarge
        wrapMode: Text.Wrap
        text: parent.text
    }
    MouseArea {
        id: consoleMouse
        anchors.fill: parent
        onClicked: {
            functions.consoleClick()
        }
        enabled: waiting && idle && !loading
    }
    Timer {
        running: waiting && idle && !loading
        interval: 250
        repeat: true
        onTriggered: {
            parent.border.width = parent.border.width === 1 ? 3 : 1
        }
    }
}
