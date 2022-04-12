import QtQuick 2.0


Item {
    id: root

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
                text: qsTr("Temperatur-Verlauf")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: rectangle1.width * 0.05
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
