import QtQuick
import QtQuick.Controls
import "custom"

Item {
    anchors.fill: parent
    Image {
        source: "qrc:/icons/assets/icons/Bluetooth-On.png"
        width: 28
        height: 28
        anchors {
            right: parent.right
            top: parent.top
            margins: 10
        }
    }
    Column {
        anchors {
            top: parent.top
            left: parent.left
            margins: 12
        }
        spacing: 2
        CustomText {
            text: "Title"
            font.pointSize: 16
            font.bold: true
            color: "white"
        }
        CustomText {
            text: "Artist"
            font.pointSize: 12
            color: "#99ffffff"
        }
    }
    Column {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
            leftMargin: 12
            rightMargin: 12
        }
        spacing: 4

        ProgressBar {
            id: control
            value: 0.5
            width: parent.width
            height: 4

            background: Rectangle {
                anchors.fill: parent
                color: "#33ffffff"
            }
            contentItem: Rectangle {
                width: parent.width * control.visualPosition
                height: parent.height
                color: "white"
            }
        }

        Item {
            width: parent.width
            height: 16
            CustomText {
                text: "2:23"
                font.pointSize: 10
                color: "#99ffffff"
                anchors.left: parent.left
            }
            CustomText {
                text: "3:00"
                font.pointSize: 10
                color: "#99ffffff"
                anchors.right: parent.right
            }
        }
    }

    Row {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 12
        }
        spacing: 24

        Image {
            source: "qrc:/icons/assets/icons/Shuffle.png"
            width: 32
            height: 32
            anchors.verticalCenter: parent.verticalCenter
            opacity: 0.6
        }
        Image {
            source: "qrc:/icons/assets/icons/Previous.png"
            width: 36
            height: 36
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            width: 48
            height: 48
            radius: 4
            color: "transparent"
            border.color: "#33ffffff"
            border.width: 1
            anchors.verticalCenter: parent.verticalCenter
            Image {
                source: "qrc:/icons/assets/icons/Play.png"
                width: 30
                height: 30
                anchors.centerIn: parent
            }
        }

        Image {
            source: "qrc:/icons/assets/icons/Skip.png"
            width: 36
            height: 36
            anchors.verticalCenter: parent.verticalCenter
        }
        Item { width: 32; height: 32 }
    }
}