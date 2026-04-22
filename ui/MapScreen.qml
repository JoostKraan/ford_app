import QtQuick
import QtWebView

Item {
    id: root
    WebView {
        id: webView
        anchors.fill: parent
        url: Qt.resolvedUrl("qrc:/map.html")
        onLoadingChanged: function(loadRequest) {
            if (loadRequest.status === WebView.LoadSucceededStatus) {
                runJavaScript("initMap('" + MAPBOX_TOKEN + "');")
                runJavaScript("resizeMap();")
            }
        }
    }
}