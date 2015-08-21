#include "manager.h"

Manager::Manager(QObject *parent) :
    QObject(parent)
{
}


void Manager::saveActive( const QStringList &list) {

    QTextStream cout(stdout); // set cout for console debug

    QDir dir("/home/nemo/.local/share/harbour-pocketmonsters");
    if (!dir.exists())
        dir.mkpath(".");

    cout << QDir::setCurrent("/home/nemo/.local/share/harbour-pocketmonsters") << endl;

    QFile file("active.xml");

    if ( file.exists()) {
        file.remove();
        QFile file("active.xml");
    }

    cout << file.open(QIODevice::ReadWrite) << endl;

    QXmlStreamWriter xml( &file );

    xml.setAutoFormatting(true);
    xml.writeStartDocument();

    xml.writeStartElement("index");

    xml.writeAttribute("id", list[0] );
    xml.writeTextElement("name", list[1] ) ;
    xml.writeTextElement("type1", list[2] ) ;
    xml.writeTextElement("type2", list[3] ) ;
    xml.writeTextElement("level",list[4] ) ;
    xml.writeTextElement("exp", list[5] ) ;
    xml.writeTextElement("life", list[6] ) ;
    xml.writeTextElement("hpev", list[7] ) ;
    xml.writeTextElement("atkev",list[8] ) ;
    xml.writeTextElement("defev", list[9] ) ;
    xml.writeTextElement("satkev", list[10] ) ;
    xml.writeTextElement("sdefev", list[11] ) ;
    xml.writeTextElement("speev", list[12] ) ;

    xml.writeStartElement("moveset") ;

    xml.writeEmptyElement("move") ;
    xml.writeAttribute("id", list[13] ) ;
    xml.writeAttribute("pp", list[14] ) ;
    xml.writeEmptyElement("move") ;
    xml.writeAttribute("id", list[15] ) ;
    xml.writeAttribute("pp", list[16] ) ;
    xml.writeEmptyElement("move") ;
    xml.writeAttribute("id", list[17] ) ;
    xml.writeAttribute("pp", list[18] ) ;
    xml.writeEmptyElement("move") ;
    xml.writeAttribute("id", list[19] ) ;
    xml.writeAttribute("pp", list[20] ) ;

    xml.writeEndElement() ; // moveset

    xml.writeEndElement(); // index

    xml.writeEndDocument();

    saveActiveDone();

    // Do Something
}

QStringList Manager::loadActive() {

    QTextStream cout(stdout); // set cout for console debug

    cout << QDir::setCurrent("/home/nemo/.local/share/harbour-pocketmonsters/") << endl;
    QFile activeXml( "active.xml");

    cout << activeXml.open(QIODevice::ReadOnly) << endl;

    QXmlStreamReader xml(&activeXml);
    QStringList array;

    while (!xml.atEnd() && !xml.hasError()) {
        xml.readNext();
        if ( xml.isStartElement() && xml.name().toString() == "index") {
            QString string = xml.attributes().value("id").toString();
            array.append(string);
        } else if ( xml.isStartElement() && xml.name().toString() != "moveset" && xml.name().toString() != "move" ) {
            QString string = xml.readElementText();
            array.append(string);
        } else if ( xml.isStartElement() && xml.name().toString() == "move") {
            QString string = xml.attributes().value("id").toString();
            array.append(string);
            string = xml.attributes().value("pp").toString();
            array.append(string);
        }
    }

    if (xml.hasError())
    {
        cout << "XML error: " << xml.errorString() << "line:column - " << xml.lineNumber() << ":" << xml.columnNumber() << endl;
    }
    else if (xml.atEnd())
    {
        cout << "Reached end, done" << endl;
    }

    cout << "Load : ";

    for ( int i = 0; i < array.length(); i++) {
        cout << array[i] << ";";
    }

    cout << endl;

    loadActiveDone();
    return array;
}

QStringList Manager::fetchMonster(const int &id, const int &level) {

    QTextStream cout(stdout); // set cout for console debug

    QStringList array;

    QString idString;
    if ( id < 10 )
        idString = "00" + QString::number(id);
    else if ( id < 100)
        idString = "0" + QString::number(id);
    else
        idString =  QString::number(id);

    array.append(QString::number(id));
    array.append(idString);
    array.append(QString::number(level));

    cout << QDir::setCurrent("/usr/share/harbour-pocketmonsters/qml/pages/xmls/") << endl;
    QFile pokedex( idString + ".xml");

    cout << pokedex.open(QIODevice::ReadOnly) << endl;

    QXmlStreamReader xml(&pokedex);


    while (!xml.atEnd() && !xml.hasError()) {

        xml.readNext();

        if ( xml.isStartElement() && xml.name().toString() == "index" && xml.attributes().value("id").toString() == idString) {
            xml.readNext();
        } else if ( ( xml.name().toString() == "moveset" ) ) {
            break;
        }
        if ( xml.isStartElement() ) {
            QString string = xml.readElementText();
            array.append(string);
        }


    }

    if (xml.hasError())
    {
        cout << "XML error: " << xml.errorString() << "line:column - " << xml.lineNumber() << ":" << xml.columnNumber() << endl;
    }
    else if (xml.atEnd())
    {
        cout << "Reached end, done" << endl;
    }

    QVector <int> levelsArray;
    QVector <int> idsArray;

    while (!xml.atEnd() && !xml.hasError()) {
        xml.readNext();
        QXmlStreamAttributes attributes = xml.attributes();
        if ( xml.isStartElement() && xml.name().toString() == "move") {
            levelsArray.append(attributes.value("level").toInt());
            idsArray.append(attributes.value("id").toInt());
        }
    }

    if (xml.hasError())
    {
        cout << "XML error: " << xml.errorString() << "line:column - " << xml.lineNumber() << ":" << xml.columnNumber() << endl;
    }
    else if (xml.atEnd())
    {
        cout << "Reached end, done" << endl;
    }

    if ( levelsArray.length() < 5 ) {
        if ( level >= levelsArray[0])
            array.append(QString::number(idsArray[0]));
        if ( level >= levelsArray[1])
            array.append(QString::number(idsArray[1]));
        if ( level >= levelsArray[2])
            array.append(QString::number(idsArray[2]));
        if ( level >= levelsArray[3])
            array.append(QString::number(idsArray[3]));
    }
    while ( array.length() < 23 )
        array.append(QString::number(0));

    for ( int i = 0; i < array.length(); i++) {
        cout << array[i] << ";";
    }

    cout << endl;

    fetchMonsterDone();
    return array;
}

QStringList Manager::assignMoves(const QStringList &stringList) {

    QTextStream cout(stdout); // set cout for console debug

    cout << QDir::setCurrent("/usr/share/harbour-pocketmonsters/qml/pages/xmls/") << endl;

    QFile movedex( "movedex.xml");

    QStringList array;
    QStringList list = stringList;

    for ( int i = 0; i < 4; i++) {
        if (movedex.isOpen()) {
            movedex.close();
            movedex.open(QIODevice::ReadOnly);
        } else
            movedex.open(QIODevice::ReadOnly);
        QXmlStreamReader xml(&movedex);
        QString id = list[i];
        array.append(id);
        bool found = false;
        while (!xml.atEnd() && !xml.hasError()) {
            xml.readNext();
            QXmlStreamAttributes attributes = xml.attributes();
            QString name = xml.name().toString();
            if ( !found && xml.isStartElement() && name == "index" && attributes.value("id") == id)
                found = true;
            if ( found && xml.isEndElement() && name == "index")
                found = false;
            if ( found && xml.isStartElement() && name != "index")
                array.append(xml.readElementText());
        }

        if (xml.hasError()) {
            cout << "XML error: " << xml.errorString() << " - line:column - " << xml.lineNumber() << ":" << xml.columnNumber() << endl;
        } else if (xml.atEnd()) {
            cout << "Reached end, done" << endl;
        }
    }

    for ( int i = 1; i < 5; i++) {
        cout << array[9*i-1] << endl;
        cout << stringList[3+i] << endl;
    }

    for ( int i = 0; i < array.length(); i++)
        cout << array[i] << ":";

    cout << endl;
    return array;
}

QStringList Manager::newMove(const QString &indexString, const int &level) {
    QTextStream cout(stdout); // set cout for console debug

    QStringList array;

    cout << QDir::setCurrent("/usr/share/harbour-pocketmonsters/qml/pages/xmls/") << endl;
    QFile pokedex( indexString + ".xml");

    cout << pokedex.open(QIODevice::ReadOnly) << endl;

    QXmlStreamReader xml(&pokedex);

    QString newMoveId;

    while (!xml.atEnd() && !xml.hasError()) {

        xml.readNext();

        if ( xml.isStartElement() && xml.name().toString() == "move" &&
             xml.attributes().value("level").toString() == QString::number(level) ) {
            cout << "found :" << xml.attributes().value("id").toString() << endl;
            newMoveId = xml.attributes().value("id").toString();
        }

    }

    if (xml.hasError())
    {
        cout << "XML error: " << xml.errorString() << "line:column - " << xml.lineNumber() << ":" << xml.columnNumber() << endl;
    }
    else if (xml.atEnd())
    {
        cout << "Reached end, done" << endl;
    }

    cout << QDir::setCurrent("/usr/share/harbour-pocketmonsters/qml/pages/xmls/") << endl;

    QFile movedex( "movedex.xml");

    cout << movedex.open(QIODevice::ReadOnly) << endl;

    QXmlStreamReader xml2(&movedex);

    bool found = false;
    while (!xml2.atEnd() && !xml2.hasError()) {
        xml2.readNext();
        QXmlStreamAttributes attributes = xml2.attributes();
        QString name = xml2.name().toString();
        if ( !found && xml2.isStartElement() && name == "index" && attributes.value("id").toString() == newMoveId ) {
            array.append(attributes.value("id").toString());
            found = true;
        }
        if ( found && xml2.isEndElement() && name == "index")
            found = false;
        if ( found && xml2.isStartElement() && name != "index")
            array.append(xml2.readElementText());
    }

    if (xml2.hasError()) {
        cout << "XML error: " << xml2.errorString() << " - line:column - " << xml2.lineNumber() << ":" << xml2.columnNumber() << endl;
    } else if (xml2.atEnd()) {
        cout << "Reached end, done" << endl;
    }

    for ( int i = 0; i < array.length(); i++)
        cout << array[i] << ":";

    cout << endl;

    return array;

}

bool Manager::checkSaved() {

    QTextStream cout(stdout); // set cout for console debug

    QDir dir("/home/nemo/.local/share/harbour-pocketmonsters");
    if (!dir.exists())
        dir.mkpath(".");

    cout << QDir::setCurrent("/home/nemo/.local/share/harbour-pocketmonsters") << endl;

    QFile file("active.xml");

    if ( file.exists()) {
        return true;
    } else {
        return false;
    }
}
