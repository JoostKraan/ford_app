import QtQuick 2.15
import "custom"

Item {
    anchors.fill: parent   // 👈 let parent control size

    Column {
        anchors.fill: parent
        anchors.margins: 10

        CustomText {
            text: "blablabla"
        }
    }
}