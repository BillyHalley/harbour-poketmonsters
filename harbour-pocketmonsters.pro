# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-pocketmonsters

CONFIG += sailfishapp

SOURCES += src/harbour-pocketmonsters.cpp

OTHER_FILES += qml/harbour-pocketmonsters.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-pocketmonsters.spec \
    rpm/harbour-pocketmonsters.yaml \
    translations/*.ts \
    harbour-pocketmonsters.desktop \
    qml/pages/Monster.qml \
    pics/001.png \
    stats/000.xml \
    stats/001.xml \
    stats/003.xml \
    stats/002.xml \
    qml/pages/stats/002.xml \
    qml/pages/stats/000.xml \
    qml/pages/stats/stats.xml \
    qml/pages/xmls/pokedex.xml \
    qml/pages/xmls/movedex.xml \
    qml/pages/Board.qml \
    qml/pages/Moveset.qml \
    qml/pages/Functions.qml \
    qml/pages/Move.qml \
    qml/pages/Console.qml \
    qml/pages/pics/001.gif \
    rpm/harbour-pocketmonsters.changes


# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-pocketmonsters-de.ts

