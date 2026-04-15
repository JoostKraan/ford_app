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
        TopBar{

        }

        BottomLeftBar {
            x: 0
            y: parent.height - height
            width: parent.width * 0.33
            height: parent.height / 4
        }

        BottomRightBar {
            x: parent.width * 0.33
            y: parent.height - height
            width: parent.width * 0.67
            height: parent.height / 4
        }
}
    ShaderEffect {
         anchors.fill: parent
        property real glowRadius:   0.012
        property real glowStrength: 0.9
        property real dimLevel:     0.08
        property real scanStrength: 0.45
        property real tintStrength: 0.04
        property vector4d texSize: Qt.vector4d(src.width, src.height, 0, 0)
        property real vig:          0.40
        property real screenHeight: root.height


        property var src: ShaderEffectSource {
            sourceItem: sceneContent
            hideSource: true
        }

        fragmentShader: "vfd.frag.qsb"
    }
}