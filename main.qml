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


    property var daytime;
    property var temperature;
    property var humidity;
    property var airquality;
    property var airpressure;
    property var maxtemp;
    property var mintemp;
    property var avgtemp;
    property var avghum;
    property var soilhumidity;
    property var avgsoilhum;
    property var sunrise;
    property var sunset;
    property var airpressurehistory;
    property var airqualityhistory;

    Connections{
        target:wsData
        function onFetchedData(){
            temperature = wsData.temperature;
            humidity = wsData.humidity;
            airquality = wsData.airquality;
            daytime = wsData.daytime;
            sunrise = wsData.sunrise();
            sunset = wsData.sunset();
            soilhumidity = wsData.soilhumidity;
            airpressure = wsData.airpressure;
//              console.log(wsData.temperature);
//              maxtemp =  wsData.getMaxTemp();

 //           console.log(wsData);

//            console.log(data["avgtemp"]);
//            daytime = json["daytime"];
//            temperature = json["temperature"];
//            humidity = json["humidity"];
//            airquality = json["airquality"];
//            airpressure = json["airpressure"];
//            maxtemp = json["maxtemp"];
//            mintemp = json["mintemp"];
//            avgtemp = json["avgtemp"];
//            avghum = json["avghum"];
//            avgsoilhum = json["avgsoilhum"];
//            sunrise = json["sunrise"];
//            sunset = json["sunset"];
//            airpressurehistory = json["airpressurehistory"];
//            airqualityhistory = json["airqualityhistory"];
//            console.log(daytime);
//            console.log(temperature);
//            console.log(humidity);
//            console.log(airquality);
//            console.log(airpressure);
//            console.log(maxtemp);
//            console.log(avgtemp);
//            console.log(avghum);
//            console.log(avgsoilhum);
//            console.log(sunrise);
//            console.log(sunset);
//            console.log(airpressurehistory);
//            console.log(airqualityhistory);



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

                                Thermometer{
                                    degrees:mainWindow.temperature
                                }
                            }

                            Rectangle {
                                id: graphic2
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                TemperatureRectangle{

                                }
                            }

                            Rectangle {
                                id: graphic3
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight    
                                Layout.alignment :  Qt.AlignCenter

                                HumidityCircle{
                                    humidity: mainWindow.humidity
                                }
                            }

                            Rectangle {
                                id: graphic4
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                HumidityRectangle{

                                }
                            }

                            Rectangle {
                                id: graphic5
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Airquality{
                                    ppm: mainWindow.airquality
                                }
                            }

                            Rectangle {
                                id: graphic6
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                AirqualitiyHistoryRectangle{

                                }
                            }

                            Rectangle {
                                id: graphic7
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Airpressure{
                                    value : mainWindow.airpressure
                                }
                            }

                            Rectangle {
                                id: graphic8
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                AirpressureHistoryRectangle{

                                }


                            }

                            Rectangle {
                                id: graphic9
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Soilhumidity{
                                    soilHumidity: mainWindow.soilhumidity
                                }
                            }

                            Rectangle {
                                id: graphic10
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter


                                SoilHumidityRectangle{

                                }


                            }

                            Rectangle {
                                id: graphic11
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                SunTime{
                                    sunrise: mainWindow.sunrise
                                    sunset: mainWindow.sunset
                                }
                            }

                            Rectangle {
                                id: graphic12
                                Layout.preferredWidth: gridlayout.elementWidth
                                Layout.preferredHeight: gridlayout.elementHeight
                                Layout.alignment :  Qt.AlignCenter

                                Daytime{
                                    daytime:mainWindow.daytime
                                }
                            }
                        }
            }
        }
















}
