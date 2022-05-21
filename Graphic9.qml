import QtQuick 2.0

Item {
    id: root

    anchors.fill: parent

    property var mindate;
    property var maxdate;
    property var values;

    function soilHumidityRange(x){
        var soilHum;
        if (x >= 0 && x <100){
            soilHum = 100;
        }
        if (x >= 100 && x <200){
            soilHum = 200;
        }
        if (x >= 200 && x <300){
            soilHum = 300;
        }
        if (x >= 300 && x <400){
            soilHum = 400;
        }
        if (x >= 400 && x <500){
            soilHum = 500;
        }
        if (x >= 500 && x <600){
            soilHum = 600;
        }
        if (x >= 600 && x <700){
            soilHum = 700;
        }
        if (x >= 700 && x <800){
            soilHum = 800;
        }
        if (x >= 800 && x <900){
            soilHum = 900;
        }
        if (x >= 900 && x <1000){
            soilHum = 1000;
        }
        if (x >= 1000 && x <1100){
            soilHum = 1100;
        }
        if (x >= 1100 && x <1200){
            soilHum = 1200;
        }
        if (x >= 1200 && x <1300){
            soilHum = 1300;
        }
        if (x >= 1300 && x <1400){
            soilHum = 1400;
        }
        if (x >= 1400 && x <1500){
            soilHum = 1500;
        }
        if (x >= 1500 && x <1600){
            soilHum = 1600;
        }
        if (x >= 1600 && x <1700){
            soilHum = 1700;
        }
        if (x >= 1700 && x <1800){
            soilHum = 1800;
        }
        if (x >= 1800 && x <1900){
            soilHum = 1900;
        }
        if (x >= 1900 && x <2000){
            soilHum = 2000;
        }
        return soilHum;
    }

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
                    text: qsTr("Bodenfeuchte Verlauf")
                    font.pixelSize: rectangle1.width * 0.05
                    font.bold: true
                }
            }

            Rectangle {
                y: parent.height * 0.05
                x: parent.width * 0.7
                id: color1
                width: parent.width * 0.02
                height: parent.width*0.02
                color: "#00ff44"
            }

            Text {
                y: parent.height * 0.05
                x: parent.width * 0.73
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

                BasicChart{
                    mapFunction: soilHumidityRange
                    minDate: root.mindate
                    maxDate: root.maxdate
                    values: root.values
                }
            }
        }
}


