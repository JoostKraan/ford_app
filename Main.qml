import QtQuick
import "ui"
Window {
    id: root
    width: 1280
    height: 800
    visible: true
    title: qsTr("Ghia")

    MapScreen {
        id: mapScreen
        anchors {
            top: parent.top
            topMargin: topBar.height
            bottom: parent.bottom
            bottomMargin: root.height / 4
            left: parent.left
            right: parent.right
        }
    }

    Item {
        id: sceneContent
        width: root.width
        height: root.height
        layer.enabled: true
        opacity: 0
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
    }

    ShaderEffect {
        anchors.fill: parent
        property var src: ShaderEffectSource {
            sourceItem: sceneContent
            hideSource: true
        }
        property real uiTopOffset:    topBar.height / root.height
        property real uiBottomOffset: (root.height / 4) / root.height
        property real glowRadius:    0.008
        property real glowStrength:  0.15
        property real dimLevel:      0.0
        property real scanStrength:  0.45
        property real tintStrength:  0.04
        property real vig:           0.0
        property real screenHeight:  root.height
        fragmentShader: "qrc:shaders/shaders/vfd.frag.qsb"
    }
}