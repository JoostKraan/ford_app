import QtQuick
import ford_app

Text {
    id: customText
    FontLoader {
        id: pixel
        source: "qrc:/fonts/assets/fonts/Doto-VariableFont_ROND,wght.ttf"
    }

    font.family: pixel.name
    font.pointSize: 16
     color: ColorScheme.textPrimary
     font.bold: true


}