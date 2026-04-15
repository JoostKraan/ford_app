import QtQuick

Rectangle {
    id: bottomBar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "transparent"
    height: parent.height / 4
    border.color: "#aaaaaa"
    border.width: 2

    MediaControl{
        id: mediaControl

    }
}
