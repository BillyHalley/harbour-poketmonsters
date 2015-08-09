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


Page {
    id: page

    property bool game: false
    property bool debug: false
    property bool idle: false
    property bool loading: false
    property bool waiting: false

    Functions {
        id: functions
    }

    Move { id: move1 } Move { id: move2 } Move { id: move3 } Move { id: move4 }
    Move { id: enemyMove1 } Move { id: enemyMove2 } Move { id: enemyMove3 } Move { id: enemyMove4 }

    Move { id: activeMove } Move { id: enemyMove }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Heal")
                onClicked: {
                    idle = true
                    functions.heal()
                    functions.generateEnemy(enemy)
                }
                visible: game
            }
            MenuItem {
                text: qsTr("Find monster")
                onClicked: {
                    idle = true
                    functions.generateEnemy(enemy)
                }
                visible: game
            }
            MenuItem {
                text: qsTr("Start game")
                onClicked: {
                    functions.generateActive(active)
                    functions.generateEnemy(enemy)
                    game = true
                }
                visible: !game
            }
            enabled: !idle && !loading && !waiting
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
                indexInt: Math.random()*3 + 1
                level: 80
                MouseArea {
                    anchors.fill: parent
                    onClicked: functions.generateActive(active)
                    enabled: idle && !loading && !waiting && debug
                }
            }
            Monster {
                id: enemy
                anchors {
                    left: active.right
                    leftMargin: Theme.paddingLarge
                    top: active.top
                }
                indexInt: Math.random()*3 + 1
                level: 80
                MouseArea {
                    anchors.fill: parent
                    onClicked: functions.generateEnemy(enemy)
                    enabled: idle && !loading && !waiting && debug
                }
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
