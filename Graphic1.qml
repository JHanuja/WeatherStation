import QtQuick 2.0

Item {
    id: root

    property int degrees;

    anchors.fill: parent



    Rectangle {
        anchors.fill: parent

        color: "#7a706f"


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
                    text: qsTr("Temperatur")
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
                        id: rectangle5
                        width: parent.width * 0.2
                        height: parent.height * 0.8
                        color: "#ffffff"
                        radius: 24
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            id: rectangle7
                            width: parent.width
                            height: parent.height* (root.degrees+ 30)/80
                            color: "#00ff44"
                            radius: 24
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 0

                            Rectangle {
                                    width:  parent.radius
                                    height:  parent.radius
                                    anchors {
                                        top: parent.top
                                        right: parent.right
                                        left: parent.left
                                    }
                                    color: parent.color
                                }

                        }

                    }


                    Rectangle {
                        x: parent.width * 0.35
                        id: rectangle12
                        width: parent.width * 0.01
                        height: rectangle5.height
                        opacity: 1
                        color: "#ffffff"
                        radius: 0
                        anchors.verticalCenter: parent.verticalCenter

                        Rectangle {
                            y: 0
                            x:-10
                            id: rectangle30
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0

                            Text{
                                text: "50"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -15
                                anchors.verticalCenter: parent.verticalCenter
                            }

                        }

                        Rectangle {
                            y: parent.height/8
                            x:-10
                            id: rectangle31
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0

                            Text{
                                text: "40"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -15
                                anchors.verticalCenter: parent.verticalCenter
                            }

                        }

                        Rectangle {
                            y: parent.height/8 * 2
                            x:-10
                            id: rectangle32
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0

                            Text{
                                text: "30"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -15
                                anchors.verticalCenter: parent.verticalCenter
                            }

                        }

                        Rectangle {
                            y: parent.height/8 * 3
                            x:-10
                            id: rectangle33
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0

                            Text{
                                text: "20"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -15
                                anchors.verticalCenter: parent.verticalCenter
                            }

                        }

                        Rectangle {
                            y: parent.height/8 * 4
                            x:-10
                            id: rectangle34
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0

                            Text{
                                text: "10"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -15
                                anchors.verticalCenter: parent.verticalCenter
                            }

                        }

                        Rectangle {
                            y: parent.height/8 *5
                            x:-10
                            id: rectangle35
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0

                            Text{
                                text: "0"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -15
                                anchors.verticalCenter: parent.verticalCenter
                            }

                        }

                        Rectangle {
                            y: parent.height/8 * 6
                            x:-10
                            id: rectangle36
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0

                            Text{
                                text: "-10"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -20
                                anchors.verticalCenter: parent.verticalCenter
                            }

                        }

                        Rectangle {
                            y: parent.height/8 * 7
                            x:-10
                            id: rectangle37
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0


                            Text{
                                text: "-20"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -20
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Rectangle {
                            y: parent.height - 1
                            x:-10
                            id: rectangle38
                            width: 10
                            height: 1
                            opacity: 1
                            color: "#ffffff"
                            radius: 0

                            Text{
                                text: "-30"
                                font.pixelSize: 10
                                color: "#ffffff"
                                x: -20
                                anchors.verticalCenter: parent.verticalCenter
                            }

                        }

                    }

                }

                Rectangle {
                    id: rectangle4
                    x: parent.width * 0.5
                    width: parent.width * 0.5
                    height: parent.height
                    color: "#424242"


                    Text {
                        id: text10
                        text: qsTr(root.degrees +"°C")
                        color: "#00ff44"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: parent.width * 0.25
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
      }
}


