import QtQuick 2.0

Item {
    id: root


    anchors.fill: parent

    property var mindate;
    property var maxdate;
    property var values;

    function airpressureRange(x){
        var ap;
        if (x >= 1150 && x <1200){
            ap= 1200;
        }
        if (x >= 1100 && x < 1150){
            ap= 1150;
        }
        if (x >= 1050 && x < 1100){
            ap = 1100;
        }
        if (x >= 1000 && x < 1050){
            ap= 1050;
        }
        if (x >= 950 && x < 1000){
            ap = 1000;
        }
        if (x >= 900 && x < 850){
            ap= 950;
        }
        if (x >= 850 && x < 900){
            ap= 900;
        }
        if (x >= 800 && x < 850){
            ap= 850;
        }
        if (x >= 750 && x < 800){
            ap= 800;
        }
        if (x >= 700 && x < 750){
            ap= 750;
        }
        if (x >= 650  && x < 700){
            ap= 700;
        }

        return ap;

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
                text: qsTr("Luftdruck Verlauf")
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
            text: qsTr("wert")
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

            SevenHourChart{
                mapFunction: airpressureRange
                minDate: root.mindate
                maxDate: root.maxdate
                values: root.values
            }
        }
    }

}


