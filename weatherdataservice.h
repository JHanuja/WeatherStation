#pragma once
#include <QObject>
#include <QVariant>
#include "QNetworkReply"
#include <iostream>

class WeatherDataService : public QObject
{
    Q_OBJECT
private:

public:
    explicit WeatherDataService(QObject *parent = nullptr);



signals:
    void fetchedData(QVariant data);

public slots:
    void fetchData(QString ip);
    void onfinish(QNetworkReply *rep);

};


