#include "weatherdataservice.h"
#include <QObject>
#include <QVariant>
#include <QJsonDocument>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrl>
#include <QNetworkReply>

WeatherDataService::WeatherDataService(QObject *parent)
    : QObject{parent}
{

}

void WeatherDataService::fetchData(){

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);
    connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onfinish(QNetworkReply*)));
    connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    mgr->get(QNetworkRequest(QUrl("http://3.16.78.33:5000/dht")));



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
