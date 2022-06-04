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
                    text: qsTr("Luftfeuchte Verlauf")
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
                color: "#00ff44"

            }

            Text {
                y: parent.height * 0.05
                x: parent.width * 0.63
                id: color1Text
                color: "#ffffff"
                text: qsTr("Durchschnitt")
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

                HumidityChart {

                }
            }
        }

}


