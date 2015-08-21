#include "monster.h"

Monster::Monster(QObject *parent) :
    QObject(parent)
{
    if ( id < 10 )
        idString = "00" + QString::number(id);
    else if ( id < 100)
        idString = "0" + QString::number(id);
    else
        idString =  QString::number(id);

    life = hp;
    percentHp = (int) life * 100 / hp;

    hp = (int) ( ( ivs + ( 2 * baseHp ) + ( hpEv / 4 ) + 100 ) * level / 100 ) + 10 ;
    atk = (int) ( ( ( ivs + ( 2 * baseAtk ) + ( atkEv / 4 ) ) * level / 100 ) + 5 ) * nature ;
    def = (int) ( ( ( ivs + ( 2 * baseDef ) + ( defEv / 4 ) ) * level / 100 ) + 5 ) * nature ;
    satk = (int) ( ( ( ivs + ( 2 * baseSatk ) + ( satkEv / 4 ) ) * level / 100 ) + 5 ) * nature ;
    sdef = (int) ( ( ( ivs + ( 2 * baseSdef ) + ( sdefEv / 4 ) ) * level / 100 ) + 5 ) * nature ;
    spe = (int) ( ( ( ivs + ( 2 * baseSpe ) + ( speEv / 4 ) ) * level / 100 ) + 5 ) * nature ;


    levelUpExp: (int) pow(level+1,3) - pow(level,3) ;
    percentExp: (int) ( exp - pow(level,3) ) * 100 / levelUpExp ;

}


void Monster::levelUp() {

    level += 1;

    hp = (int) ( ( ivs + ( 2 * baseHp ) + ( hpEv / 4 ) + 100 ) * level / 100 ) + 10 ;
    atk = (int) ( ( ( ivs + ( 2 * baseAtk ) + ( atkEv / 4 ) ) * level / 100 ) + 5 ) * nature ;
    def = (int) ( ( ( ivs + ( 2 * baseDef ) + ( defEv / 4 ) ) * level / 100 ) + 5 ) * nature ;
    satk = (int) ( ( ( ivs + ( 2 * baseSatk ) + ( satkEv / 4 ) ) * level / 100 ) + 5 ) * nature ;
    sdef = (int) ( ( ( ivs + ( 2 * baseSdef ) + ( sdefEv / 4 ) ) * level / 100 ) + 5 ) * nature ;
    spe = (int) ( ( ( ivs + ( 2 * baseSpe ) + ( speEv / 4 ) ) * level / 100 ) + 5 ) * nature ;

    life = hp;
    percentHp = (int) life * 100 / hp;

    levelUpExp: (int) pow(level+1,3) - pow(level,3) ;
    percentExp: (int) ( exp - pow(level,3) ) * 100 / levelUpExp ;
    // Do Something

}


void Monster::killedEnemy(const Monster *enemy) {

    hpEv = enemy->baseHpEv;
    atkEv = enemy->baseAtkEv;
    defEv = enemy->baseDefEv;
    satkEv = enemy->baseSatkEv;
    sdefEv = enemy->baseSdefEv;
    speEv = enemy->baseSpeEv;
    int expShare = 1;
    int expPointPower = 1;
    int gainedExp = ( ( enemy->wild * enemy->speciesExp * enemy->level ) / ( expShare * 5 ) * pow(2 * enemy->level + 10,2.5) / pow(enemy->level + level + 10, 2.5) + 1 ) * trainer * enemy->luckyEgg * expPointPower;
    if ( gainedExp + exp < pow(level+1,3)) {
        exp += gainedExp;
    } else {
        exp += gainedExp;
        levelUp();
    }

}
