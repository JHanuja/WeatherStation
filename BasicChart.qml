import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtCharts 2.15



    ChartView {

        property var minDate;
        property var maxDate;
        property var values;
        property var mapFunction;


        property var allValues: values[0].concat(values[1]).concat(values[2]);


        id: chart
        anchors.fill: parent
        legend.visible: false
        theme: ChartView.ChartThemeDark
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
                min: mapFunction(Math.min(...allValues))
                max: mapFunction(Math.max(...allValues))
            }
        ]
        Component.onCompleted: {

                for (let n = 0; n<values.length;n++){
                    let series = chart.createSeries(ChartView.SeriesTypeLine, n, xAxis, yAxis);
                    series.pointsVisible = true;
                    series.color = (n === 0) ?"	#ff4500" : (n === 1) ?"#54ff9f" : "#00bfff"
                    let pointsCount = 7;
                    let date =new Date(JSON.parse(JSON.stringify(minDate)));


                    console.log(minDate);

                    for(let i = 0;i < pointsCount;i++)
                    {
                        let y = chart.values[n][i];
                        series.append(date, y);
                        date.setDate(date.getDate() + 1);

                        console.log(chart.values[n][i]);

                    }
                }





        }
    }

