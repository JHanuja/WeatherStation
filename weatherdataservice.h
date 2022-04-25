#pragma once
#include <QObject>
#include "weatherdata.h"
#include <QVariant>
#include "QNetworkReply"

class WeatherDataService : public QObject
{
    Q_OBJECT
private:
    WeatherData data;

public:
    explicit WeatherDataService(QObject *parent = nullptr);



signals:
    void fetchedData(QVariant data);

public slots:
    void fetchData();
    void onfinish(QNetworkReply *rep);

};


