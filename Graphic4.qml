import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id: root

    anchors.fill: parent

    property var value;

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
                text: qsTr("Luftdruck")
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
            color: "#00e5ff"
        }

        Text {
            y: parent.height * 0.05
            x: parent.width * 0.63
            id: color1Text
            color: "#ffffff"
            text: qsTr("Regen")
            font.pixelSize: rectangle1.width * 0.02
            font.bold: false
        }

        Rectangle {
            y: parent.height * 0.05
            x: parent.width * 0.7
            id: color2
            width: parent.width * 0.02
            height: parent.width*0.02
            color: "#ba03fc"
        }

        Text {
            y: parent.height * 0.05
            x: parent.width * 0.73
            id: color2Text
            color: "#ffffff"
            text: qsTr("Wolkig")
            font.pixelSize: rectangle1.width * 0.02
            font.bold: false
        }

        Rectangle {
            y: parent.height * 0.05
            x: parent.width * 0.8
            id: color3
            width: parent.width * 0.02
            height: parent.width*0.02
            color: "#fce303"
        }

        Text {
            y: parent.height * 0.05
            x: parent.width * 0.83
            id: color3Text
            color: "#ffffff"
            text: qsTr("Sonnig")
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

            CircularGauge {
                anchors.centerIn: parent
                minimumValue: 970
                maximumValue: 1050
                value: root.value

                style: CircularGaugeStyle {
                    tickmarkStepSize: 10.0

                    tickmarkLabel:  Text {
                        font.pixelSize: Math.max(6, outerRadius * 0.1)
                        text: styleData.value
                        color: styleData.value < 1000 ? "#00e5ff" : styleData.value < 1025 ? "#ba03fc" : "#fce303"
                        antialiasing: true
                    }
                    needle: Rectangle {
                        y: outerRadius * 0.15
                        implicitWidth: outerRadius * 0.03
                        implicitHeight: outerRadius * 0.9
                        antialiasing: true

                        color:  root.value < 1000 ? "#00e5ff" : root.value < 1025 ? "#ba03fc" : "#fce303"
                    }
                }
            }
        }
    }
}


