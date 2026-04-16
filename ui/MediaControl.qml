import QtQuick 2
import QtQuick.Controls
import "custom"
Item {
    anchors.fill: parent
    Image { source: "qrc:/icons/assets/icons/Bluetooth-On.png"
        width: 45
           height: 45

        anchors{
            right: parent.right
            top: parent.top
            margins: 10
        }

    }
    Column {
        anchors.centerIn: parent
         width: parent.width * 0.8
        spacing: 5

        CustomText {
            text: "Title"
            font.pointSize: 20
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            width: parent.width

        }

        CustomText {
            text: "Artist"
            font.pointSize: 20
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Row {
            spacing:25
            anchors.horizontalCenter: parent.horizontalCenter

            Image { source: "qrc:/icons/assets/icons/Previous.png" }
            Image { source: "qrc:/icons/assets/icons/Play.png" }
            Image { source: "qrc:/icons/assets/icons/Skip.png" }
            Image { source: "qrc:/icons/assets/icons/Shuffle.png" }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            spacing: 6

            ProgressBar {
                id: control
                value: 0.5
                width: parent.width
                   height: 8

                background: Rectangle {
                    anchors.fill: parent
                    color: "black"
                }

                contentItem: Rectangle {
                    width: parent.width * control.visualPosition
                    height: parent.height
                    color: "white"
                }
            }

            CustomText {
                text: "2:23/3:00"
                font.pointSize: 18
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                bottomPadding: 10
            }
        }
    }
}
