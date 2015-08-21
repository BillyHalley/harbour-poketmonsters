#ifndef MOVE_H
#define MOVE_H

#include <QObject>
#include <QString>

class Monster;

class Move : public QObject
{
    Q_OBJECT
public:
    explicit Move(QObject *parent = 0);

    int id;
    QString name;
    QString type;
    QString category;
    int power;
    int accuracy;
    int pp;
    int ppTot;
    QString statusAffected;
    bool rise;
    int amount;
    QString description;

    Q_INVOKABLE QString define(Monster &attack, Monster &defense );
    Q_INVOKABLE QString physical(Monster &attack, Monster &defense );
    Q_INVOKABLE QString special( Monster &attack, Monster &defense );
    Q_INVOKABLE QString status( Monster &attack, Monster &defense );
    Q_INVOKABLE QString effect( Monster &attack, Monster &defense );
    Q_INVOKABLE QString struggle( Monster &attack, Monster &defense );

signals:

    void moveDone();
    void toConsole(QString &string);

public slots:

};

#endif // MOVE_H
