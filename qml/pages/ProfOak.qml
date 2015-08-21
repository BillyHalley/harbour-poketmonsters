import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.pocketmonsters.Manager 1.0


Page {
    id: page

    property var one
    property var two
    property var three
    property var enemy

    property bool newGame: false


    Manager {
        id: manager
        onSaveActiveDone: {
            pageStack.replace("FirstPage.qml", {"enemyString": enemy })
        }
    }
    onStatusChanged: {
        if ( status === PageStatus.Activating) {
            one = manager.fetchMonster(1,5)
            two = manager.fetchMonster(2,5)
            three = manager.fetchMonster(3,5)
            first.fetch(one)
            second.fetch(two)
            third.fetch(three)
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Load")
                onClicked: pageStack.replace("FirstPage.qml")
                enabled: manager.checkSaved() && !newGame
            }
            MenuItem {
                text: qsTr("NewGame")
                onClicked: newGame = true
                enabled: !newGame
            }
            enabled: true
        }

        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("PocketMonsters")
            }
            Label {
                x: Theme.paddingLarge
                width: parent.width - Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
                text: !newGame ? "Welcome to your personal Sailfish Based Adventure!\nChoose in the pulley menu what do you want to do!\nSelecting a new game will erase your previous saved game!" : "Select your starter and begin the adventure!"
            }
        }
        Monster {
            id: first
            x: Theme.paddingLarge
            anchors.top: column.bottom
            anchors.topMargin: Theme.paddingLarge * 2
            exp: Math.pow(level,3)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    enemy = manager.fetchMonster(2,5)
                    manager.saveActive(first.string)
                }
                onPressed: parent.color = Theme.secondaryHighlightColor
                onReleased: parent.color = "transparent"
                enabled: newGame
            }
            visible: newGame ? 1 : 0
        }
        Monster {
            id: second
            anchors.left: first.right
            anchors.leftMargin: Theme.paddingLarge
            anchors.top: first.top
            exp: Math.pow(level,3)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    enemy = manager.fetchMonster(3,5)
                    manager.saveActive(second.string)
                }
                onPressed: parent.color = Theme.secondaryHighlightColor
                onReleased: parent.color = "transparent"
                enabled: newGame
            }
            visible: newGame ? 1 : 0
        }
        Monster {
            id: third
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: first.bottom
            anchors.topMargin: Theme.paddingLarge
            exp: Math.pow(level,3)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    enemy = manager.fetchMonster(1,5)
                    manager.saveActive(third.string)
                }
                onPressed: parent.color = Theme.secondaryHighlightColor
                onReleased: parent.color = "transparent"
                enabled: newGame
            }
            visible: newGame ? 1 : 0
        }
    }
}
