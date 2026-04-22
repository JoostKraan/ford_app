pragma Singleton
import QtQuick

QtObject {
    id: root
    readonly property string mapboxToken: {
        return Qt.environment["MAPBOX_TOKEN"] ?? ""
    }
}