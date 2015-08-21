#ifndef MANAGER_H
#define MANAGER_H

#include <QObject>
#include <QTextStream>
#include <QFile>
#include <QDir>
#include <QVector>
#include <QQmlProperty>
#include <QQuickView>
#include <QQuickItem>
#include <QStringList>
#include <QXmlStreamReader>
#include <sailfishapp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

class Manager : public QObject
{
    Q_OBJECT


public:
    explicit Manager(QObject *parent = 0);
/*
    int activeId;
    QString activeString;

    int enemyId;
    QString enemyString;
*/


    Q_INVOKABLE void saveActive(const QStringList &list);
    Q_INVOKABLE QStringList loadActive();
    Q_INVOKABLE QStringList fetchMonster(const int &id, const int &level);
    Q_INVOKABLE QStringList assignMoves(const QStringList &stringList);
    Q_INVOKABLE QStringList newMove(const QString &indexString, const int &level);
    Q_INVOKABLE bool checkSaved();


signals:

    void toConsole(const QString &string);
    void fetchMonsterDone();
    void saveActiveDone();
    void loadActiveDone();


public slots:



};


#endif // MANAGER_H
