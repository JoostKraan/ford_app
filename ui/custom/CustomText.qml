import QtQuick 2.15

Text {
    id: customText
    FontLoader {
        id: pixel
        source: "qrc:/fonts/assets/fonts/Doto-VariableFont_ROND,wght.ttf"
    }

    font.family: pixel.name
    font.pointSize: 16
     color: "#ffffff"
     font.bold: true


}