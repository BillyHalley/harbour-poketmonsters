Move::Move(QObject *parent) :
    QObject(parent)
{
    id  = 0;
    name  = "0";
    type  = "0";
    category  = "0";
    power  = 0;
    accuracy  = 0;
    pp  = 0;
    ppTot  = 0;
    statusAffected  = "0";
    rise  = true;
    amount  = 0;
    description  = "0";
}

QString Move::define( Monster &attack, Monster &defense ){

    srand(time(NULL));
    double random = rand();
    bool fail;
    if ( random < accuracy / 100 )
        fail = true;
    else
        fail = false;

    if ( pp > 0 ) {
        if (!fail) {
            pp -= 1;
            if ( category == "Physical" )
                return physical(attack,defense);
            else if ( category == "Special" )
                return special(attack,defense);
            else if ( category == "Status" )
                return status(attack,defense);
            else if ( category == "Effect" )
                return effect(attack,defense);
        } else
            return "Failed";
    } else
        return struggle(attack,defense);

    // Do something

}

QString Move::physical(Monster &attack, Monster &defense) {

    QString console;

    srand(time(NULL));
    double random = rand();
    double criticalHit;
    if ( random < 1/16 )
        criticalHit = 1.5;
    else
        criticalHit = 1;

    QString name = attack.m_name;

    console.append( attack.m_name + "Uses " + name );

    if ( criticalHit == 1.5)
        console.append("\nCritical Hit!");

    int damage = (int) ( ( ( 2 * attack.m_level + 10 ) / 250 ) * attack.atk/defense.def * power + 2 ) * criticalHit;

    if ( defense.life - damage > 0 ) {
        defense.life -= damage;
        console.append("\nWild " + defense.m_name + " loses " + damage + " hp!");
    } else {
        defense.life = 0;
        console.append("\nWild " + defense.m_name + " fainted!");
    }

    // Do something

    return console;
}

QString Move::special(Monster &attack, Monster &defense) {

    QString console;

    // Do something

    return console;
}

QString Move::status(Monster &attack, Monster &defense) {

    QString console;

    // Do something

    return console;
}

QString Move::effect(Monster &attack, Monster &defense) {

    QString console;

    // Do something

    return console;
}

QString Move::struggle(Monster &attack, Monster &defense) {

    QString console;

    // Do something

    return console;
}
