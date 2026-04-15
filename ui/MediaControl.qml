import QtQuick 2
import "custom"
Row{
    Column{
        CustomText {
            text: "Lock"
            font.pointSize: 24
            color: "white"
        }
        Image{
            source: "qrc:/icons/assets/icons/Lock.png"
        }
    }
}
