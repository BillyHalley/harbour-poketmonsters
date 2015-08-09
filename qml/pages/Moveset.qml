import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0


Rectangle {

    Functions {
        id: functions
    }

    width: (screen.width - Theme.paddingLarge*2 )
    height: (screen.width - Theme.paddingLarge ) / 2
    border.color: Theme.primaryColor
    border.width: 1
    color: "transparent"

    Rectangle {
        width: (screen.width - Theme.paddingLarge*3 ) / 2
        height: width/2
        border.width: 1
        border.color: Theme.primaryColor
        color: "transparent"
        anchors {
            top: parent.top
            topMargin: Theme.paddingLarge / 3
            left: parent.left
            leftMargin: Theme.paddingLarge / 3

        }
        Label {
            id: name1
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: Theme.paddingMedium
            }
            text: move1.name
            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            id: type1
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingSmall
                left: parent.left
                leftMargin: Theme.paddingMedium
            }
            text: move1.type
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        Label {
            id: category1
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingSmall
                right: parent.right
                rightMargin: Theme.paddingMedium
            }
            text: move1.category
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        Label {
            id: pp1
            anchors {
                bottom: name1.bottom
                right: parent.right
                rightMargin: Theme.paddingMedium
            }
            text: move1.pp + "/" + move1.ppTot
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        MouseArea {
            anchors.fill: parent
            onClicked: functions.chooseTurn(move1)
            onPressed: parent.color = Theme.secondaryHighlightColor
            onReleased: parent.color = "transparent"
            enabled: idle && !loading && !waiting && name1.text !== "Null"
        }

    }
    Rectangle {
        width: (screen.width - Theme.paddingLarge*3 ) / 2
        height: width/2
        border.width: 1
        border.color: Theme.primaryColor
        color: "transparent"
        anchors {
            bottom: parent.bottom
            bottomMargin: Theme.paddingLarge / 3
            left: parent.left
            leftMargin: Theme.paddingLarge / 3
        }
        Label {
            id: name2
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: Theme.paddingMedium
            }
            text: move2.name
            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            id: type2
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingSmall
                left: parent.left
                leftMargin: Theme.paddingMedium
            }
            text: move2.type
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        Label {
            id: category2
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingSmall
                right: parent.right
                rightMargin: Theme.paddingMedium
            }
            text: move2.category
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        Label {
            id: pp2
            anchors {
                bottom: name2.bottom
                right: parent.right
                rightMargin: Theme.paddingMedium
            }
            text: move2.pp + "/" + move2.ppTot
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        MouseArea {
            anchors.fill: parent
            onClicked: functions.chooseTurn(move2)
            onPressed: parent.color = Theme.secondaryHighlightColor
            onReleased: parent.color = "transparent"
            enabled: idle && !loading && !waiting && name2.text !== "Null"
        }
    }
    Rectangle {
        width: (screen.width - Theme.paddingLarge*3 ) / 2
        height: width/2
        border.width: 1
        border.color: Theme.primaryColor
        color: "transparent"
        anchors {
            top: parent.top
            topMargin: Theme.paddingLarge / 3
            right: parent.right
            rightMargin: Theme.paddingLarge / 3
        }
        Label {
            id: name3
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: Theme.paddingMedium
            }
            text: move3.name
            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            id: type3
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingSmall
                left: parent.left
                leftMargin: Theme.paddingMedium
            }
            text: move3.type
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        Label {
            id: category3
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingSmall
                right: parent.right
                rightMargin: Theme.paddingMedium
            }
            text: move3.category
            font.pixelSize: Theme.fontSizeExtraSmall

        }
        Label {
            id: pp3
            anchors {
                bottom: name3.bottom
                right: parent.right
                rightMargin: Theme.paddingMedium
            }
            text: move3.pp + "/" + move3.ppTot
            font.pixelSize: Theme.fontSizeExtraSmall
        }

        MouseArea {
            anchors.fill: parent
            onClicked: functions.chooseTurn(move3)
            onPressed: parent.color = Theme.secondaryHighlightColor
            onReleased: parent.color = "transparent"
            enabled: idle && !loading && !waiting && name3.text !== "Null"
        }
    }
    Rectangle {
        width: (screen.width - Theme.paddingLarge*3 ) / 2
        height: width/2
        border.width: 1
        border.color: Theme.primaryColor
        color: "transparent"
        anchors {
            bottom: parent.bottom
            bottomMargin: Theme.paddingLarge / 3
            right: parent.right
            rightMargin: Theme.paddingLarge / 3
        }
        Label {
            id: name4
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: Theme.paddingMedium
            }
            text: move4.name
            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            id: type4
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingSmall
                left: parent.left
                leftMargin: Theme.paddingMedium
            }
            text: move4.type
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        Label {
            id: category4
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingSmall
                right: parent.right
                rightMargin: Theme.paddingMedium
            }
            text: move4.category
            font.pixelSize: Theme.fontSizeExtraSmall
        }
        Label {
            id: pp4
            anchors {
                bottom: name4.bottom
                right: parent.right
                rightMargin: Theme.paddingMedium
            }
            text: move4.pp + "/" + move4.ppTot
            font.pixelSize: Theme.fontSizeExtraSmall
        }

        MouseArea {
            anchors.fill: parent
            onClicked: functions.chooseTurn(move4)
            onPressed: parent.color = Theme.secondaryHighlightColor
            onReleased: parent.color = "transparent"
            enabled: idle && !loading && !waiting && name4.text !== "Null"
        }
    }
}
