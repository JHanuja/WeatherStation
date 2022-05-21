import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtCharts 2.15

    ChartView {

        property var minDate;
        property var maxDate;
        property var values;
        property var mapFunction;

        //property var allValues: values[0].concat(values[1]);

        id: chart
        anchors.fill: parent
        legend.visible: false
        theme: ChartView.ChartThemeDark
        axes: [
            DateTimeAxis {
               id: xAxis
               min: minDate;
               max: maxDate;
               format: "HH:MM"
               tickCount: 7

            },
            ValueAxis{

                id: yAxis
                min: mapFunction(Math.min(...values))
                max: mapFunction(Math.max(...values))
            }
        ]
        Component.onCompleted: {

                    let series = chart.createSeries(ChartView.SeriesTypeLine, "line", xAxis, yAxis);
                    series.pointsVisible = false;
                    series.color = "#00ff44"
                    let pointsCount = 144;
                    let date =new Date(JSON.parse(JSON.stringify(minDate)));

                    console.log(minDate);

                    var tmpArray = [];
                    for (let t = 0; t < 144;t++){
                        tmpArray.push(950.0+t)
                    }

                    console.log(tmpArray);

                    for(let i = 0;i < pointsCount;i++)
                    {

                        //console.log(tmpArray[i]);

                        let y = tmpArray[i];
                        series.append(date, y);
                        console.log(tmpArray[i]);
                        date.setTime(date.getTime()+(5*60*1000));
                    }
                }
    }

