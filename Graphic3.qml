import QtQuick 2.0

Item {
    id: root

    property int humidity;

    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        color: "#7a706f"
        radius: 35

        Rectangle {
            id: rectangle1
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            color: "#7a706f"
            radius: 30
            border.width: 3
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0

            Rectangle {
                id: rectangle2
                y: parent.height * 0.2 + 10
                x: 10
                width: parent.width - 20
                height: parent.height * 0.8 - 30
                color:"#7a706f"

                Rectangle {
                    id: rectangle3
                    x: 224
                    y: 144
                    width: parent.width * 0.30
                    height: parent.height * 0.50
                    color: "#8e9490"
                    radius: 100
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: text2
                        color: "#00ff44"
                        text: qsTr(root.humidity + "%")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: rectangle3.width * 0.25
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                ArcItem {
                    id: arc
                    x: 269
                    y: 128
                    width: parent.width * 0.33
                    height: parent.height * 0.56
                    anchors.verticalCenter: parent.verticalCenter
                    dashOffset: 0
                    focus: false
                    arcWidth: 10
                    outlineArc: true
                    roundBegin: false
                    roundEnd: false
                    round: true
                    capStyle: 0
                    strokeStyle: 0
                    end: 360/100 * humidity
                    begin: 0
                    strokeWidth: 1
                    rotation: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillColor: "#00ff44"
                }
            }

        }

        Rectangle {
            y: 4
            anchors.horizontalCenter: parent.horizontalCenter
            id: rectangle20
            width: parent.width * 0.5
            height: parent.height * 0.2
            opacity: 1.0

            color: "#8e9490"
            border.width: 1
            anchors.horizontalCenterOffset: 10

            Text {
                id: text1
                color: "#00ff44"
                text: qsTr("Bodenfeuchte")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: rectangle1.width * 0.05
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
