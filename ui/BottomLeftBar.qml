import QtQuick


    Rectangle {
        id: bottomLeftBar
        anchors {
            left: parent.left
            bottom: parent.bottom
        }

        width: parent.width / 3
        height: parent.height / 4

        color: "transparent"
        border.color: "white"
        border.width: 3

        MediaControl {
            id: mediaControl
        }
    }


