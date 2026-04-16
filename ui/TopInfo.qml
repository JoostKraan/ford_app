import QtQuick
import "custom"
import QtQuick.Controls

Item {
    anchors.fill: parent

    Row {
        id: leftItems
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        leftPadding: 10
        spacing: 10

        Image {
            source: "qrc:/icons/assets/icons/Gas.png"
            width: 43
            height: 43
        }
        CustomText {
            anchors.verticalCenter: parent.verticalCenter
            text: "47L"
            font.pointSize: 22
        }
        Image {
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/assets/icons/Car-Battery.png"
            width: 32
            height: 32
        }
        CustomText {
            anchors.verticalCenter: parent.verticalCenter
            text: "12.2V"
            font.pointSize: 22
        }
    }

    CustomText {
        anchors.centerIn: parent
        text: "22:32"
        font.pointSize: 24
        color: "white"
    }
    Row{
        spacing: 15
        rightPadding: 15
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        Image {
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/assets/icons/Wifi-Off.png"
            width: 32
            height: 32

        }
        Image {
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/assets/icons/Sat-On.png"
            width: 32
            height: 32
        }
        Image {
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/assets/icons/Bluetooth-On.png"
            width: 32
            height: 32
        }
        Image {
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/assets/icons/Settings.png"
            width: 32
            height: 32
        }
    }
}