import QtQuick 2.0
import Sailfish.Silica 1.0
import "pics"

Rectangle {
    id: monster

    width: ( screen.width - Theme.paddingLarge * 3 ) /2
    height: width
    color: "transparent"
    border.color: Theme.primaryColor

    property var string: [index,name,type1,type2,level,exp,life,hpEv,atkEv,defEv,satkEv,sdefEv,speEv,move1.id,move1.pp,move2.id,move2.pp,move3.id,move3.pp,move4.id,move4.pp]
    property var movesString: [move1.id,move2.id,move3.id,move4.id,move1.pp,move2.pp,move3.pp,move4.pp]

    property int index
    property string indexString: index < 10 ? "00" + index : index < 100 ? "0" + index : index

    property string name
    property string type1
    property string type2

    property int level
    property int exp: Math.pow(level,3)
    property int levelUpExp: Math.pow(level+1,3) - Math.pow(level,3)
    property int percentExp: Math.floor( (exp - Math.pow(level,3)) * 100 / levelUpExp )
    property int life: hp
    property double percentHp: Math.floor( life * 100 / hp )


    property int ivs: 0
    property int nature: 1

    property int baseHpEv
    property int baseAtkEv
    property int baseDefEv
    property int baseSatkEv
    property int baseSdefEv
    property int baseSpeEv
    property real speciesExp
    property real wild: 1
    property real trainer: 1
    property real luckyEgg: 1

    property int baseHp
    property int baseAtk
    property int baseDef
    property int baseSatk
    property int baseSdef
    property int baseSpe

    property int hpEv: 0
    property int atkEv: 0
    property int defEv: 0
    property int satkEv: 0
    property int sdefEv: 0
    property int speEv: 0

    property int hp: Math.floor ( ( ( ivs + ( 2 * baseHp ) + ( hpEv / 4 ) + 100 ) * level / 100 ) + 10 )
    property int atk: Math.floor( (((ivs + ( 2 * baseAtk ) + ( atkEv / 4 ) ) * level / 100 ) + 5 ) * nature )
    property int def: Math.floor( (((ivs + ( 2 * baseDef ) + ( defEv / 4 ) ) * level / 100 ) + 5 ) * nature )
    property int satk: Math.floor( (((ivs + ( 2 * baseSatk ) + ( satkEv / 4 ) ) * level / 100 ) + 5 ) * nature )
    property int sdef: Math.floor( (((ivs + ( 2 * baseSdef ) + ( sdefEv / 4 ) ) * level / 100 ) + 5 ) * nature )
    property int spe: Math.floor( (((ivs + ( 2 * baseSpe ) + ( speEv / 4 ) ) * level / 100 ) + 5 ) * nature )

    property int atkStage: 0
    property int defStage: 0
    property int satkStage: 0
    property int sdefStage: 0
    property int speStage: 0
    property int accuracyStage: 0
    property int evasionStage: 0

    function fetch(stringList) {
        index = stringList[0]
        indexString = stringList[1]
        level = stringList[2]
        name = stringList[3]
        type1 = stringList[4]
        type2 = stringList[5]
        baseHp = stringList[6]
        baseAtk = stringList[7]
        baseDef = stringList[8]
        baseSatk = stringList[9]
        baseSdef = stringList[10]
        baseSpe = stringList[11]
        baseHpEv = stringList[12]
        baseAtkEv = stringList[13]
        baseDefEv = stringList[14]
        baseSatkEv = stringList[15]
        baseSdefEv = stringList[16]
        baseSpeEv = stringList[17]
        speciesExp = stringList[18]
        move1.id = stringList[19]
        move2.id = stringList[20]
        move3.id = stringList[21]
        move4.id = stringList[22]
    }

    function load(stringList) {
        index = stringList[0]
        name = stringList[1]
        type1 = stringList[2]
        type2 = stringList[3]
        level = stringList[4]
        exp = stringList[5]
        life = stringList[6]
        hpEv = stringList[7]
        atkEv = stringList[8]
        defEv = stringList[9]
        satkEv = stringList[10]
        sdefEv = stringList[11]
        speEv = stringList[12]
        move1.id = stringList[13]
        move1.pp = stringList[14]
        move2.id = stringList[15]
        move2.pp = stringList[16]
        move3.id = stringList[17]
        move3.pp = stringList[18]
        move4.id = stringList[19]
        move4.pp = stringList[20]
    }

    function loadMoves(stringList,movesList) {
        for ( var i = 0; i < 4; i++) {
            switch ( i ) {
            case 0:
                move1.id = parseInt(stringList[14*i+0])
                move1.name = stringList[14*i+3]
                move1.type = stringList[14*i+4]
                move1.category = stringList[14*i+5]
                move1.power = parseInt(stringList[14*i+6])
                move1.accuracy = parseInt(stringList[14*i+7])
                move1.pp = parseInt(stringList[14*i+8])
                move1.ppTot = parseInt(stringList[14*i+8])
                move1.statusAffected = stringList[14*i+9]
                move1.self = stringList[14*i+10]
                move1.rise = parseInt(stringList[14*i+11])
                move1.amount = stringList[14*i+12]
                move1.description = stringList[14*i+13]
                break
            case 1:
                move2.id = parseInt(stringList[14*i+0])
                move2.name = stringList[14*i+3]
                move2.type = stringList[14*i+4]
                move2.category = stringList[14*i+5]
                move2.power = parseInt(stringList[14*i+6])
                move2.accuracy = parseInt(stringList[14*i+7])
                move2.pp = parseInt(stringList[14*i+8])
                move2.ppTot = parseInt(stringList[14*i+8])
                move2.statusAffected = stringList[14*i+9]
                move2.self = stringList[14*i+10]
                move2.rise = parseInt(stringList[14*i+11])
                move2.amount = stringList[14*i+12]
                move2.description = stringList[14*i+13]
                break
            case 2:
                move3.id = parseInt(stringList[14*i+0])
                move3.name = stringList[14*i+3]
                move3.type = stringList[14*i+4]
                move3.category = stringList[14*i+5]
                move3.power = parseInt(stringList[14*i+6])
                move3.accuracy = parseInt(stringList[14*i+7])
                move3.pp = parseInt(stringList[14*i+8])
                move3.ppTot = parseInt(stringList[14*i+8])
                move3.statusAffected = stringList[14*i+9]
                move3.self = stringList[14*i+10]
                move3.rise = parseInt(stringList[14*i+11])
                move3.amount = stringList[14*i+12]
                move3.description = stringList[14*i+13]
                break
            case 3:
                move4.id = parseInt(stringList[14*i+0])
                move4.name = stringList[14*i+3]
                move4.type = stringList[14*i+4]
                move4.category = stringList[14*i+5]
                move4.power = parseInt(stringList[14*i+6])
                move4.accuracy = parseInt(stringList[14*i+7])
                move4.pp = parseInt(stringList[14*i+8])
                move4.ppTot = parseInt(stringList[14*i+8])
                move4.statusAffected = stringList[14*i+9]
                move4.self = stringList[14*i+10]
                move4.rise = parseInt(stringList[14*i+11])
                move4.amount = stringList[14*i+12]
                move4.description = stringList[14*i+13]
                break
            }
        }
        if  ( movesList[4] !== 0)
            move1.pp = parseInt(movesList[4])
        if  ( movesList[5] !== 0)
            move2.pp = parseInt(movesList[5])
        if  ( movesList[6] !== 0)
            move3.pp = parseInt(movesList[6])
        if  ( movesList[7] !== 0)
            move4.pp = parseInt(movesList[7])
        console.log(move1.name,move2.name,move3.name,move4.name)
    }

    Move { id: move1 } Move { id: move2 } Move { id: move3 } Move { id: move4 }

    function heal() {
        move1.pp = move1.ppTot
        move2.pp = move2.ppTot
        move3.pp = move3.ppTot
        move4.pp = move4.ppTot
        life = hp
    }

    function newMove(stringList) {
        console.log()
        if ( move1.name === "Null") {
            move1.id = parseInt(stringList[0])
            move1.name = stringList[3]
            move1.type = stringList[4]
            move1.category = stringList[5]
            move1.power = parseInt(stringList[6])
            move1.accuracy = parseInt(stringList[7])
            move1.pp = parseInt(stringList[8])
            move1.ppTot = parseInt(stringList[8])
            move1.statusAffected = stringList[9]
            move1.self = stringList[10]
            move1.rise = parseInt(stringList[11])
            move1.amount = stringList[12]
            move1.description = stringList[13]
        } else if ( move2.name === "Null" ) {
            move2.id = parseInt(stringList[0])
            move2.name = stringList[3]
            move2.type = stringList[4]
            move2.category = stringList[5]
            move2.power = parseInt(stringList[6])
            move2.accuracy = parseInt(stringList[7])
            move2.pp = parseInt(stringList[8])
            move2.ppTot = parseInt(stringList[8])
            move2.statusAffected = stringList[9]
            move2.self = stringList[10]
            move2.rise = parseInt(stringList[11])
            move2.amount = stringList[12]
            move2.description = stringList[13]
        } else if ( move3.name === "Null" ) {
            move3.id = parseInt(stringList[0])
            move3.name = stringList[3]
            move3.type = stringList[4]
            move3.category = stringList[5]
            move3.power = parseInt(stringList[6])
            move3.accuracy = parseInt(stringList[7])
            move3.pp = parseInt(stringList[8])
            move3.ppTot = parseInt(stringList[8])
            move3.statusAffected = stringList[9]
            move3.self = stringList[10]
            move3.rise = parseInt(stringList[11])
            move3.amount = stringList[12]
            move3.description = stringList[13]
        } else if ( move4.name === "Null" ) {
            move4.id = parseInt(stringList[0])
            move4.name = stringList[3]
            move4.type = stringList[4]
            move4.category = stringList[5]
            move4.power = parseInt(stringList[6])
            move4.accuracy = parseInt(stringList[7])
            move4.pp = parseInt(stringList[8])
            move4.ppTot = parseInt(stringList[8])
            move4.statusAffected = stringList[9]
            move4.self = stringList[10]
            move4.rise = parseInt(stringList[11])
            move4.amount = stringList[12]
            move4.description = stringList[13]
        } else {
            console.log("Chose where to assign")
        }
        var string = active.name + " learned " + stringList[3]
        return string
    }

    AnimatedImage {
        source: "pics/" + indexString + ".gif" === "pics/000.gif" ? "pics/717.gif" : "pics/" + indexString + ".gif"
        width: sourceSize.width * 1.5 //sourceSize.width < ( screen.width - Theme.paddingLarge * 3 ) / 5 ? ( screen.width - Theme.paddingLarge * 3 ) / 5  : sourceSize.width
        height: sourceSize.height * 1.5
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: "pics/" + indexString + ".gif" !== "pics/000.gif"
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
        id: levelLabel
        text: "Lv. " + level
        anchors {
            top: nameLabel.bottom
            left: parent.left
            leftMargin: Theme.paddingMedium
        }
        font.pixelSize: Theme.fontSizeExtraSmall
    }
    Rectangle {
        id: hpBar
        width: ( parent.width - 2 ) * percentHp / 100
        height: Theme.paddingMedium
        anchors.bottom: expBar.top
        anchors.left: parent.left
        anchors.leftMargin: 1
        color: percentHp > 60 ? "green" : percentHp > 25 ? "yellow" : "red"
    }
    Rectangle {
        id: expBar
        width: ( parent.width - 2 ) * percentExp / 100
        height: Theme.paddingMedium
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.left: parent.left
        anchors.leftMargin: 1
        color: "blue"
    }
    Rectangle {
        id: hollowHpBar
        width: ( parent.width - 2 )
        height: Theme.paddingMedium
        anchors.bottom: expBar.top
        anchors.left: parent.left
        anchors.leftMargin: 1
        color: percentHp > 60 ? "green" : percentHp > 25 ? "yellow" : "red"
        z: -1
        opacity: 0.25
    }
    Rectangle {
        id: hollowExpBar
        width: ( parent.width - 2 )
        height: Theme.paddingMedium
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.left: parent.left
        anchors.leftMargin: 1
        color: "blue"
        z: -1
        opacity: 0.25
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: {
            console.log("NAME: " + name)
            console.log("HP: " + hp)
            console.log("ATK: " + atk + " + " + atkStage )
            console.log("DEF: " + def + " + " + defStage )
            console.log("SATK: " + satk + " + " + satkStage )
            console.log("SDEF: " + sdef + " + " + sdefStage )
            console.log("SPE: " + spe + " + " + speStage )
        }
    }
}
