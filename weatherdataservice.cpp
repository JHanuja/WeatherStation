#include "weatherdataservice.h"
#include <QObject>
#include <QVariant>
#include <QJsonDocument>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrl>
#include <QNetworkReply>
#include <iostream>
#include <QJsonArray>
#include <QJsonObject>
#include "data.h"


WeatherDataService::WeatherDataService(QObject *parent)
    : QObject{parent}
{
    fetchData("18.191.155.231:5000");
}

void WeatherDataService::fetchData(QString ip){
    qDebug() << ip;

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);
    connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onfinish(QNetworkReply*)));
    connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));
    QString s = "http://"+ ip +"/dht";

    QUrl url{s};
    //qDebug() << url;

    mgr->get(QNetworkRequest(url));



}


void WeatherDataService::onfinish(QNetworkReply *rep)
{
    QByteArray bts = rep->readAll();
    QString str(bts);


    QJsonDocument doc = QJsonDocument::fromJson(str.toUtf8());

    QJsonValue t =  doc["temperature"];
    temperature(t.toDouble());

    QJsonValue h =  doc["humidity"];
    humidity(h.toDouble());

    QJsonValue sh =  doc["soilhumidity"];
    soilhumidity(sh.toDouble());

    QJsonValue ap =  doc["airpressure"];
    airpressure(ap.toDouble());

    QJsonValue a =  doc["airquality"];
    airquality(a.toDouble());

    QJsonValue time =  doc["daytime"];
    daytime(time.toString());

    QJsonValue sr =  doc["sunrise"];
    sunrise(sr.toString());

    QJsonValue ss =  doc["sunset"];
    sunset(ss.toString());


    clearMaxTemp();
    clearAvgTemp();
    clearMinTemp();
    clearAvgHum();
    clearAvgSoilHum();
    clearAirqualityHistory();
    clearAirpressureHistory();


    QJsonArray max = doc["maxtemp"].toArray();
    for (auto v : max) {
        QJsonObject element = v.toObject();
        addMaxTemp(element["date"].toString(),element["value"].toDouble());
    }

    QJsonArray avg = doc["avgtemp"].toArray();
    for (auto v : avg) {
        QJsonObject element = v.toObject();
        addAvgTemp(element["date"].toString(),element["value"].toDouble());
    }

    QJsonArray min = doc["mintemp"].toArray();
    for (auto v : min) {
        QJsonObject element = v.toObject();
        addMinTemp(element["date"].toString(),element["value"].toDouble());
    }

    QJsonArray avgHum = doc["avghum"].toArray();
    for (auto v : avgHum) {
        QJsonObject element = v.toObject();
        addAvgHum(element["date"].toString(),element["value"].toDouble());
    }

    QJsonArray avgSoilHum = doc["avgsoilhum"].toArray();
    for (auto v : avgSoilHum) {
        QJsonObject element = v.toObject();
        addAvgSoilHum(element["date"].toString(),element["value"].toDouble());
    }

    QJsonArray airqHistory = doc["airqualityhistory"].toArray();
    for (auto v : airqHistory) {
        QJsonObject element = v.toObject();
        addAirqualityHistory(element["time"].toString(),element["value"].toDouble());
    }

    QJsonArray airpHistory = doc["airpressurehistory"].toArray();
    for (auto v : airpHistory) {
        QJsonObject element = v.toObject();
        addAirpressureHistory(element["time"].toString(),element["value"].toDouble());
    }


    emit fetchedData();


}

double WeatherDataService::temperature() const {
    return tmp;
}

void WeatherDataService::temperature(double t) {
    tmp = t;
}

double WeatherDataService::humidity() const {
    return hum;
}

void WeatherDataService::humidity(double h) {
    hum = h;
}

double WeatherDataService::soilhumidity() const {
    return soilhum;
}

void WeatherDataService::soilhumidity(double h) {
    soilhum = h;
}

double WeatherDataService::airpressure() const {
    return airp;
}

void WeatherDataService::airpressure(double h) {
    airp = h;
}

double WeatherDataService::airquality() const {
    return airq;
}

void WeatherDataService::airquality(double a) {
    airq = a;
}

QString WeatherDataService::daytime() const {
    return dt;
}

void WeatherDataService::daytime(QString t) {
    dt = t;
}

QString WeatherDataService::sunrise() const {
    return sunr;
}

void WeatherDataService::sunrise(QString t) {
    sunr = t;
}

QString WeatherDataService::sunset() const {
    return suns;
}

void WeatherDataService::sunset(QString t) {
    suns = t;
}

void WeatherDataService::addMaxTemp(QString date, double t){
    maxtmp.insert(date,t);
}

void WeatherDataService::clearMaxTemp(){
    maxtmp.clear();
}

void WeatherDataService::addAirqualityHistory(QString date, double t){
    airqualityHistory.insert(date,t);
}

void WeatherDataService::clearAirqualityHistory(){
    airqualityHistory.clear();
}

void WeatherDataService::addAirpressureHistory(QString date, double t){
    airpressureHistory.insert(date,t);
}

void WeatherDataService::clearAirpressureHistory(){
    airpressureHistory.clear();
}

void WeatherDataService::addAvgTemp(QString date, double t){
    avgtmp.insert(date,t);
}

void WeatherDataService::clearAvgTemp(){
    avgtmp.clear();
}

void WeatherDataService::addMinTemp(QString date, double t){
    mintmp.insert(date,t);
}

void WeatherDataService::clearMinTemp(){
    mintmp.clear();
}

void WeatherDataService::addAvgHum(QString date, double h){
    avghum.insert(date,h);
}

void WeatherDataService::clearAvgHum(){
    avghum.clear();
}

void WeatherDataService::addAvgSoilHum(QString date, double h){
    avgsoilhum.insert(date,h);
}

void WeatherDataService::clearAvgSoilHum(){
    avgsoilhum.clear();
}
