import QtQuick

Rectangle {
    id: bottomRightBar

    anchors {
        right: parent.right
        bottom: parent.bottom
    }

    width: parent.width / 2
    height: parent.height / 4

    color: "transparent"
    border.color: "white"
    border.width: 3

    CarInfo {
        anchors.fill: parent
    }
}