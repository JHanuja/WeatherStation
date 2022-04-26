import QtQuick 2.0
import QtQuick.Controls 2.15


Item {
    id: root


    anchors.fill: parent

    property var daytime;






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
                    text: qsTr("Informationen")
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
                    id: rectangle4 
                    width: parent.width
                    height: parent.height
                    color: "#424242"

                    Rectangle{
                        id:rectangle7
                        width:parent.width
                        height:parent.height * 0.15

                        y: parent.height * 0.2
                        color: "#424242"

                        Text{
                            anchors.centerIn: parent
                            color: '#00ff44'
                            text: "Stand Daten: " + daytime
                        }

                    }

                    Rectangle{
                        id:rectangle10
                        width:parent.width * 0.4
                        height:parent.height * 0.15
                        x: parent.width * 0.3
                        y: parent.height * 0.4
                        color: "white"

                        TextInput{
                            id: ipadress
                            anchors.centerIn: parent
                            text: "3.16.78.33:5000"
                        }

                    }

                    Rectangle{
                        id:rectangle5
                        width:parent.width * 0.4
                        height:parent.height * 0.15
                        x: parent.width * 0.3
                        y: parent.height * 0.6
                        color: "#00ff44"

                        Button{

                            text: "Aktualisieren"
                            palette {
                                button: "#00ff44"
                            }

                            anchors.fill: parent
                            onClicked: {
                                wsData.fetchData(ipadress.text);
                            }
                        }

                    }



                }
            }
        }

}


