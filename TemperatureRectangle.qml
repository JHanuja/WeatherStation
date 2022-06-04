import QtQuick 2.0

Item {
    id: root

    anchors.fill: parent

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
                    text: qsTr("Temperatur Verlauf")
                    font.pixelSize: rectangle1.width * 0.05
                    font.bold: true

                }
            }

            Rectangle {
                y: parent.height * 0.05
                x: parent.width * 0.6
                id: color1
                width: parent.width * 0.02
                height: parent.width*0.02
                color: "#ff0000"

            }

            Text {
                y: parent.height * 0.05
                x: parent.width * 0.63
                id: color1Text
                color: "#ffffff"
                text: qsTr("Max")
                font.pixelSize: rectangle1.width * 0.02
                font.bold: false

            }

            Rectangle {
                y: parent.height * 0.05
                x: parent.width * 0.7
                id: color2
                width: parent.width * 0.02
                height: parent.width*0.02
                color: "#0dff00"

            }

            Text {
                y: parent.height * 0.05
                x: parent.width * 0.73
                id: color2Text
                color: "#ffffff"
                text: qsTr("Schnitt")
                font.pixelSize: rectangle1.width * 0.02
                font.bold: false
            }

            Rectangle {
                y: parent.height * 0.05
                x: parent.width * 0.83
                id: color3
                width: parent.width * 0.02
                height: parent.width*0.02
                color: "#00e1ff"

            }

            Text {
                y: parent.height * 0.05
                x: parent.width * 0.86
                id: color3Text
                color: "#ffffff"
                text: qsTr("Min")
                font.pixelSize: rectangle1.width * 0.02
                font.bold: false

            }

            Rectangle {

                id: rectangle2
                y: parent.height * 0.2 + 10
                x: 10
                width: parent.width - 20
                height: parent.height * 0.8 - 30
                color: "#424242"

                TemperatureChart{
                }
            }
        }
}


