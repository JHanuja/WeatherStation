import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtCharts 2.15



    ChartView {

        function airHumidityRange(x){
            var airHum;
            if (x >= 0 && x < 5){
                airHum = 5;
            }
            if (x >= 5 && x < 10){
                airHum = 10;
            }
            if (x >= 10 && x < 15){
                airHum= 15;
            }
            if (x >= 15 && x < 20){
                airHum= 20;
            }
            if (x >= 20 && x < 25){
                airHum= 25;
            }
            if (x >= 25 && x < 30){
                airHum= 30;
            }
            if (x >= 30 && x < 35){
                airHum= 35;
            }
            if (x >= 35 && x < 40){
                airHum= 40;
            }
            if (x >= 40 && x < 45){
                airHum= 45;
            }
            if (x >= 45 && x < 50){
                airHum= 50;
            }
            if (x >= 50 && x < 55){
                airHum= 55;
            }
            if (x >= 55 && x < 60){
                airHum= 60;
            }
            if (x >= 60 && x < 65){
                airHum= 65;
            }
            if (x >= 65 && x < 70){
                airHum= 70;
            }
            if (x >= 70 && x < 75){
                airHum= 75;
            }
            if (x >= 75 && x < 80){
                airHum= 80;
            }
            if (x >= 80 && x < 85){
                airHum= 85;
            }
            if (x >= 85 && x < 90){
                airHum= 90;
            }
            if (x >= 90 && x < 95){
                airHum= 95;
            }
            if (x >= 95 && x < 100){
                airHum= 100;
            }
            return airHum;
        }





        property var minDate;
        property var maxDate;
        property var tickCount;
        property var allValues : [];


        Connections{
            target: wsData
                function onFetchedData(){

                    chart.removeAllSeries();

                    let avg = wsData.getAvgHum();

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

                    yAxis.min = airHumidityRange(Math.min(...allValues)) -5;
                    yAxis.max = airHumidityRange(Math.max(...allValues));
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

