import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15




Window {
    id:mainWindow
    minimumHeight: 0
    minimumWidth: 0

    visible: true
    title: qsTr("Weatherstation")
    color: "black"

    property int screenWidth: 479
    property int screenHeight: 732

    onWidthChanged: screenWidth = width
    onHeightChanged: screenHeight = height

    property int degrees;
    property int humidity;
    property var daytime;

    Connections{
        target:wsData
        function onFetchedData(data){
            var json = JSON.parse(data);
            degrees = json["temperature"];
            humidity = json["humidity"];
            daytime = json["daytime"];

            console.log(daytime);

        }
    }


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
                                    degrees:mainWindow.degrees

                                }
                            }

                            Rectangle {
                                id: graphic2
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic7{
                                    mindate: new Date('2022-04-29');
                                    maxdate: new Date('2022-05-05');
                                    values: [[-4, 0,4,4.5,2,1,3.3],[-10, 2,6,7.0,8.2,9.0,3.0],[-5,3,5,6,5.8,9,-3]];

                                }
                            }

                            Rectangle {
                                id: graphic3
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight    
                                Layout.alignment :  Qt.AlignCenter

                                Graphic2{
                                    humidity: mainWindow.humidity
                                }
                            }

                            Rectangle {
                                id: graphic4
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic8{
                                    mindate: new Date('2022-04-29');
                                    maxdate: new Date('2022-05-05');
                                    values: [[],[50,50,55,67,80,56,34],[]];
                                }
                            }

                            Rectangle {
                                id: graphic5
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic5{
                                    ppm: 150
                                }
                            }

                            Rectangle {
                                id: graphic6
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic10{
                                    mindate: new Date('2022-04-29T15:00:00');
                                    maxdate: new Date('2022-04-29T24:00:00');
                                    values: [1200,1350,700,800,900,1500,1750];
                                }
                            }

                            Rectangle {
                                id: graphic7
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic4{
                                    value : 1000
                                }
                            }

                            Rectangle {
                                id: graphic8
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic11{
                                    mindate: new Date('2022-04-29T15:00:00');
                                    maxdate: new Date('2022-04-29T24:00:00');
                                    values: [1000, 800];
                                }
                            }

                            Rectangle {
                                id: graphic9
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic3{
                                    soilHumidity: 20
                                }
                            }

                            Rectangle {
                                id: graphic10
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic9{
                                    mindate: new Date('2022-04-29');
                                    maxdate: new Date('2022-05-05');
                                    values: [[],[1200,750,600,500,550,450,500],[]];
                                }
                            }

                            Rectangle {
                                id: graphic11
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic6{
                                    sunrise: "07:15h"
                                    sunset: "21:30h"
                                }
                            }

                            Rectangle {
                                id: graphic12
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Graphic12{
                                    daytime:mainWindow.daytime
                                }
                            }
                        }
            }
        }
















}
