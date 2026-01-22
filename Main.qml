import QtQuick
import "ui/"

Window {
    id: root
    width: 1280
    height: 800
    visible: true
    title: qsTr("Ghia")

    BottomBar {
        id: bottomBar
    }
    MapScreen {
        id: mapView
    }
}
