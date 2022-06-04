import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtCharts 2.15



    ChartView {

        function airpressureRange(x){
            var ap;
            if (x >= 1150 && x <1200){
                ap= 1200;
            }
            if (x >= 1100 && x < 1150){
                ap= 1150;
            }
            if (x >= 1050 && x < 1100){
                ap = 1100;
            }
            if (x >= 1000 && x < 1050){
                ap= 1050;
            }
            if (x >= 950 && x < 1000){
                ap = 1000;
            }
            if (x >= 900 && x < 850){
                ap= 950;
            }
            if (x >= 850 && x < 900){
                ap= 900;
            }
            if (x >= 800 && x < 850){
                ap= 850;
            }
            if (x >= 750 && x < 800){
                ap= 800;
            }
            if (x >= 700 && x < 750){
                ap= 750;
            }
            if (x >= 650  && x < 700){
                ap= 700;
            }

            return ap;

        }



        property var minDate;
        property var maxDate;
        property var tickCount;
        property var allValues : [];


        Connections{
            target: wsData
                function onFetchedData(){

                    chart.removeAllSeries();

                    let avg = wsData.getAirpressureHistory();

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
                    console.log(new Date(minDate).getTime());



                    xAxis.min = new Date(minDate);
                    xAxis.max = new Date(maxDate);

                    yAxis.min = airpressureRange(Math.min(...allValues)) -200;
                    yAxis.max = airpressureRange(Math.max(...allValues));
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

