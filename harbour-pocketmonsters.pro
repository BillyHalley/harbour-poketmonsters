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

SOURCES += src/harbour-pocketmonsters.cpp \
    lib/manager.cpp

OTHER_FILES += qml/harbour-pocketmonsters.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-pocketmonsters.spec \
    rpm/harbour-pocketmonsters.yaml \
    translations/*.ts \
    harbour-pocketmonsters.desktop \
    qml/pages/xmls/movedex.xml \
    qml/pages/xmls/pokedex.xml \
    qml/pages/Board.qml \
    qml/pages/Moveset.qml \
    qml/pages/Functions.qml \
    qml/pages/Console.qml \
    rpm/harbour-pocketmonsters.changes \
    qml/pages/xmls/001.xml \
    qml/pages/xmls/002.xml \
    qml/pages/xmls/003.xml \
    qml/pages/xmls/active.xml \
    qml/pages/pics/002.gif \
    qml/pages/pics/003.gif \
    qml/pages/pics/717.gif \
    qml/pages/pics/001.gif \
    qml/pages/ProfOak.qml \
    qml/pages/Monster.qml \
    qml/pages/Move.qml


# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-pocketmonsters-de.ts

HEADERS += \
    lib/manager.h

