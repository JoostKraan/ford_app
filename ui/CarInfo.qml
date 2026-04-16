import QtQuick 2.15
import "custom"

Item {
    anchors.fill: parent

    Row {
        spacing: 15
        anchors.fill: parent
        topPadding: 15
        leftPadding: 15
        Rectangle{

            color: "transparent"
            border.color: "white"
            border.width: 1
            height: parent.height -30
            width: parent.width / 2.32

            Column{
                spacing: 1
                anchors{
                    centerIn:  parent
                }
                CustomText{

                    font.pointSize: 18
                    text: "Directions or car info"
                }
                CustomText{
                    font.pointSize: 18
                    text: "blabla"
                }
            }

        }
        Rectangle{

            color: "transparent"
            border.color: "white"
            border.width: 1
            height: parent.height -30
            width: parent.width /4

            Column{
                spacing: 1
                anchors{
                    centerIn:  parent
                }
                CustomText{
                    id: speed

                    font.pointSize: 51
                    text: "30"
                }
                CustomText{
                    font.pointSize: 18
                    text: "km/h"
                }
            }

        }

        Rectangle {
            id: gears
            color: "transparent"
            border.color: "white"
            border.width: 1
            height: parent.height - 30
            width: parent.width / 4

            Column {
                spacing: 1
                anchors.centerIn: parent

                CustomText {
                    id: num
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 51
                    text: "1"
                }
                CustomText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize:  18
                    text: "gear"
                }
            }
        }
    }
}