import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0
import "xmls"
import "pics"

Rectangle {
    id: monster
    width: (screen.width - Theme.paddingLarge*3 ) / 2
    height: (screen.width - Theme.paddingLarge*3 ) / 2
    color: "transparent"
    border.color: Theme.primaryColor

    property int indexInt
    property string indexString: indexInt < 10 ? "00" + indexInt : indexInt < 100 ? "0" + indexInt : indexInt

    property string name
    property string type1
    property string type2

    property int ivs: 0
    property int nature: 1

    property int baseHp
    property int baseAtk
    property int baseDef
    property int baseSatk
    property int baseSDef
    property int baseSpe

    property int baseHpEv
    property int baseAtkEv
    property int baseDefEv
    property int baseSatkEv
    property int baseSDefEv
    property int baseSpeEv

    property int level
    property int life: hp
    property int percentHP: Math.floor(life * 100 / hp)

    property int hpEv: 0
    property int atkEv: 0
    property int defEv: 0
    property int satkEv: 0
    property int sdefEv: 0
    property int speEv: 0

    property int hp: Math.floor( ( ( ivs + ( 2 * baseHp ) + ( hpEv / 4 ) + 100 ) * level / 100 ) + 10 )
    property int atk: Math.floor( ( ( ( ivs + ( 2 * baseAtk ) + ( atkEv / 4 ) ) * level / 100 ) + 5 ) * nature )
    property int def: Math.floor( ( ( ( ivs + ( 2 * baseDef ) + ( defEv / 4 ) ) * level / 100 ) + 5 ) * nature )
    property int satk: Math.floor( ( ( ( ivs + ( 2 * baseSatk ) + ( satkEv / 4 ) ) * level / 100 ) + 5 ) * nature )
    property int sdef: Math.floor( ( ( ( ivs + ( 2 * baseSDef ) + ( sdefEv / 4 ) ) * level / 100 ) + 5 ) * nature )
    property int spe: Math.floor( ( ( ( ivs + ( 2 * baseSpe ) + ( speEv / 4 ) ) * level / 100 ) + 5 ) * nature )


    property real wild: 1
    property real speciesExp
    property real trainer: 1
    property real luckyEgg: 1


    property int exp
    property int levelUpExp: Math.floor( Math.pow(level+1,3) - Math.pow(level,3))
    property int percentExp: Math.floor( ( exp - Math.pow(level,3) ) * 100 / levelUpExp )

    property int move1: 1
    property int move2: 0
    property int move3: 0
    property int move4: 0


    AnimatedImage {
        width: sourceSize.width < (screen.width - Theme.paddingLarge*3 ) / 2 * 0.4 ? (screen.width - Theme.paddingLarge*3 ) / 2 * 0.4 : sourceSize.width
        height: width
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "pics/" + indexString + ".gif"
    }

    Label {
        id: nameLabel
        text: name
        anchors {
            top: parent.top
            left: parent.left
            leftMargin: Theme.paddingMedium
        }
        font.pixelSize: Theme.fontSizeSmall
    }
    Label {
        id: lifeLabel
        text: "HP: " + percentHP + "%"
        anchors {
            bottom: parent.bottom
            bottomMargin: Theme.paddingSmall
            right: parent.right
            rightMargin: Theme.paddingMedium
        }
        font.pixelSize: Theme.fontSizeExtraSmall
    }
    Label {
        id: levelLabel
        text: "Lv. " + level
        anchors {
            top: nameLabel.bottom
            left: parent.left
            leftMargin: Theme.paddingMedium
        }
        font.pixelSize: Theme.fontSizeExtraSmall
    }
    Label {
        id: expLabel
        text: "Exp: " + percentExp + "%"
        anchors {
            bottom: parent.bottom
            bottomMargin: Theme.paddingSmall
            left: parent.left
            leftMargin: Theme.paddingMedium

        }
        font.pixelSize: Theme.fontSizeExtraSmall
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            var secondType = type2 === "null" ? "" : "-" + type2
            functions.updateConsole(
                        name + " " + type1 + secondType + " Lvl: " + level +
                        "\nHP: " + hp + " Atk: " + atk + " Def: " + def +
                        "\nS.Atk: " + satk + " S.Def: " + sdef + " Spe: " + spe +
                        "\nExp. : " + exp + "/" + Math.pow(level+1,3)
                        )
        }
        onPressed: parent.color = Theme.secondaryHighlightColor
        onReleased: parent.color = "transparent"
        enabled: idle && !loading && !waiting
    }
}
