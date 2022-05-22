import QtQuick 2.0

Item {
    id: root

    anchors.fill: parent

    property var mindate;
    property var maxdate;
    property var values;

    function temperatureRange(x){
        var tmp;
        if (x >= -50 && x < -45){
            tmp= -50;
        }
        if (x >= -45 && x < -40){
            tmp= -45;
        }
        if (x >= -40 && x < -35){
            tmp= -40;
        }
        if (x >= -35 && x < -30){
            tmp= -35;
        }
        if (x >= -30 && x < -25){
            tmp= -30;
        }
        if (x >= -25 && x < -20){
            tmp= -25;
        }
        if (x >= -20 && x < -15){
            tmp= -20;
        }
        if (x >= -15 && x < -10){
            tmp= -15;
        }
        if (x >= -10 && x < -5){
            tmp= -10;
        }
        if (x >= -5 && x < 0){
            tmp= -5;
        }
        if (x >=0  && x < 5){
            tmp= 5;
        }
        if (x >= 5 && x < 10){
            tmp= 10;
        }
        if (x >= 10 && x < 15){
            tmp= 15;
        }
        if (x >=15 && x < 20){
            tmp= 20;
        }
        if (x >= 20 && x < 25){
            tmp= 25;
        }
        if (x >= 25 && x < 30){
            tmp= 30;
        }
        if ((x >=30) && (x < 35)){
            tmp= 35;
        }
        if (x >= 35 && x < 40){
            tmp= 40;
        }
        if (x >= 40 && x < 45){
            tmp= 45;
        }
        if (x >= 45 && x < 50){
            tmp= 50;
        }

        return tmp;

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

                BasicChart{
                    mapFunction: temperatureRange
                    minDate: root.mindate
                    maxDate: root.maxdate
                    values: root.values
                }
            }
        }
}


