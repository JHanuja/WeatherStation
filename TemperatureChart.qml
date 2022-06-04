import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtCharts 2.15



    ChartView {

        function temperatureRange(x){
            var tmp;
            if (x >= -50 && x < -45){
                tmp= -50;
            }
            if (x >= -45 && x < -40){
                tmp= -45;
            }
            if (x >= -40 && x < -35){
                tmp= -40;
            }
            if (x >= -35 && x < -30){
                tmp= -35;
            }
            if (x >= -30 && x < -25){
                tmp= -30;
            }
            if (x >= -25 && x < -20){
                tmp= -25;
            }
            if (x >= -20 && x < -15){
                tmp= -20;
            }
            if (x >= -15 && x < -10){
                tmp= -15;
            }
            if (x >= -10 && x < -5){
                tmp= -10;
            }
            if (x >= -5 && x < 0){
                tmp= -5;
            }
            if (x >=0  && x < 5){
                tmp= 5;
            }
            if (x >= 5 && x < 10){
                tmp= 10;
            }
            if (x >= 10 && x < 15){
                tmp= 15;
            }
            if (x >=15 && x < 20){
                tmp= 20;
            }
            if (x >= 20 && x < 25){
                tmp= 25;
            }
            if (x >= 25 && x < 30){
                tmp= 30;
            }
            if ((x >=30) && (x < 35)){
                tmp= 35;
            }
            if (x >= 35 && x < 40){
                tmp= 40;
            }
            if (x >= 40 && x < 45){
                tmp= 45;
            }
            if (x >= 45 && x < 50){
                tmp= 50;
            }
            if (x >= 50 && x <= 70){
                tmp = 70;
            }

            if (x > 70){
                tmp = 100;
            }

            return tmp;

        }




        property var minDate;
        property var maxDate;
        property var tickCount;
        property var allValues : [];


        Connections{
            target: wsData
                function onFetchedData(){

                    chart.removeAllSeries();

                    let max = wsData.getMaxTemp();
                    let avg = wsData.getAvgTemp();
                    let min = wsData.getMinTemp();

                    console.log(max);
                    console.log(avg);
                    console.log(min);


                    let maxSeries = chart.createSeries(ChartView.SeriesTypeLine, 1, xAxis, yAxis);
                    maxSeries.pointsVisible = true;
                    maxSeries.color = "#ff0000"

                    let avgSeries = chart.createSeries(ChartView.SeriesTypeLine, 2, xAxis, yAxis);
                    avgSeries.pointsVisible = true;
                    avgSeries.color = "#0dff00"

                    let minSeries = chart.createSeries(ChartView.SeriesTypeLine, 3, xAxis, yAxis);
                    minSeries.pointsVisible = true;
                    minSeries.color = "#00e1ff"



                    tickCount = 0;
                    allValues = [];


                    for (var maxprop in max){
                        if(tickCount==0){
                            minDate = maxprop;
                        }
                        maxDate = maxprop;
                        allValues.push(max[maxprop]);
                        tickCount++;
                        maxSeries.append(new Date(maxprop), max[maxprop]);
                    }

                    for (var avgprop in avg){
                        allValues.push(avg[avgprop]);
                        avgSeries.append(new Date(avgprop), avg[avgprop]);
                    }

                    for (var minprop in min){
                        allValues.push(min[minprop]);
                        minSeries.append(new Date(minprop), min[minprop]);
                    }

                    xAxis.min = new Date(minDate);
                    xAxis.max = new Date(maxDate);
                    xAxis.tickCount = tickCount +1;

                    yAxis.min = temperatureRange(Math.min(...allValues)) -5;
                    yAxis.max = temperatureRange(Math.max(...allValues));
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
