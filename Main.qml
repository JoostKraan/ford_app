// main.qml
import QtQuick
import "ui"

Window {
    id: root
    width: 1280
    height: 800
    visible: true
    title: qsTr("Ghia")

    Item {
        id: sceneContent
        width: root.width
        height: root.height
        visible: false

        Rectangle {
            anchors.fill: parent
            color: "#222222"
        }

        TopBar {
            id: topBar
        }

        BottomLeftBar {
            id: bottomLeftBar
            x: 0
            y: parent.height - height
            width: parent.width * 0.33
            height: parent.height / 4
        }

        BottomRightBar {
            id: bottomRightBar
            x: parent.width * 0.33
            y: parent.height - height
            width: parent.width * 0.67
            height: parent.height / 4
        }

        MapScreen {
            anchors {
                top: topBar.bottom
                bottom: bottomLeftBar.top
                left: parent.left
                right: parent.right
            }
        }
    }

    ShaderEffect {
        anchors.fill: parent
        property real glowRadius:   0.008
        property real glowStrength: 0.15
        property real dimLevel:     0.0
        property real scanStrength: 0.45
        property real tintStrength: 0.04
        property real vig:          0.0
        property real screenHeight: root.height
        property var src: ShaderEffectSource {
            sourceItem: sceneContent
            hideSource: true
        }
        fragmentShader: "vfd.frag.qsb"
    }
}