// MapScreen.qml
import QtQuick
import QtLocation
import QtPositioning

Rectangle {
	color: "transparent"
	border.color: "white"
	border.width: 3


	Plugin {
		id: mapPlugin
		name: "osm"
		PluginParameter {
			   name: "osm.mapping.custom.host"
			   value: "https://tile.openstreetmap.de/{z}/{x}/{y}.png"
		   }
	}

	Map {
		id: map
		anchors.fill: parent
		plugin: mapPlugin
		center: QtPositioning.coordinate(59.91, 10.75)
		zoomLevel: 14

		property geoCoordinate startCentroid

		PinchHandler {
			id: pinch
			target: null
			onActiveChanged: if (active) {
				map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
			}
			onScaleChanged: (delta) => {
				map.zoomLevel += Math.log2(delta)
				map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
			}
			onRotationChanged: (delta) => {
				map.bearing -= delta
				map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
			}
			grabPermissions: PointerHandler.TakeOverForbidden
		}

		WheelHandler {
			id: wheel
			acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
							 ? PointerDevice.Mouse | PointerDevice.TouchPad
							 : PointerDevice.Mouse
			rotationScale: 1/120
			property: "zoomLevel"
		}

		DragHandler {
			id: drag
			target: null
			onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
		}

		Shortcut {
			enabled: map.zoomLevel < map.maximumZoomLevel
			sequences: [ StandardKey.ZoomIn ]
			onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
		}

		Shortcut {
			enabled: map.zoomLevel > map.minimumZoomLevel
			sequences: [ StandardKey.ZoomOut ]
			onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
		}
	}
}