import QtQuick 2.0

Item {
    id: root

    anchors.fill: parent
    property int ppm;

        Rectangle{
            id: rectangle1
            anchors.centerIn: parent
            width:parent.width
            height:parent.height
            color: "#424242"
            radius: 7

            Rectangle {
                y: parent.height * 0.05
                x: parent.width * 0.05
                id: rectangle
                width: parent.width * 0.5
                height: parent.height*0.2
                color: "#424242"
                Text {
                    id: text1
                    color: "#00ff44"
                    text: qsTr("Luftqualität")
                    font.pixelSize: rectangle1.width * 0.05
                    font.bold: true

                }
            }

            Rectangle {

                id: rectangle2
                y: parent.height * 0.2 + 10
                x: 10
                width: parent.width - 20
                height: parent.height * 0.8 - 30
                color: "#424242"

                Rectangle {
                    id: rectangle3
                    width: parent.width * 0.5
                    height: parent.height
                    color: "#424242"

                    Rectangle{
                        anchors.centerIn: parent
                        width: parent.width * 0.3
                        height: parent.height
                        radius: 10.0
                        color: "#424242"
                        border.color: "#ffffff"
                        border.width: 3.0

                        Rectangle{
                            width: parent.width * 0.7
                            height: parent.height * 0.2
                            radius: 100
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: parent.height * 0.1
                            color: "#ffffff"
                        }

                        Rectangle{
                            width: parent.width * 0.7
                            height: parent.height * 0.2
                            radius: 100
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: parent.height * 0.4
                            color: "#ffffff"
                        }

                        Rectangle{
                            width: parent.width * 0.7
                            height: parent.height * 0.2
                            radius: 100
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: parent.height * 0.7
                            color: "#ffffff"
                        }
                    }

                }

                Rectangle {
                    id: rectangle4
                    x: parent.width * 0.5
                    width: parent.width * 0.5
                    height: parent.height
                    color: "#424242"

                    Text {
                        id: text10
                        text: qsTr(root.ppm +" ppm")
                        color: "#00ff44"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: parent.width * 0.15
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                }

        }

 }
}

