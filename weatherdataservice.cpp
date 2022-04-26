#include "weatherdataservice.h"
#include <QObject>
#include <QVariant>
#include <QJsonDocument>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrl>
#include <QNetworkReply>
#include <iostream>


WeatherDataService::WeatherDataService(QObject *parent)
    : QObject{parent}
{
    fetchData("3.16.78.33:5000");
}

void WeatherDataService::fetchData(QString ip){

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);
    connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onfinish(QNetworkReply*)));
    connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));
    QString s = "http://"+ ip +"/dht";
    QUrl url{s};

    mgr->get(QNetworkRequest(url));



}


void WeatherDataService::onfinish(QNetworkReply *rep)
{
    QByteArray bts = rep->readAll();
    QString str(bts);

    qDebug() << str;

    QJsonDocument doc = QJsonDocument::fromJson(str.toUtf8());
    QByteArray dataJson = doc.toJson(QJsonDocument::Compact);
    emit fetchedData(QVariant(dataJson));


}
