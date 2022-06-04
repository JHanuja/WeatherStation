import QtQuick 2.0

Item {
    id: root

    anchors.fill: parent

    property var sunrise;
    property var sunset;

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
                    text: qsTr("Sonnenzeiten")
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

                    Rectangle {
                        id: rectangle31
                        width: parent.width
                        height: parent.height *0.5
                        color:  "#424242"

                        Text{
                            anchors.centerIn: parent
                            text: "🌞"
                            font.pixelSize: parent.width * 0.2
                        }


                    }

                    Rectangle {
                        id: rectangle32
                        y: parent.height * 0.5
                        width: parent.width
                        height: parent.height * 0.5
                        color: "#424242"

                        Text{
                            anchors.centerIn: parent
                            text: "🌚"
                            font.pixelSize: parent.width * 0.2
                        }
                    }

                }

                Rectangle {
                    id: rectangle4
                    x: parent.width * 0.5
                    width: parent.width * 0.5
                    height: parent.height
                    color: "#424242"

                    Text{
                        text: new Date(root.sunrise).toLocaleTimeString()
                        font.pixelSize: 15
                        color: "#ffffff"
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height * 0.6
                    }

                    Text{
                        text: new Date(root.sunset).toLocaleTimeString()
                        font.pixelSize: 15
                        color: "#ffffff"
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height * -0.4
                    }
                }
            }
        }
}


