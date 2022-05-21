import QtQuick 2.0

Item {
    id: root

    anchors.fill: parent

    property var mindate;
    property var maxdate;
    property var values;

    function airHumidityRange(x){
        var airHum;
        if (x >= 0 && x < 5){
            airHum = 5;
        }
        if (x >= 5 && x < 10){
            airHum = 10;
        }
        if (x >= 10 && x < 15){
            airHum= 15;
        }
        if (x >= 15 && x < 20){
            airHum= 20;
        }
        if (x >= 20 && x < 25){
            airHum= 25;
        }
        if (x >= 25 && x < 30){
            airHum= 30;
        }
        if (x >= 30 && x < 35){
            airHum= 35;
        }
        if (x >= 35 && x < 40){
            airHum= 40;
        }
        if (x >= 40 && x < 45){
            airHum= 45;
        }
        if (x >= 45 && x < 50){
            airHum= 50;
        }
        if (x >= 50 && x < 55){
            airHum= 55;
        }
        if (x >= 55 && x < 60){
            airHum= 60;
        }
        if (x >= 60 && x < 65){
            airHum= 65;
        }
        if (x >= 65 && x < 70){
            airHum= 70;
        }
        if (x >= 70 && x < 75){
            airHum= 75;
        }
        if (x >= 75 && x < 80){
            airHum= 80;
        }
        if (x >= 80 && x < 85){
            airHum= 85;
        }
        if (x >= 85 && x < 90){
            airHum= 90;
        }
        if (x >= 90 && x < 95){
            airHum= 95;
        }
        if (x >= 95 && x < 100){
            airHum= 100;
        }
        return airHum;
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

                BasicChart{
                    mapFunction: airHumidityRange
                    minDate: root.mindate
                    maxDate: root.maxdate
                    values: root.values
                }
            }
        }

}


