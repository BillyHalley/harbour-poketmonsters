/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.pocketmonsters.Manager 1.0

Page {
    id: page

    property bool game: false
    property bool debug: false

    property bool idle: false // waiting for console click
    property bool loading: false // console is displaying text
    property bool waiting: false // waiting for move

    property int moment: 0 // 0: To choice , 1: To first turn, 2: To second turn
    onMomentChanged: console.log(moment)
    property int turn: 0
    property int moveIndex
    property int moveRand

    Manager { id: manager }

    property variant fetch
    property variant load
    property variant moves
    property variant enemyString

    function loadStarterEnemy(enemyString) {
        fetch = manager.fetchMonster(enemyString[0],enemyString[2])
        enemy.fetch(fetch)
        moves = manager.assignMoves(enemy.movesString)
        moveset.loadEnemyMoves(moves)
        functions.updateConsole("A Wild " + enemy.name + " appeared!")
        moment = 0
    }

    function loadEnemy() {
        var randId = Math.floor ( Math.random() * 3 + 1 )
        var randLevel = Math.floor( Math.random() * 7 ) + ( active.level - 3 )
        fetch = manager.fetchMonster(randId,randLevel)
        enemy.fetch(fetch)
        enemy.life = enemy.hp
        moves = manager.assignMoves(enemy.movesString)
        moveset.loadEnemyMoves(moves)
        active.atkStage = 0
        active.defStage = 0
        active.satkStage = 0
        active.sdefStage = 0
        active.speStage = 0
        active.accuracyStage = 0
        active.evasionStage = 0
        enemy.atkStage = 0
        enemy.defStage = 0
        enemy.satkStage = 0
        enemy.sdefStage = 0
        enemy.speStage = 0
        enemy.accuracyStage = 0
        enemy.evasionStage = 0
        moveset.effectsOnActive = []
        moveset.effectsOnEnemy = []
        functions.updateConsole("A Wild " + enemy.name + " appeared!")
        moment = 0
    }

    onStatusChanged: {
        if ( status === PageStatus.Active ) {
            load = manager.loadActive()
            fetch = manager.fetchMonster(load[0],load[4])
            active.fetch(fetch)
            active.load(load)
            moves = manager.assignMoves(active.movesString)
            console.log(active.movesId)
            console.log(moves)
            active.loadMoves(moves,active.movesString)
            moveset.loadMoves(moves,active.movesString)
            if ( enemyString === undefined ) {
                moment = 1
                functions.updateConsole("What do you want to do?\nChoose in the pulley menu!")
            } else
                loadStarterEnemy(enemyString)
        }
    }


    Functions {
        id: functions
    }

    function heal() {
        moveset.heal()
        active.heal()
        moment = 1
        functions.updateConsole(active.name + " has been healed!")
    }


    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Save")
                onClicked: {
                    console.log("Save Monster Clicked")
                    var list = moveset.returnPp()
                    active.string[14] = list[0]
                    active.string[16] = list[1]
                    active.string[18] = list[2]
                    active.string[20] = list[3]
                    manager.saveActive(active.string)
                }
                enabled: active.life > 0
            }
            MenuItem {
                text: qsTr("Search Monster")
                onClicked: {
                    console.log("Search Monster Clicked")
                    loadEnemy()
                }
                enabled: active.life > 0
            }
            MenuItem {
                text: qsTr("Heal")
                onClicked: {
                    console.log("Heal Clicked")
                    heal()
                }
            }
            enabled: !idle && !waiting && !loading
        }

        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("PocketMonsters")
            }

        }
        Board {
            x: Theme.paddingLarge
            anchors.top: column.bottom

            Monster {
                id: active
            }
            Monster {
                id: enemy
                anchors.left: active.right
                anchors.leftMargin: Theme.paddingLarge
            }
            Moveset {
                id: moveset
                anchors {
                    top: active.bottom
                    topMargin: Theme.paddingLarge
                    left: active.left
                }
            }
            Console {
                id: gameConsole
                anchors {
                    top: moveset.bottom
                    topMargin: Theme.paddingLarge
                    left: active.left
                }
            }
        }
    }
}
