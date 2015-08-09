import QtQuick 2.0
import QtQuick.XmlListModel 2.0

import "xmls"


Item {
    id: functions

    property int expShare: 1
    property int expPointPower: 1


    XmlListModel {
        id: pokedexModel
        source: "xmls/pokedex.xml"
        query: "/pokedex/index"

        XmlRole { name: "name"; query: "name/string()" }
        XmlRole { name: "type1"; query: "type1/string()" }
        XmlRole { name: "type2"; query: "type2/string()" }
        XmlRole { name: "baseHp"; query: "hp/string()" }
        XmlRole { name: "baseAtk"; query: "atk/string()" }
        XmlRole { name: "baseDef"; query: "def/string()" }
        XmlRole { name: "baseSatk"; query: "satk/string()" }
        XmlRole { name: "baseSDef"; query: "sdef/string()" }
        XmlRole { name: "baseSpe"; query: "spe/string()" }
        XmlRole { name: "baseHpEv"; query: "hpev/string()" }
        XmlRole { name: "baseAtkEv"; query: "atkev/string()" }
        XmlRole { name: "baseDefEv"; query: "defev/string()" }
        XmlRole { name: "baseSatkEv"; query: "satkev/string()" }
        XmlRole { name: "baseSDefEv"; query: "sdefev/string()" }
        XmlRole { name: "baseSpeEv"; query: "speev/string()" }
        XmlRole { name: "speciesExp"; query: "speciesexp/string()" }

        onStatusChanged: {
            if (status === XmlListModel.Ready) {
                console.log("Pokedex Ready")
            }
        }
    }
    XmlListModel {
        id: movedexModel
        source: "xmls/movedex.xml"
        query: "/movedex/index"

        XmlRole { name: "name"; query: "name/string()" }
        XmlRole { name: "type"; query: "type/string()" }
        XmlRole { name: "category"; query: "category/string()" }
        XmlRole { name: "power"; query: "power/string()" }
        XmlRole { name: "accuracy"; query: "accuracy/string()" }
        XmlRole { name: "pp"; query: "pp/string()" }

        onStatusChanged: {
            console.log(status)
            if (status === XmlListModel.Ready) {
                console.log("Movedex Ready")
                console.log(get(1).name)
            }
        }
    }


    Timer {
        id: consoleTimer
        property variant stringQueue: []
        property string consoleText
        property int count: 100000
        interval: 30
        onTriggered: {
            if ( consoleText !== "" && count <= consoleText.length + 20) {
                gameConsole.text = consoleText.slice(0,count)
                count++
            } else if ( stringQueue.length > 0 ) {
                console.log(stringQueue)
                var temp = stringQueue
                consoleText = temp.shift()
                stringQueue = temp
                console.log(stringQueue)
                count = 1
            } else {
                consoleText = ""
                idle = true
                loading = false
                repeat = false
            }
        }
    }

    /*
    Timer {
        id: functionsTimer
        property variant queue: []
        interval: 10

    }

    function functionQueue() {

    }
    */

    function consoleClick() {
        waiting = false
        gameConsole.border.width = 1
        if ( active.life === 0 ) {
            idle = false
            gameConsole.text = active.name + " is fainted!\nHeal it in the pulley menu!"
        }else if ( enemy.life === 0) {
            idle = false
            gameConsole.text = "What do you want to do?\nChoose in the pulley menu!"
        } else {
            gameConsole.text = "What should " + active.name + " do?"
        }
    }

    function updateConsole(toConsole) {
        console.log(consoleTimer.stringQueue)
        var temp = consoleTimer.stringQueue
        temp[temp.length] = toConsole
        consoleTimer.stringQueue = temp
        console.log(consoleTimer.stringQueue)
        if (!consoleTimer.running) {
            idle = false
            loading = true
            waiting = true
            consoleTimer.repeat = true
            consoleTimer.count = 1
            consoleTimer.running = true
        }
    }

    function generateActive(monster) {
        monster.indexInt = Math.random()*3 + 1
        monster.level = 5
        if ( monster.level === 1)
            monster.exp = 0
        else
            monster.exp = Math.floor(Math.pow(monster.level,3))
        monster.name = pokedexModel.get(monster.indexInt-1).name
        updateConsole("You received a level " + monster.level + " " + monster.name + "!")
        monster.type1 = pokedexModel.get(monster.indexInt-1).type1
        monster.type2 = pokedexModel.get(monster.indexInt-1).type2
        monster.baseHp = pokedexModel.get(monster.indexInt-1).baseHp
        monster.baseAtk = pokedexModel.get(monster.indexInt-1).baseAtk
        monster.baseDef = pokedexModel.get(monster.indexInt-1).baseDef
        monster.baseSatk = pokedexModel.get(monster.indexInt-1).baseSatk
        monster.baseSDef = pokedexModel.get(monster.indexInt-1).baseSDef
        monster.baseSpe = pokedexModel.get(monster.indexInt-1).baseSpe
        monster.baseHpEv = pokedexModel.get(monster.indexInt-1).baseHpEv
        monster.baseAtkEv = pokedexModel.get(monster.indexInt-1).baseAtkEv
        monster.baseDefEv = pokedexModel.get(monster.indexInt-1).baseDefEv
        monster.baseSatkEv = pokedexModel.get(monster.indexInt-1).baseSatkEv
        monster.baseSDefEv = pokedexModel.get(monster.indexInt-1).baseSDefEv
        monster.baseSpeEv = pokedexModel.get(monster.indexInt-1).baseSpeEv
        monster.speciesExp = pokedexModel.get(monster.indexInt-1).speciesExp
        monster.life = monster.hp
        move1.name = movedexModel.get(monster.move1).name
        move1.type = movedexModel.get(monster.move1).type
        move1.category = movedexModel.get(monster.move1).category
        move1.power = movedexModel.get(monster.move1).power
        move1.accuracy = movedexModel.get(monster.move1).accuracy
        move1.pp = movedexModel.get(monster.move1).pp
        move1.ppTot = movedexModel.get(monster.move1).pp
        move2.name = movedexModel.get(monster.move2).name
        move2.type = movedexModel.get(monster.move2).type
        move2.category = movedexModel.get(monster.move2).category
        move2.power = movedexModel.get(monster.move2).power
        move2.accuracy = movedexModel.get(monster.move2).accuracy
        move2.pp = movedexModel.get(monster.move2).pp
        move2.ppTot = movedexModel.get(monster.move2).pp
        move3.name = movedexModel.get(monster.move3).name
        move3.type = movedexModel.get(monster.move3).type
        move3.category = movedexModel.get(monster.move3).category
        move3.power = movedexModel.get(monster.move3).power
        move3.accuracy = movedexModel.get(monster.move3).accuracy
        move3.pp = movedexModel.get(monster.move3).pp
        move3.ppTot = movedexModel.get(monster.move3).pp
        move4.name = movedexModel.get(monster.move4).name
        move4.type = movedexModel.get(monster.move4).type
        move4.category = movedexModel.get(monster.move4).category
        move4.power = movedexModel.get(monster.move4).power
        move4.accuracy = movedexModel.get(monster.move4).accuracy
        move4.pp = movedexModel.get(monster.move4).pp
        move4.ppTot = movedexModel.get(monster.move4).pp
    }

    function generateEnemy(monster) {
        monster.indexInt = Math.random()*3 + 1
        monster.level =  Math.random()*6 + active.level - 3
        if ( monster.level === 1)
            monster.exp = 0
        else
            monster.exp = Math.floor(Math.pow(monster.level,3))
        monster.name = pokedexModel.get(monster.indexInt-1).name
        updateConsole("A wild " + monster.name + " appeared!")
        monster.type1 = pokedexModel.get(monster.indexInt-1).type1
        monster.type2 = pokedexModel.get(monster.indexInt-1).type2
        monster.baseHp = pokedexModel.get(monster.indexInt-1).baseHp
        monster.baseAtk = pokedexModel.get(monster.indexInt-1).baseAtk
        monster.baseDef = pokedexModel.get(monster.indexInt-1).baseDef
        monster.baseSatk = pokedexModel.get(monster.indexInt-1).baseSatk
        monster.baseSDef = pokedexModel.get(monster.indexInt-1).baseSDef
        monster.baseSpe = pokedexModel.get(monster.indexInt-1).baseSpe
        monster.baseHpEv = pokedexModel.get(monster.indexInt-1).baseHpEv
        monster.baseAtkEv = pokedexModel.get(monster.indexInt-1).baseAtkEv
        monster.baseDefEv = pokedexModel.get(monster.indexInt-1).baseDefEv
        monster.baseSatkEv = pokedexModel.get(monster.indexInt-1).baseSatkEv
        monster.baseSDefEv = pokedexModel.get(monster.indexInt-1).baseSDefEv
        monster.baseSpeEv = pokedexModel.get(monster.indexInt-1).baseSpeEv
        monster.speciesExp = pokedexModel.get(monster.indexInt-1).speciesExp
        monster.life = monster.hp
        enemyMove1.name = movedexModel.get(monster.move1).name
        enemyMove1.type = movedexModel.get(monster.move1).type
        enemyMove1.category = movedexModel.get(monster.move1).category
        enemyMove1.power = movedexModel.get(monster.move1).power
        enemyMove1.accuracy = movedexModel.get(monster.move1).accuracy
        enemyMove1.pp = movedexModel.get(monster.move1).pp
        enemyMove1.ppTot = movedexModel.get(monster.move1).pp
        enemyMove2.name = movedexModel.get(monster.move2).name
        enemyMove2.type = movedexModel.get(monster.move2).type
        enemyMove2.category = movedexModel.get(monster.move2).category
        enemyMove2.power = movedexModel.get(monster.move2).power
        enemyMove2.accuracy = movedexModel.get(monster.move2).accuracy
        enemyMove2.pp = movedexModel.get(monster.move2).pp
        enemyMove2.ppTot = movedexModel.get(monster.move2).pp
        enemyMove3.name = movedexModel.get(monster.move3).name
        enemyMove3.type = movedexModel.get(monster.move3).type
        enemyMove3.category = movedexModel.get(monster.move3).category
        enemyMove3.power = movedexModel.get(monster.move3).power
        enemyMove3.accuracy = movedexModel.get(monster.move3).accuracy
        enemyMove3.pp = movedexModel.get(monster.move3).pp
        enemyMove3.ppTot = movedexModel.get(monster.move3).pp
        enemyMove4.name = movedexModel.get(monster.move4).name
        enemyMove4.type = movedexModel.get(monster.move4).type
        enemyMove4.category = movedexModel.get(monster.move4).category
        enemyMove4.power = movedexModel.get(monster.move4).power
        enemyMove4.accuracy = movedexModel.get(monster.move4).accuracy
        enemyMove4.pp = movedexModel.get(monster.move4).pp
        enemyMove4.ppTot = movedexModel.get(monster.move4).pp
    }

    function logStats(monster) {
        console.log("HP: " + monster.hp)
        console.log("ATK: " + monster.atk)
        console.log("DEF: " + monster.def)
        console.log("SATK: " + monster.satk)
        console.log("SDEF: " + monster.sdef)
        console.log("SPE: " + monster.spe)
    }

    function chooseTurn(activeMove) {
        var enemyMoveArray = []
        for( var i = 0; i < 4; i++ ) {
            if ( i === 0 && enemyMove1.name !== "Null" ) {
                enemyMoveArray.push(enemyMove1)
            } else if ( i === 1 && enemyMove2.name !== "Null" ) {
                enemyMoveArray.push(enemyMove2)
            } else if ( i === 2 && enemyMove3.name !== "Null" ) {
                enemyMoveArray.push(enemyMove3)
            } else if ( i === 3 && enemyMove4.name !== "Null" ) {
                enemyMoveArray.push(enemyMove4)
            }
        }
        var rand = Math.floor(Math.random() * enemyMoveArray.length)
        if ( rand === enemyMoveArray.length )
            rand = enemyMoveArray.length - 1
        var enemyMove = enemyMoveArray[rand]
        if ( active.spe > enemy.spe ) {
            attack(activeMove)
            enemyAttack(enemyMove)
        } else if (active.spe < enemy.spe) {
            enemyAttack(enemyMove)
            attack(activeMove)
        } else {
            rand = Math.random()
            if ( rand <= 0.5) {
                attack(activeMove)
                enemyAttack(enemyMove)
            } else {
                enemyAttack(enemyMove)
                attack(activeMove)
            }
        }
    }

    function attack(move) {
        console.log(move.accuracy)
        var fail = Math.random() < ( move.accuracy / 100 ) ? 1 : 0 // 1 attack, 0 fail
        var criticalHit = Math.random() < 1/16 ? 1.5 : 1
        if (active.life !== 0 && enemy.life !== 0) {
            if ( move.pp > 0) {
                updateConsole(active.name + " uses " + move.name + "!")
                move.pp -= 1
                if ( fail ) {
                    if ( criticalHit === 1.5)
                        updateConsole("Critical Hit!")
                    var damage = Math.floor ( ( ( ( 2 * active.level + 10 ) / 250 ) * active.atk/enemy.def * move.power + 2 ) * criticalHit )
                    if ( enemy.life - damage > 0 ) {
                        enemy.life -= damage
                        updateConsole("Wild " + enemy.name + " loses " + damage + " hp!")
                    } else {
                        kill()
                    }
                } else {
                    updateConsole(active.name + "'s attack missed!")
                }
            } else {
                updateConsole("No PP Left!")
                updateConsole(active.name + " uses Struggle")
                if ( criticalHit === 1.5)
                    updateConsole("Critical Hit!")
                damage = Math.floor ( ( ( ( ( 2 * active.level + 10 ) / 250 ) * active.atk/enemy.def * 50 + 2 ) ) * criticalHit )
                updateConsole("Wild " + enemy.name + " loses " + damage + " hp!")
                if ( enemy.life - damage > 0 )
                    enemy.life -= damage
                else {
                    enemy.life = 0
                    updateConsole("Wild " + enemy.name + " fainted!")
                }
                updateConsole(active.name + " is hit by recoil!")
                if ( active.life - 1/4 * active.hp * criticalHit > 0 ) {
                    active.life -= 1/4 * active.hp * criticalHit
                    updateConsole(active.name + " loses " + damage + " hp!")
                } else {
                    active.life = 0
                    updateConsole(active.name + " fainted...")
                }
                if ( enemy.life === 0 && active.life !== 0)
                    kill()
            }
        }
    }

    function enemyAttack(move) {
        console.log(move.accuracy)
        var fail = Math.random() < ( move.accuracy / 100 ) ? 1 : 0 // 1 attack, 0 fail
        var criticalHit = Math.random() < 1/16 ? 1.5 : 1
        if ( active.life !== 0 && enemy.life !== 0 ) {
            if ( move.pp > 0) {
                updateConsole("Wild " + enemy.name + " uses " + move.name + "!")
                move.pp -= 1
                if ( fail ) {
                    if ( criticalHit === 1.5)
                        updateConsole("Critical Hit!")
                    var damage = Math.floor ( ( ( ( 2 * enemy.level + 10 ) / 250 ) * enemy.atk/active.def * move.power + 2 ) * criticalHit )
                    updateConsole( active.name + " loses " + damage + " hp!")
                    if ( active.life - damage > 0 ) {
                        active.life -= damage
                    } else {
                        active.life = 0
                        updateConsole(active.name + " fainted...")
                    }
                } else {
                    updateConsole("Wild " + enemy.name + "'s attack missed!")
                }
            } else {
                updateConsole("Wild " + enemy.name + " has no PP Left!")
                updateConsole("Wild " + enemy.name + " uses Struggle")
                if ( criticalHit === 1.5)
                    updateConsole("Critical Hit!")
                damage = Math.floor ( ( ( ( ( 2 * enemy.level + 10 ) / 250 ) * enemy.atk/active.def * 50 + 2 ) ) * criticalHit )
                updateConsole( active.name + " loses " + damage + " hp!")
                if ( active.life - damage > 0 ) {
                    active.life -= damage
                } else {
                    active.life = 0
                    updateConsole(active.name + " fainted...")
                }
                updateConsole("Wild " + enemy.name + " is hit by recoil!")
                if ( enemy.life - 1/4 * enemy.hp * criticalHit > 0 ) {
                    updateConsole("Wild " + enemy.name + " loses " + damage + " hp!")
                    enemy.life -= 1/4 * enemy.hp * criticalHit
                } else {
                    if (active.life > 0)
                        kill()
                    else {
                        enemy.life = 0
                        updateConsole("Wild " + enemy.name + " fainted!")
                    }
                }
            }
        }
    }

    function kill() {
        updateConsole("Wild " + enemy.name + " fainted!")
        active.hpEv += enemy.baseHpEv
        active.atkEv += enemy.baseAtkEv
        active.defEv += enemy.baseDefEv
        active.satkEv += enemy.baseSatkEv
        active.sdefEv += enemy.baseSDefEv
        active.speEv += enemy.baseSpeEv
        var gainedExp = Math.floor ( ( ( enemy.wild * enemy.speciesExp * enemy.level ) / ( expShare * 5 ) * Math.pow(2 * enemy.level + 10,2.5) / Math.pow(enemy.level + active.level + 10, 2.5) + 1 ) * active.trainer * enemy.luckyEgg * expPointPower )
        if ( gainedExp + active.exp < Math.pow(active.level+1,3)) {
            active.exp += gainedExp
            updateConsole(active.name + " gained " + gainedExp + " exp. !")
        } else {
            active.exp += gainedExp
            active.level +=1
            active.life = active.hp
            updateConsole(active.name + " gained " + gainedExp + " exp. !")
            updateConsole(active.name + " is now level " + active.level + "!")
        }
        enemy.life = 0
    }

    function heal() {
        active.life = active.hp
        move1.pp = move1.ppTot
        updateConsole( active.name + " has been healed!")
    }

} // end Item
