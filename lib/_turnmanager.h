#ifndef TURNMANAGER_H
#define TURNMANAGER_H

#include <QObject>
#include <QVector>
#include <QXmlStreamReader>

class TurnManager : public QObject
{
    Q_OBJECT
public:
    explicit TurnManager(QObject *parent = 0);

    QVector<Move*> array;

    Q_INVOKABLE QVector<Move*> sort(const QVector<Move*> &array);

signals:

    void sortDone();

public slots:

};

#endif // TURNMANAGER_H
