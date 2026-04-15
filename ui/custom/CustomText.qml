import QtQuick 2.15

Text {
    id: customText
    FontLoader {
        id: pixel
        source: "qrc:/fonts/assets/fonts/Akira Expanded Demo.otf"
    }

    font.family: pixel.name
    font.pointSize: 16
    color: "white"
}