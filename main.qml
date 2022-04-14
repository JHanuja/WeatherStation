import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15




Window {
    id:mainWindow
    minimumHeight: 0
    minimumWidth: 0

    visible: true
    title: qsTr("Hello World")
    color: "black"

    property int screenWidth: 479
    property int screenHeight: 732

    onWidthChanged: screenWidth = width
    onHeightChanged: screenHeight = height


            Page{

            id: page
            width: screenWidth
            height: screenHeight
            padding: 30



            ScrollView {
                id: scroller
                anchors.fill: parent


                GridLayout{


                        id: gridlayout
                        anchors.fill: parent


                        property int elementWidth: {




                            if (mainWindow.screenWidth > 0 && mainWindow.screenWidth <= 695){
                                return mainWindow.screenWidth - 60
                            }

                            if (mainWindow.screenWidth > 695 && mainWindow.screenWidth <= 991){
                                return mainWindow.screenWidth / 2 - 30
                            }

                            if (mainWindow.screenWidth > 991 && mainWindow.screenWidth < 1250){
                                return mainWindow.screenWidth / 3 - 20
                            }

                            if (mainWindow.screenWidth > 1250){
                                return mainWindow.screenWidth / 4 - 15
                            }



                        }

                        property int elementHeight: {




                                if (mainWindow.screenHeight > 0 && mainWindow.screenHeight <= 400){
                                    return mainWindow.screenHeight - 30
                                }

//                                if (mainWindow.screenHeight > 400 && mainWindow.screenHeight <= 900){
//                                    return mainWindow.screenHeight/2 - 30
//                                }

                                if (mainWindow.screenHeight > 400){
                                    return mainWindow.screenHeight / 3 - 20
                                }
                       }





                        columns: Math.max(Math.floor(mainWindow.screenWidth / elementWidth), 1)
                        rows: Math.max(Math.floor(mainWindow.screenHeight / elementHeight), 1)//Math.max(Math.ceil(children.length / columns), 1)





                            Rectangle {
                                id: graphic1
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic1{
                                    degrees:30

                                }
                            }

                            Rectangle {
                                id: graphic2
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic2{
                                    humidity: 50
                                }
                            }

                            Rectangle {
                                id: graphic3
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight    
                                Layout.alignment :  Qt.AlignCenter

                                Graphic3{
                                    soilHumidity: 50

                                }
                            }


                            Rectangle {
                                id: graphic4
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic4{
                                    airPressure: 50
                                }
                            }


                            Rectangle {
                                id: graphic5
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic5{

                                }
                            }

                            Rectangle {
                                id: graphic6
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic6{

                                }
                            }

                            Rectangle {
                                id: graphic7
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic7{

                                }
                            }

                            Rectangle {
                                id: graphic8
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic8{

                                }
                            }

                            Rectangle {
                                id: graphic9
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic9{

                                }
                            }

                            Rectangle {
                                id: graphic10
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic10{

                                }
                            }

                            Rectangle {
                                id: graphic11
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic11{

                                }
                            }

                            Rectangle {
                                id: graphic12
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic12{

                                }
                            }


                        }


            }
        }
















}
