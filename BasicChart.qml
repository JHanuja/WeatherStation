import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtCharts 2.15



    ChartView {

        property var minDate;
        property var maxDate;
        property var values;
        property var mapFunction;



        id: chart
        anchors.fill: parent
        legend.visible: false
        axes: [
            DateTimeAxis {
               id: xAxis
               min: minDate;
               max: maxDate;
               format: "d.M"
               tickCount: 7


            },
            ValueAxis{
                id: yAxis
                min: mapFunction(Math.min(...values))
                max: mapFunction(Math.max(...values))
            }
        ]
        Component.onCompleted: {



                var series = chart.createSeries(ChartView.SeriesTypeLine, "line", xAxis, yAxis);
                series.pointsVisible = true;
                series.color = "#00ff44"
                var pointsCount = 7;
                var date =minDate;

                for(var i = 0;i < pointsCount;i++)
                {

                    var y = chart.values[i];
                    series.append(date, y);
                    date.setDate(date.getDate() + 1);

                }

        }
    }

