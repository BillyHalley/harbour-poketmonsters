import QtQuick 2.0

Item {
    id: functions

    property int expShare: 1
    property int expPointPower: 1

    Timer {
        id: consoleTimer
        property variant stringQueue: []
        property string consoleText
        property int count: 100000
        interval: 25
        onTriggered: {
            if ( consoleText !== "" && count <= consoleText.length + 10) {
                gameConsole.text = consoleText.slice(0,count)
                count++
            } else if ( stringQueue.length > 0 ) {
                //console.log(stringQueue)
                var temp = stringQueue
                consoleText = temp.shift()
                stringQueue = temp
                //console.log(stringQueue)
                count = 1
            } else {
                consoleText = ""
                idle = true
                loading = false
                repeat = false
            }
        }
    }

    function consoleClick() {
        waiting = false
        gameConsole.border.width = 1
        if ( moment === 0) {
            if ( active.life <= 0 ) {
                idle = false
                gameConsole.text = active.name + " is fainted!\nHeal it in the pulley menu!"
            } else if ( enemy.life <= 0) {
                idle = false
                gameConsole.text = "What do you want to do?\nChoose in the pulley menu!"
            } else {
                gameConsole.text = "What should " + active.name + " do?"
            }
            moment = 1
        } else if ( moment === 2 ) {
            if ( turn == 1 )
                moveset.enemyAttack(moveRand)
            if ( turn == 2)
                moveset.attack(moveIndex)
        } else if ( moment === 1 ) {
            idle = false
            gameConsole.text = "What do you want to do?\nChoose in the pulley menu"
        }
        moment = 0
    }

    function updateConsole(toConsole) {
        //console.log(consoleTimer.stringQueue)
        var temp = consoleTimer.stringQueue
        temp[temp.length] = toConsole
        consoleTimer.stringQueue = temp
        //console.log(consoleTimer.stringQueue)
        if (!consoleTimer.running) {
            idle = false
            loading = true
            waiting = true
            consoleTimer.repeat = true
            consoleTimer.count = 1
            consoleTimer.running = true
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
        active.exp += gainedExp
        updateConsole(active.name + " gained " + gainedExp + " exp. !")
        if ( active.exp >= Math.pow(active.level+1,3))
            levelUp()
        enemy.life = 0
        moment = 0
    }

    function levelUp() {
        active.level +=1
        active.life = active.hp
        updateConsole(active.name + " is now level " + active.level + "!")
        newMove()
    }

    function newMove () {
        var newMove = manager.newMove(active.indexString,active.level)
        if (newMove[0] !== "0") {
            moveset.newMove(newMove)
            var string = active.newMove(newMove)
        }
        updateConsole(string)

    }

} // end Item
