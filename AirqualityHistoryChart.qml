import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtCharts 2.15



    ChartView {

        function airQualityRange(x){
            var airQual;
            if (x >= 0 && x <100){
                airQual = 100;
            }
            if (x >= 100 && x <200){
                airQual = 200;
            }
            if (x >= 200 && x <300){
                airQual = 300;
            }
            if (x >=300 && x <400){
                airQual = 400;
            }
            if (x >= 400 && x <500){
                airQual = 500;
            }
            if (x >= 500 && x <600){
                airQual = 600;
            }
            if (x >= 600 && x <700){
                airQual = 700;
            }
            if (x >= 700 && x <800){
                airQual = 800;
            }
            if (x >= 800 && x <900){
                airQual = 900;
            }
            if (x >= 900 && x <1000){
                airQual = 1000;
            }
            if (x >= 1000 && x <1100){
                airQual = 1100;
            }
            if (x >= 1100 && x <1200){
                airQual = 1200;
            }
            if (x >= 1200 && x <1300){
                airQual = 1300;
            }
            if (x >= 1300 && x <1400){
                airQual = 1400;
            }
            if (x >= 1400 && x <1500){
                airQual = 1500;
            }
            if (x >= 1500 && x <1600){
                airQual = 1600;
            }
            if (x >= 1600 && x <1700){
                airQual = 1700;
            }
            if (x >= 1700 && x <1800){
                airQual = 1800;
            }
            if (x >= 1800 && x <1900){
                airQual = 1900;
            }
            if (x >= 1900 && x <2000){
                airQual = 2000;
            }
            return airQual;
        }



        property var minDate;
        property var maxDate;
        property var tickCount;
        property var allValues : [];


        Connections{
            target: wsData
                function onFetchedData(){

                    chart.removeAllSeries();

                    let avg = wsData.getAirqualityHistory();

                    console.log(avg);

                    let avgSeries = chart.createSeries(ChartView.SeriesTypeLine, "line", xAxis, yAxis);
                    avgSeries.pointsVisible = false;
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

                    console.log(minDate);
                    console.log(maxDate);



                    xAxis.min = new Date(new Date(minDate).getTime());
                    xAxis.max = new Date(new Date(maxDate).getTime());
                    //xAxis.tickCount = tickCount +1;

                    yAxis.min = airQualityRange(Math.min(...allValues)) -200;
                    yAxis.max = airQualityRange(Math.max(...allValues));
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
               format: "hh:mm"
//               tickCount: 7


            },
            ValueAxis{
                labelsFont: Qt.font({pointSize: 8})
                id: yAxis
            }
        ]

    }

