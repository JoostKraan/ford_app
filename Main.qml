import QtQuick
import "ui/"

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

        BottomBar {
            id: bottomBar
        }
    }

    ShaderEffect {
        anchors.fill: parent
        property real glowRadius:   0.012
        property real glowStrength: 0.85
        property real dimLevel:     0.08
        property real scanStrength: 0.45
        property real tintStrength: 0.04
        property real vig:          0.40
        property real screenHeight: root.height

        property var src: ShaderEffectSource {
            sourceItem: sceneContent
            hideSource: true
        }

        fragmentShader: "vfd.frag.qsb"
    }
}