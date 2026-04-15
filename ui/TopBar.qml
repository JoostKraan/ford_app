import QtQuick

Rectangle {
    id: topBar

    anchors {
        top: parent.top
    }

    width: parent.width
    height: parent.height / 14

    color: "transparent"
    border.color: "white"
    border.width: 3
    TopInfo{
    }
}