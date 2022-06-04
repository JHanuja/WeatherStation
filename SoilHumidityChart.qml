import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtCharts 2.15



    ChartView {

        function soilHumidityRange(x){
            var soilHum;
            if (x >= 0 && x <100){
                soilHum = 100;
            }
            if (x >= 100 && x <200){
                soilHum = 200;
            }
            if (x >= 200 && x <300){
                soilHum = 300;
            }
            if (x >= 300 && x <400){
                soilHum = 400;
            }
            if (x >= 400 && x <500){
                soilHum = 500;
            }
            if (x >= 500 && x <600){
                soilHum = 600;
            }
            if (x >= 600 && x <700){
                soilHum = 700;
            }
            if (x >= 700 && x <800){
                soilHum = 800;
            }
            if (x >= 800 && x <900){
                soilHum = 900;
            }
            if (x >= 900 && x <1000){
                soilHum = 1000;
            }
            if (x >= 1000 && x <1100){
                soilHum = 1100;
            }
            if (x >= 1100 && x <1200){
                soilHum = 1200;
            }
            if (x >= 1200 && x <1300){
                soilHum = 1300;
            }
            if (x >= 1300 && x <1400){
                soilHum = 1400;
            }
            if (x >= 1400 && x <1500){
                soilHum = 1500;
            }
            if (x >= 1500 && x <1600){
                soilHum = 1600;
            }
            if (x >= 1600 && x <1700){
                soilHum = 1700;
            }
            if (x >= 1700 && x <1800){
                soilHum = 1800;
            }
            if (x >= 1800 && x <1900){
                soilHum = 1900;
            }
            if (x >= 1900 && x <2000){
                soilHum = 2000;
            }
            return soilHum;
        }





        property var minDate;
        property var maxDate;
        property var tickCount;
        property var allValues : [];


        Connections{
            target: wsData
                function onFetchedData(){

                    chart.removeAllSeries();

                    let avg = wsData.getAvgSoilHum();

                    let avgSeries = chart.createSeries(ChartView.SeriesTypeLine, 2, xAxis, yAxis);
                    avgSeries.pointsVisible = true;
                    avgSeries.color = "#0dff00"

                    tickCount = 0;
                    allValues = [];

                    for (var avgprop in avg){
                        if(tickCount==0){
                            minDate = avgprop;
                        }
                        maxDate = avgprop;
                        allValues.push(avg[avgprop]);
                        tickCount++;
                        avgSeries.append(new Date(avgprop), avg[avgprop]);
                    }



                    xAxis.min = new Date(minDate);
                    xAxis.max = new Date(maxDate);
                    xAxis.tickCount = tickCount +1;

                    yAxis.min = soilHumidityRange(Math.min(...allValues)) -200;
                    yAxis.max = soilHumidityRange(Math.max(...allValues));
            }
        }


        id: chart
        anchors.fill: parent
        legend.visible: false
        theme: ChartView.ChartThemeDark
        axes: [
            DateTimeAxis {
               labelsFont: Qt.font({pointSize: 8})
               id: xAxis
               format: "d.M"


            },
            ValueAxis{
                labelsFont: Qt.font({pointSize: 8})
                id: yAxis
            }
        ]

    }

