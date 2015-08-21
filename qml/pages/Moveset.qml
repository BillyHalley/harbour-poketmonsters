import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    
    Move { id: move1 } Move { id: move2 } Move { id: move3 } Move { id: move4 }
    Move { id: enemyMove1 } Move { id: enemyMove2 } Move { id: enemyMove3 } Move { id: enemyMove4 }
    Move { id: activeMove } Move { id: enemyActiveMove }

    property var effectsOnEnemy: []
    property var effectsOnActive: []

    function returnPp() {
        var list = [0,0,0,0]
        list[0] = move1.pp
        list[1] = move2.pp
        list[2] = move3.pp
        list[3] = move4.pp
        return list
    }
    
    Functions {
        id: functions
    }
    
    function heal() {
        move1.pp = move1.ppTot
        move2.pp = move2.ppTot
        move3.pp = move3.ppTot
        move4.pp = move4.ppTot
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
                move1.self = stringList[14*i+10] === "true"
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
                move2.self = stringList[14*i+10] === "true"
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
                move3.self = stringList[14*i+10] === "true"
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
                move4.self = stringList[14*i+10] === "true"
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
    
    function newMove(stringList) {
        console.log(stringList)
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
    }

    function loadEnemyMoves(stringList) {
        for ( var i = 0; i < 4; i++) {
            switch ( i ) {
            case 0:
                enemyMove1.id = parseInt(stringList[14*i+0])
                enemyMove1.name = stringList[14*i+3]
                enemyMove1.type = stringList[14*i+4]
                enemyMove1.category = stringList[14*i+5]
                enemyMove1.power = parseInt(stringList[14*i+6])
                enemyMove1.accuracy = parseInt(stringList[14*i+7])
                enemyMove1.pp = parseInt(stringList[14*i+8])
                enemyMove1.ppTot = parseInt(stringList[14*i+8])
                enemyMove1.statusAffected = stringList[14*i+9]
                enemyMove1.self = stringList[14*i+10] === "true"
                enemyMove1.rise = parseInt(stringList[14*i+11])
                enemyMove1.amount = stringList[14*i+12]
                enemyMove1.description = stringList[14*i+13]
                break
            case 1:
                enemyMove2.id = parseInt(stringList[14*i+0])
                enemyMove2.name = stringList[14*i+3]
                enemyMove2.type = stringList[14*i+4]
                enemyMove2.category = stringList[14*i+5]
                enemyMove2.power = parseInt(stringList[14*i+6])
                enemyMove2.accuracy = parseInt(stringList[14*i+7])
                enemyMove2.pp = parseInt(stringList[14*i+8])
                enemyMove2.ppTot = parseInt(stringList[14*i+8])
                enemyMove2.statusAffected = stringList[14*i+9]
                enemyMove2.self = stringList[14*i+10] === "true"
                enemyMove2.rise = parseInt(stringList[14*i+11])
                enemyMove2.amount = stringList[14*i+12]
                enemyMove2.description = stringList[14*i+13]
                break
            case 2:
                enemyMove3.id = parseInt(stringList[14*i+0])
                enemyMove3.name = stringList[14*i+3]
                enemyMove3.type = stringList[14*i+4]
                enemyMove3.category = stringList[14*i+5]
                enemyMove3.power = parseInt(stringList[14*i+6])
                enemyMove3.accuracy = parseInt(stringList[14*i+7])
                enemyMove3.pp = parseInt(stringList[14*i+8])
                enemyMove3.ppTot = parseInt(stringList[14*i+8])
                enemyMove3.statusAffected = stringList[14*i+9]
                enemyMove3.self = stringList[14*i+10] === "true"
                enemyMove3.rise = parseInt(stringList[14*i+11])
                enemyMove3.amount = stringList[14*i+12]
                enemyMove3.description = stringList[14*i+13]
                break
            case 3:
                enemyMove4.id = parseInt(stringList[14*i+0])
                enemyMove4.name = stringList[14*i+3]
                enemyMove4.type = stringList[14*i+4]
                enemyMove4.category = stringList[14*i+5]
                enemyMove4.power = parseInt(stringList[14*i+6])
                enemyMove4.accuracy = parseInt(stringList[14*i+7])
                enemyMove4.pp = parseInt(stringList[14*i+8])
                enemyMove4.ppTot = parseInt(stringList[14*i+8])
                enemyMove4.statusAffected = stringList[14*i+9]
                enemyMove4.self = stringList[14*i+10] === "true"
                enemyMove4.rise = parseInt(stringList[14*i+11])
                enemyMove4.amount = stringList[14*i+12]
                enemyMove4.description = stringList[14*i+13]
                break
            }
        }
        console.log(enemyMove1.name)
    }
    
    function copyMove(first,second) {
        first.id = second.id
        first.name = second.name
        first.type = second.type
        first.category = second.category
        first.power = second.power
        first.accuracy = second.accuracy
        first.pp = second.pp
        first.ppTot = second.ppTot
        first.statusAffected = second.statusAffected
        first.self = second.self
        first.rise = second.rise
        first.amount = second.amount
        first.description = second.description
    }
    
    function chooseTurn(index) {
        switch (index) {
        case 1:
            copyMove(activeMove,move1)
            break
        case 2:
            copyMove(activeMove,move2)
            break
        case 3:
            copyMove(activeMove,move3)
            break
        case 4:
            copyMove(activeMove,move4)
            break
        }
        
        var counter = 0
        if ( enemyMove1.name !== "Null" ) {
            counter += 1
        }
        if ( enemyMove2.name !== "Null" ) {
            counter += 1
        }
        if ( enemyMove3.name !== "Null" ) {
            counter += 1
        }
        if ( enemyMove4.name !== "Null" ) {
            counter += 1
        }
        
        var rand = Math.floor(Math.random() * counter) + 1
        
        moveIndex = index
        moveRand = rand
        
        switch (rand) {
        case 1:
            copyMove(enemyActiveMove,enemyMove1)
            break
        case 2:
            copyMove(enemyActiveMove,enemyMove2)
            break
        case 3:
            copyMove(enemyActiveMove,enemyMove3)
            break
        case 4:
            copyMove(enemyActiveMove,enemyMove4)
            break
        }
        if ( active.spe > enemy.spe ) {
            turn = 1
            attack(index)
        } else if (active.spe < enemy.spe) {
            turn = 2
            enemyAttack(rand)
        } else {
            rand = Math.random()
            if ( rand < 0.5) {
                turn = 1
                attack(index)
            } else {
                turn = 2
                enemyAttack(rand)
            }
        }
    }
    
    function attack(index) {
        var accuracyMultiplier
        if (active.accuracyStage >= 0)
            accuracyMultiplier = ( active.accuracyStage + 3 ) / 3
        else
            accuracyMultiplier = 3 / (  3 - active.accuracyStage )
        var evasionMultiplier
        if ( enemy.evasionStage  < 0 )
            evasionMultiplier = ( 3 - enemy.evasionStage ) / 3
        else
            evasionMultiplier = 3 / ( enemy.evasionStage + 3 )
        
        console.log ( accuracyMultiplier, evasionMultiplier )

        var activeAtk
        if (active.atkStage >= 0)
            activeAtk = ( ( active.atkStage + 2 ) / 2 ) * active.atk
        else
            activeAtk = ( 2 / (  2 - active.atkStage ) ) * active.atk

        var activeSatk
        if (active.satkStage >= 0)
            activeSatk = ( ( active.satkStage + 2 ) / 2 ) * active.satk
        else
            activeSatk = ( 2 / (  2 - active.satkStage ) ) * active.satk

        var enemyDef
        if (enemy.defStage >= 0)
            enemyDef = ( ( enemy.defStage + 2 ) / 2 ) * enemy.def
        else
            enemyDef = ( 2 / (  2 - enemy.defStage ) ) * enemy.def

        var enemySdef
        if (enemy.sdefStage >= 0)
            enemySdef = ( ( enemy.sdefStage + 2 ) / 2 ) * enemy.sdef
        else
            enemySdef = ( 2 / (  2 - enemy.sdefStage ) ) * enemy.sdef
        
        checkEffectsOnActive()

        var move = activeMove
        console.log("Rise: " + move.rise)
        var effectiveness = checkEffectiveness(move.type,enemy.type1,enemy.type2)

        var fail = Math.random() < ( ( move.accuracy / 100 ) * accuracyMultiplier / evasionMultiplier ) || move.accuracy < 0 ? 1 : 0 // 1 attack, 0 fail
        var criticalHit = Math.random() < 1/16 ? 1.5 : 1
        if (active.life !== 0 && enemy.life !== 0) {
            if ( move.pp > 0) {
                functions.updateConsole(active.name + " uses " + move.name + "!")
                if ( fail ) {
                    move.pp -= 1
                    if ( move.category === "Physical") {
                        if ( effectiveness > 0 ) {
                            if ( effectiveness > 1)
                                functions.updateConsole("It's Super Effective!")
                            else if ( effectiveness < 1 && effectiveness > 0)
                                functions.updateConsole("It's not very effective..")
                            if ( criticalHit === 1.5)
                                functions.updateConsole("Critical Hit!")
                            var damage = Math.floor ( ( ( ( 2 * active.level + 10 ) / 250 ) * activeAtk/enemyDef * move.power + 2 ) * criticalHit * effectiveness )
                            if ( enemy.life - damage > 0 ) {
                                enemy.life -= damage
                                functions.updateConsole("Wild " + enemy.name + " loses " + damage + " hp!")
                            } else {
                                functions.kill()
                            }
                        } else {
                            functions.updateConsole("It's ineffective...")
                        }
                    } else if ( move.category === "Special") {
                        if ( effectiveness > 0 ) {
                            if ( effectiveness > 1)
                                functions.updateConsole("It's Super Effective!")
                            else if ( effectiveness < 1 && effectiveness > 0)
                                functions.updateConsole("It's not very effective..")
                            if ( criticalHit === 1.5)
                                functions.updateConsole("Critical Hit!")
                            damage = Math.floor ( ( ( ( 2 * active.level + 10 ) / 250 ) * activeSatk/enemySdef * move.power + 2 ) * criticalHit * effectiveness )
                            if ( enemy.life - damage > 0 ) {
                                enemy.life -= damage
                                functions.updateConsole("Wild " + enemy.name + " loses " + damage + " hp!")
                            } else {
                                functions.kill()
                            }
                        } else {
                            functions.updateConsole("It's ineffective...")
                        }
                    } else if ( move.category === "Status") {
                        if ( move.statusAffected === "atk") {
                            if ( move.self ) {
                                if ( Math.abs(active.atkStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole(active.name + "'s attack rose!")
                                    else
                                        functions.updateConsole(active.name + "'s attack fell!")
                                    active.atkStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            } else {
                                if ( Math.abs(enemy.atkStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole("Enemy's attack rose!")
                                    else
                                        functions.updateConsole("Enemy's attack fell!")
                                    enemy.atkStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            }
                        }
                        if ( move.statusAffected === "def") {
                            if ( move.self ) {
                                if ( Math.abs(active.defStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole(active.name + "'s defense rose!")
                                    else
                                        functions.updateConsole(active.name + "'s defense fell!")
                                    active.defStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            } else {
                                if ( Math.abs(enemy.defStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole("Enemy defense rose!")
                                    else
                                        functions.updateConsole("Enemy defense fell!")
                                    enemy.defStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            }
                        }
                        if ( move.statusAffected === "satk") {

                        }
                        if ( move.statusAffected === "sdef") {

                        }
                        if ( move.statusAffected === "spe") {

                        }
                        if ( move.statusAffected === "accuracy") {
                            if ( move.self ) {
                                if ( Math.abs(active.accuracyStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole(active.name + "'s accuracy rose!")
                                    else
                                        functions.updateConsole(active.name + "'s accuracy fell!")
                                    active.accuracyStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            } else {
                                if ( Math.abs(enemy.accuracyStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole("Enemy's accuracy rose!")
                                    else
                                        functions.updateConsole("Enemy's accuracy fell!")
                                    enemy.accuracyStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            }
                        }
                        if ( move.statusAffected === "evasion") {

                        }
                    } else { // Effect
                        chooseEffectOnEnemy(move)
                    }
                } else {
                    functions.updateConsole(active.name + "'s attack missed!")
                }
            } else {
                functions.updateConsole(active.name + " uses " + move.name + "!")
                functions.updateConsole("No PP Left!")
                functions.updateConsole(active.name + " uses Struggle")
                if ( criticalHit === 1.5)
                    functions.updateConsole("Critical Hit!")
                damage = Math.floor ( ( ( ( ( 2 * active.level + 10 ) / 250 ) * activeAtk/enemyDef * 50 + 2 ) ) * criticalHit )
                functions.updateConsole("Wild " + enemy.name + " loses " + damage + " hp!")
                if ( enemy.life - damage > 0 )
                    enemy.life -= damage
                else {
                    enemy.life = 0
                    functions.updateConsole("Wild " + enemy.name + " fainted!")
                }
                functions.updateConsole(active.name + " is hit by recoil!")
                if ( active.life - 1/4 * active.hp * criticalHit > 0 ) {
                    active.life -= 1/4 * active.hp * criticalHit
                    functions.updateConsole(active.name + " loses " + damage + " hp!")
                } else {
                    active.life = 0
                    functions.updateConsole(active.name + " fainted...")
                }
                if ( enemy.life === 0 && active.life !== 0) {
                    functions.kill()
                }
            }
        }

        
        switch (index) {
        case 1:
            move1.pp = move.pp
            break
        case 2:
            move2.pp = move.pp
            break
        case 3:
            move3.pp = move.pp
            break
        case 4:
            move4.pp = move.pp
            break
        }
        if ( enemy.life > 0 && active.life > 0)
            moment = 2
        else
            moment = 0
    }
    
    function enemyAttack(rand) {
        var move = enemyActiveMove
        console.log("Self: " + move.self)
        var effectiveness = checkEffectiveness(move.type,active.type1,active.type2)

        var accuracyMultiplier
        if (enemy.accuracyStage >= 0)
            accuracyMultiplier = ( enemy.accuracyStage + 3 ) / 3
        else
            accuracyMultiplier = 3 / (  3 - enemy.accuracyStage )
        var evasionMultiplier
        if ( active.evasionStage  < 0 )
            evasionMultiplier = ( 3 - active.evasionStage ) / 3
        else
            evasionMultiplier = 3 / ( active.evasionStage + 3 )

        console.log ( accuracyMultiplier, evasionMultiplier )

        var enemyAtk
        if (enemy.atkStage >= 0)
            enemyAtk = ( ( enemy.atkStage + 2 ) / 2 ) * enemy.atk
        else
            enemyAtk = ( 2 / (  2 - enemy.atkStage ) ) * enemy.atk

        var enemySatk
        if (enemy.satkStage >= 0)
            enemySatk = ( ( enemy.satkStage + 2 ) / 2 ) * enemy.satk
        else
            enemySatk = ( 2 / (  2 - enemy.satkStage ) ) * enemy.satk

        var activeDef
        if (active.defStage >= 0)
            activeDef = ( ( active.defStage + 2 ) / 2 ) * active.def
        else
            activeDef = ( 2 / (  2 - active.defStage ) ) * active.def

        var activeSdef
        if (enemy.sdefStage >= 0)
            activeSdef = ( ( active.sdefStage + 2 ) / 2 ) * active.sdef
        else
            activeSdef = ( 2 / (  2 - active.sdefStage ) ) * active.sdef

        var fail = Math.random() < ( ( move.accuracy / 100 ) * accuracyMultiplier / evasionMultiplier ) || move.accuracy < 0 ? 1 : 0 // 1 attack, 0 fail

        var criticalHit = Math.random() < 1/16 ? 1.5 : 1

        checkEffectsOnEnemy()

        if ( active.life !== 0 && enemy.life !== 0 ) {
            functions.updateConsole("Wild " + enemy.name + " uses " + move.name + "!")
            if ( move.pp > 0) {
                if ( fail ) {
                    move.pp -= 1
                    if ( move.category === "Physical") {
                        if ( effectiveness > 0 ) {
                            if ( effectiveness > 1)
                                functions.updateConsole("It's Super Effective!")
                            else if ( effectiveness < 1 && effectiveness > 0)
                                functions.updateConsole("It's not very effective..")
                            if ( criticalHit === 1.5)
                                functions.updateConsole("Critical Hit!")
                            var damage = Math.floor ( ( ( ( 2 * enemy.level + 10 ) / 250 ) * enemyAtk/activeDef * move.power + 2 ) * criticalHit * effectiveness )
                            functions.updateConsole( active.name + " loses " + damage + " hp!")
                            if ( active.life - damage > 0 ) {
                                active.life -= damage
                            } else {
                                active.life = 0
                                functions.updateConsole(active.name + " fainted...")
                            }
                        } else {
                            functions.updateConsole("It's ineffective...")
                        }
                    }  else if ( move.category === "Special") {
                        if ( effectiveness > 0 ) {
                            if ( effectiveness > 1)
                                functions.updateConsole("It's Super Effective!")
                            else if ( effectiveness < 1 && effectiveness > 0)
                                functions.updateConsole("It's not very effective..")
                            if ( criticalHit === 1.5)
                                functions.updateConsole("Critical Hit!")
                            damage = Math.floor ( ( ( ( 2 * enemy.level + 10 ) / 250 ) * enemySatk/activeSdef * move.power + 2 ) * criticalHit * effectiveness )
                            functions.updateConsole( active.name + " loses " + damage + " hp!")
                            if ( active.life - damage > 0 ) {
                                active.life -= damage
                            } else {
                                active.life = 0
                                functions.updateConsole(active.name + " fainted...")
                            }
                        } else {
                            functions.updateConsole("It's ineffective...")
                        }
                    } else if ( move.category === "Status") {
                        if ( move.statusAffected === "atk") {
                            if ( move.self ) {
                                if ( Math.abs(enemy.atkStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole("Enemy attack rose!")
                                    else
                                        functions.updateConsole("Enemy attack fell!")
                                    enemy.atkStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            } else {
                                if ( Math.abs(active.atkStage) < 6) {

                                    if ( move.rise > 0)
                                        functions.updateConsole(active.name + "'s attack rose!")
                                    else
                                        functions.updateConsole(active.name + "'s attack fell!")
                                    active.atkStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            }
                        }
                        if ( move.statusAffected === "def") {
                            if ( move.self ) {
                                if ( Math.abs(enemy.defStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole("Enemy defense rose!")
                                    else
                                        functions.updateConsole("Enemy defense fell!")
                                    enemy.defStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            } else {
                                if ( Math.abs(active.defStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole(active.name + "'s defense rose!")
                                    else
                                        functions.updateConsole(active.name + "'s defense fell!")
                                    active.defStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            }
                        }
                        if ( move.statusAffected === "satk") {

                        }
                        if ( move.statusAffected === "sdef") {

                        }
                        if ( move.statusAffected === "spe") {

                        }
                        if ( move.statusAffected === "accuracy") {
                            if ( move.self ) {
                                if ( Math.abs(enemy.accuracyStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole("Enemy accuracy rose!")
                                    else
                                        functions.updateConsole("Enemy accuracy fell!")
                                    enemy.accuracyStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            } else {
                                if ( Math.abs(active.accuracyStage) < 6) {
                                    if ( move.rise > 0)
                                        functions.updateConsole(active.name + "'s accuracy rose!")
                                    else
                                        functions.updateConsole(active.name + "'s accuracy fell!")
                                    active.accuracyStage += move.rise*move.amount
                                } else {
                                    functions.updateConsole("Nothing happens!")
                                }
                            }
                        }
                        if ( move.statusAffected === "evasion") {

                        }
                    } else { // Effect
                        chooseEffectOnActive(move)
                    }
                } else { // failed
                    functions.updateConsole("Wild " + enemy.name + "'s attack missed!")
                }
            } else { // No pp left
                functions.updateConsole("Wild " + enemy.name + " has no PP Left!")
                functions.updateConsole("Wild " + enemy.name + " uses Struggle")
                if ( criticalHit === 1.5)
                    functions.updateConsole("Critical Hit!")
                damage = Math.floor ( ( ( ( ( 2 * enemy.level + 10 ) / 250 ) * enemyAtk/activeDef * 50 + 2 ) ) * criticalHit )
                functions.updateConsole( active.name + " loses " + damage + " hp!")
                if ( active.life - damage > 0 ) {
                    active.life -= damage
                } else {
                    active.life = 0
                    functions.updateConsole(active.name + " fainted...")
                }
                functions.updateConsole("Wild " + enemy.name + " is hit by recoil!")
                if ( enemy.life - 1/4 * enemy.hp * criticalHit > 0 ) {
                    functions.updateConsole("Wild " + enemy.name + " loses " + damage + " hp!")
                    enemy.life -= 1/4 * enemy.hp * criticalHit
                } else {
                    if (active.life > 0) {
                        functions.kill()
                    } else {
                        enemy.life = 0
                        functions.updateConsole("Wild " + enemy.name + " fainted!")
                    }
                }
            }
        }

        switch (rand) {
        case 1:
            enemyMove1.pp = move.pp
            break
        case 2:
            enemyMove2.pp = move.pp
            break
        case 3:
            enemyMove3.pp = move.pp
            break
        case 4:
            enemyMove4.pp = move.pp
            break
        }
        if ( enemy.life > 0 && active.life > 0)
            moment = 2
        else
            moment = 0
    }

    function checkEffectiveness(moveType,type1,type2){
        var effectiveness = 1

        if ( moveType === "Normal" ) {
            if ( type1 === "Rock" || type1 === "Steel")
                effectiveness *= 0.5
            if ( type1 === "Ghost")
                effectiveness *= 0
            if ( type2 === "Rock" || type2 === "Steel")
                effectiveness *= 0.5
            if ( type2 === "Ghost")
                effectiveness *= 0
        }
        if ( moveType === "Fight" ) {
            if ( type1 === "Normal" || type1 === "Rock" || type1 === "Steel" || type1 === "Ice" || type1 === "Dark")
                effectiveness *= 2
            if ( type1 === "Flying" || type1 === "Poison" || type1 === "Bug" || type1 === "Psychic" || type1 === "Fairy")
                effectiveness *= 0.5
            if ( type1 === "Ghost" )
                effectiveness = 0
            if ( type2 === "Normal" || type2 === "Rock" || type2 === "Steel" || type2 === "Ice" || type2 === "Dark")
                effectiveness *= 2
            if ( type2 === "Flying" || type2 === "Poison" || type2 === "Bug" || type2 === "Psychic" || type2 === "Fairy")
                effectiveness *= 0.5
            if ( type2 === "Ghost" )
                effectiveness = 0
        }
        if ( moveType === "Flying" ) {
            if ( type1 === "Fight" || type1 === "Bug" || type1 === "Grass" )
                effectiveness *= 2
            if ( type1 === "Rock" || type1 === "Steel" || type1 === "Electric" )
                effectiveness *= 0.5
            if ( type2 === "Fight" || type2 === "Bug" || type2 === "Grass" )
                effectiveness *= 2
            if ( type2 === "Rock" || type2 === "Steel" || type2 === "Electric" )
                effectiveness *= 0.5
        }
        if ( moveType === "Poison" ) {
            if ( type1 === "Grass" || type1 === "Fairy" )
                effectiveness *= 2
            if ( type1 === "Poison" || type1 === "Ground" || type1 === "Rock" || type1 === "Ghost" )
                effectiveness *= 0.5
            if ( type1 === "Steel" )
                effectiveness = 0
            if ( type2 === "Grass" || type2 === "Fairy" )
                effectiveness *= 2
            if ( type2 === "Poison" || type2 === "Ground" || type2 === "Rock" || type2 === "Ghost" )
                effectiveness *= 0.5
            if ( type2 === "Steel" )
                effectiveness = 0
        }
        if ( moveType === "Ground" ) {
            if ( type1 === "Poison" || type1 === "Rock" || type1 === "Steel" || type1 === "Fire" || type1 === "Electric" )
                effectiveness *= 2
            if ( type1 === "Bug" || type1 === "Grass" )
                effectiveness *= 0.5
            if ( type1 === "Flying" )
                effectiveness = 0
            if ( type2 === "Poison" || type2 === "Rock" || type2 === "Steel" || type2 === "Fire" || type2 === "Electric" )
                effectiveness *= 2
            if ( type2 === "Bug" || type2 === "Grass" )
                effectiveness *= 0.5
            if ( type2 === "Flying" )
                effectiveness = 0
        }
        if ( moveType === "Rock" ) {
            if ( type1 === "Flying" || type1 === "Bug" || type1 === "Fire" || type1 === "Ice" )
                effectiveness *= 2
            if ( type1 === "Fight" || type1 === "Ground" || type1 === "Steel" )
                effectiveness *= 0.5
            if ( type2 === "Flying" || type2 === "Bug" || type2 === "Fire" || type2 === "Ice" )
                effectiveness *= 2
            if ( type2 === "Fight" || type2 === "Ground" || type2 === "Steel" )
                effectiveness *= 0.5
        }
        if ( moveType === "Bug" ) {
            if ( type1 === "Grass" || type1 === "Psychic" || type1 === "Dark" )
                effectiveness *= 2
            if ( type1 === "Fight" || type1 === "Flying" || type1 === "Poison" || type1 === "Ghost" || type1 === "Steel" || type1 === "Fire" || type1 === "Fairy" )
                effectiveness *= 0.5
            if ( type2 === "Grass" || type2 === "Psychic" || type2 === "Dark" )
                effectiveness *= 2
            if ( type2 === "Fight" || type2 === "Flying" || type2 === "Poison" || type2 === "Ghost" || type2 === "Steel" || type2 === "Fire" || type2 === "Fairy" )
                effectiveness *= 0.5
        }
        if ( moveType === "Ghost" ) {
            if ( type1 === "Ghost" || type1 === "Psychic" )
                effectiveness *= 2
            if ( type1 === "Dark" )
                effectiveness *= 0.5
            if ( type1 === "Normal" )
                effectiveness = 0
            if ( type2 === "Ghost" || type2 === "Psychic" )
                effectiveness *= 2
            if ( type2 === "Dark" )
                effectiveness *= 0.5
            if ( type2 === "Normal" )
                effectiveness = 0
        }
        if ( moveType === "Steel" ) {
            if ( type1 === "Rock" || type1 === "Ice" || type1 === "Fairy" )
                effectiveness *= 2
            if ( type1 === "Steel" || type1 === "Fire" || type1 === "Water" || type1 === "Electric" )
                effectiveness *= 0.5
            if ( type2 === "Rock" || type2 === "Ice" || type2 === "Fairy" )
                effectiveness *= 2
            if ( type2 === "Steel" || type2 === "Fire" || type2 === "Water" || type2 === "Electric" )
                effectiveness *= 0.5
        }
        if ( moveType === "Fire" ) {
            if ( type1 === "Bug" || type1 === "Steel" || type1 === "Grass" || type1 === "Ice" )
                effectiveness *= 2
            if ( type1 === "Rock" || type1 === "Fire" || type1 === "Water" || type1 === "Dragon" )
                effectiveness *= 0.5
            if ( type2 === "Bug" || type2 === "Steel" || type2 === "Grass" || type2 === "Ice" )
                effectiveness *= 2
            if ( type2 === "Rock" || type2 === "Fire" || type2 === "Water" || type2 === "Dragon" )
                effectiveness *= 0.5
        }
        if ( moveType === "Water" ) {
            if ( type1 === "Ground" || type1 === "Rock" || type1 === "Fire" )
                effectiveness *= 2
            if ( type1 === "Water" || type1 === "Grass" || type1 === "Dragon" )
                effectiveness *= 0.5
            if ( type2 === "Ground" || type2 === "Rock" || type2 === "Fire" )
                effectiveness *= 2
            if ( type2 === "Water" || type2 === "Grass" || type2 === "Dragon" )
                effectiveness *= 0.5
        }
        if ( moveType === "Grass" ) {
            if ( type1 === "Ground" || type1 === "Rock" || type1 === "Water" )
                effectiveness *= 2
            if ( type1 === "Flying" || type1 === "Poison" || type1 === "Bug" || type1 === "Steel" || type1 === "Fire" || type1 === "Grass" || type1 === "Dragon" )
                effectiveness *= 0.5
            if ( type2 === "Ground" || type2 === "Rock" || type2 === "Water" )
                effectiveness *= 2
            if ( type2 === "Flying" || type2 === "Poison" || type2 === "Bug" || type2 === "Steel" || type2 === "Fire" || type2 === "Grass" || type2 === "Dragon" )
                effectiveness *= 0.5
        }
        if ( moveType === "Electric" ) {
            if ( type1 === "Flying" || type1 === "Water" )
                effectiveness *= 2
            if ( type1 === "Grass" || type1 === "Electric" || type1 === "Dragon" )
                effectiveness *= 0.5
            if ( type1 === "Ground" )
                effectiveness = 0
        }
        if ( moveType === "Psychic" ) {
            if ( type1 === "Fight" || type1 === "Poison" )
                effectiveness *= 2
            if ( type1 === "Steel" || type1 === "Psychic" )
                effectiveness *= 0.5
            if ( type1 === "Dark" )
                effectiveness = 0
            if ( type2 === "Fight" || type2 === "Poison" )
                effectiveness *= 2
            if ( type2 === "Steel" || type2 === "Psychic" )
                effectiveness *= 0.5
            if ( type2 === "Dark" )
                effectiveness = 0
        }
        if ( moveType === "Ice" ) {
            if ( type1 === "Flying" || type1 === "Ground" || type1 === "Grass" || type1 === "Dragon" )
                effectiveness *= 2
            if ( type1 === "Steel" || type1 === "Fire" || type1 === "Water" || type1 === "Ice" )
                effectiveness *= 0.5
            if ( type2 === "Flying" || type2 === "Ground" || type2 === "Grass" || type2 === "Dragon" )
                effectiveness *= 2
            if ( type2 === "Steel" || type2 === "Fire" || type2 === "Water" || type2 === "Ice" )
                effectiveness *= 0.5
        }
        if ( moveType === "Dragon" ) {
            if ( type1 === "Dragon" )
                effectiveness *= 2
            if ( type1 === "Steel" )
                effectiveness *= 0.5
            if ( type1 === "Fairy" )
                effectiveness = 0
            if ( type2 === "Dragon" )
                effectiveness *= 2
            if ( type2 === "Steel" )
                effectiveness *= 0.5
            if ( type2 === "Fairy" )
                effectiveness = 0
        }
        if ( moveType === "Dark" ) {
            if ( type1 === "Ghost" || type1 === "Psychic" )
                effectiveness *= 2
            if ( type1 === "Fight" || type1 === "Dark" || type1 === "Fairy" )
                effectiveness *= 0.5
            if ( type2 === "Ghost" || type2 === "Psychic" )
                effectiveness *= 2
            if ( type2 === "Fight" || type2 === "Dark" || type2 === "Fairy" )
                effectiveness *= 0.5
        }
        if ( moveType === "Fairy") {
            if ( type1 === "Fight" || type1 === "Dragon" || type1 === "Dark" )
                effectiveness *=2
            if ( type1 === "Poison" || type1 === "Steel" || type1 === "Fire" )
                effectiveness *= 0.5
            if ( type2 === "Fight" || type2 === "Dragon" || type2 === "Dark" )
                effectiveness *=2
            if ( type2 === "Poison" || type2 === "Steel" || type2 === "Fire" )
                effectiveness *= 0.5
        }

        return effectiveness
    }

    function chooseEffectOnEnemy(move) {
        var exists = false
        for ( var i = 0; i < effectsOnEnemy.length ; i++)
            if ( effectsOnEnemy[i] === move.name)
                exists = true
        if ( !exists ) {
            effectsOnEnemy[effectsOnEnemy.length] = move.name
            if ( move.name === "Leech Seed" ) {
                functions.updateConsole("Wild " + enemy.name + " is full of seeds!")
                functions.updateConsole(active.name + " is draining energy from " + enemy.name + "!")
                console.log( active.life + ":" + enemy.life )
                var n = enemy.life < 16 ? 0 : 1
                if ( active.life < active.hp)
                    active.life += Math.floor(Math.pow(enemy.life * 1/8,n))
                enemy.life -= Math.floor(Math.pow(enemy.life * 1/8,n))
                console.log( active.life + ":" + enemy.life )
            }
        } else {
            functions.updateConsole("Nothing happens!")
        }

        console.log(effectsOnEnemy)
    }

    function checkEffectsOnEnemy() {
        var leechSeed = false
        for ( var i = 0; i < effectsOnEnemy.length ; i++) {
            if ( effectsOnEnemy[i] === "Leech Seed" ) {
                leechSeed = true
            }
        }
        if ( leechSeed ) {
            functions.updateConsole(active.name + " is draining energy from " + enemy.name + "!")
            console.log( active.life + ":" + enemy.life )
            var n = enemy.life < 16 ? 0 : 1
            if ( active.life < active.hp) {
                active.life += Math.floor(Math.pow(enemy.life * 1/8,n))
            }
            enemy.life -= Math.floor(Math.pow(enemy.life * 1/8,n))
        }
    }

    function chooseEffectOnActive(move) {
        var exists = false
        console.log(move.name + " : " + exists + " : " + effectsOnActive)

        for ( var i = 0; i < effectsOnActive.length ; i++)
            if ( effectsOnActive[i] === move.name)
                exists = true
        if ( !exists ) {
            effectsOnActive[effectsOnActive.length] = move.name
            if ( move.name === "Leech Seed" ) {
                functions.updateConsole(active.name + " is full of seeds!")
                functions.updateConsole("Wild " + enemy.name + " is draining energy from " + active.name + "!")
                console.log( enemy.life + ":" + active.life )
                var n = active.life < 16 ? 0 : 1
                if ( enemy.life < enemy.hp)
                    enemy.life += Math.floor(Math.pow(active.life * 1/8,n))
                active.life -= Math.floor(Math.pow(active.life * 1/8,n))
                console.log( enemy.life + ":" + active.life )
            }
        } else {
            functions.updateConsole("Nothing happens!")
        }
        console.log(exists + " : " + effectsOnActive)
    }

    function checkEffectsOnActive() {
        var leechSeed = false
        for ( var i = 0; i < effectsOnActive.length ; i++) {
            if ( effectsOnActive[i] === "Leech Seed" ) {
                leechSeed = true
            }
        }
        if ( leechSeed ) {
            functions.updateConsole("Wild " + enemy.name + " is draining energy from " + active.name + "!")
            console.log( enemy.life + ":" + active.life )
            var n = active.life < 16 ? 0 : 1
            if ( enemy.life < enemy.hp) {
                enemy.life += Math.floor(Math.pow(active.life * 1/8,n))
            }
            active.life -= Math.floor(Math.pow(active.life * 1/8,n))
        }
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
            onClicked: chooseTurn(1)
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
            top: parent.top
            topMargin: Theme.paddingLarge / 3
            right: parent.right
            rightMargin: Theme.paddingLarge / 3
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
            onClicked: chooseTurn(2)
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
            bottom: parent.bottom
            bottomMargin: Theme.paddingLarge / 3
            left: parent.left
            leftMargin: Theme.paddingLarge / 3
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
            onClicked: chooseTurn(3)
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
            onClicked: chooseTurn(4)
            onPressed: parent.color = Theme.secondaryHighlightColor
            onReleased: parent.color = "transparent"
            enabled: idle && !loading && !waiting && name4.text !== "Null"
        }
    }
}
