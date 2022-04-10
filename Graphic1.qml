import QtQuick 2.0





Item {
    id: root

    property int degreesValue;
    property alias degrees: root.degreesValue

    anchors.fill: parent
    Rectangle{
        anchors.fill: parent
        color:  "black"


        Text{
            anchors.centerIn: parent
            font.bold: true
            text: degrees + "°C"
            color: "white"
            font.family: "Helvetica"
            font.pointSize: 60
        }

    }

}


