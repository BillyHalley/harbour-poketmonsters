#ifndef MONSTER_H
#define MONSTER_H

#include <QObject>
#include <QString>
#include <math.h>
#include <QStringList>

class Monster : public QObject
{
    Q_OBJECT

public:

    explicit Monster(QObject *parent = 0);
    Monster ( const Monster &monster);
    Monster& operator= (const Monster &monster);

    int id;
    QString m_idString;
    QString m_name;
    int m_level;
    int exp;
    int levelUpExp;
    int m_percentExp;
    int life;
    int m_percentHp;

    Q_PROPERTY (QString name READ name)
    Q_PROPERTY (QString idString READ idString)
    Q_PROPERTY (int level READ level)
    Q_PROPERTY (int percentExp READ percentExp)
    Q_PROPERTY (int percentHp READ percentHp)

    QString name() const {
        return m_name;
    }
    QString idString() const {
        return m_idString;
    }
    int level() const {
        return m_level;
    }
    int percentExp() const {
        return m_percentExp;
    }
    int percentHp() const {
        return m_percentHp;
    }


    QString type1;
    QString type2;

    int ivs;
    int nature;

    int baseHpEv;
    int baseAtkEv;
    int baseDefEv;
    int baseSatkEv;
    int baseSdefEv;
    int baseSpeEv;
    double speciesExp;
    double wild;
    double trainer;
    double luckyEgg;

    int baseHp;
    int baseAtk;
    int baseDef;
    int baseSatk;
    int baseSdef;
    int baseSpe;

    int hpEv;
    int atkEv;
    int defEv;
    int satkEv;
    int sdefEv;
    int speEv;

    int hp;
    int atk;
    int def;
    int satk;
    int sdef;
    int spe;

    Move move1;
    Move move2;
    Move move3;
    Move move4;

    Q_INVOKABLE void levelUp();
    Q_INVOKABLE void killedEnemy(const Monster *enemy);
    Q_INVOKABLE QStringList getMove(Move &move);



signals:

public slots:

};

#endif // MONSTER_H
