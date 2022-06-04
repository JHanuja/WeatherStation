#pragma once
#include <QObject>
#include <QVariant>
#include "QNetworkReply"
#include <iostream>
#include "data.h"

class WeatherDataService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double temperature READ temperature);
    Q_PROPERTY(double humidity READ humidity);
    Q_PROPERTY(double airquality READ airquality);
    Q_PROPERTY(QString daytime READ daytime);
    Q_PROPERTY(double soilhumidity READ soilhumidity);
    Q_PROPERTY(double airpressure READ airpressure);






private:
    double tmp;
    double hum;
    double airq;
    double soilhum;
    double airp;
    QString dt;
    QString sunr;
    QString suns;

    QMap<QString, double> maxtmp;
    QMap<QString, double> avgtmp;
    QMap<QString, double> mintmp;
    QMap<QString, double> avghum;
    QMap<QString, double> avgsoilhum;
    QMap<QString, double> airqualityHistory;
    QMap<QString, double> airpressureHistory;





public:
    explicit WeatherDataService(QObject *parent = nullptr);

    Q_INVOKABLE QVariantMap getMaxTemp() {
            QVariantMap rval;
            foreach (QString key, maxtmp.keys()) {
                rval[key] = maxtmp[key];
            }
            return rval;
        }

    Q_INVOKABLE QVariantMap getAvgTemp() {
            QVariantMap rval;
            foreach (QString key, avgtmp.keys()) {
                rval[key] = avgtmp[key];
            }
            return rval;
        }

    Q_INVOKABLE QVariantMap getMinTemp() {
            QVariantMap rval;
            foreach (QString key, mintmp.keys()) {
                rval[key] = mintmp[key];
            }
            return rval;
        }

    Q_INVOKABLE QVariantMap getAvgHum() {
            QVariantMap rval;
            foreach (QString key, avghum.keys()) {
                rval[key] = avghum[key];
            }
            return rval;
        }

    Q_INVOKABLE QVariantMap getAirqualityHistory() {
            QVariantMap rval;
            foreach (QString key, airqualityHistory.keys()) {
                rval[key] = airqualityHistory[key];
            }
            return rval;
        }

    Q_INVOKABLE QVariantMap getAirpressureHistory() {
            QVariantMap rval;
            foreach (QString key, airpressureHistory.keys()) {
                rval[key] = airpressureHistory[key];
            }
            return rval;
        }


    Q_INVOKABLE QVariantMap getAvgSoilHum() {
            QVariantMap rval;
            foreach (QString key, avgsoilhum.keys()) {
                rval[key] = avgsoilhum[key];
            }
            return rval;
        }

    Q_INVOKABLE QVariant sunrise() {
            QVariant rval(sunr);
            return rval;
        }

    Q_INVOKABLE QVariant sunset() {
            QVariant rval(suns);
            return rval;
        }


    double temperature() const;
    void temperature(double t);

    double humidity() const;
    void humidity(double h);

    double soilhumidity() const;
    void soilhumidity(double h);

    double airpressure() const;
    void airpressure(double h);

    double airquality() const;
    void airquality(double h);

    QString daytime() const;
    void daytime(QString t);

    QString sunrise() const;
    void sunrise(QString s);

    QString sunset() const;
    void sunset(QString s);

    void addMaxTemp(QString date, double tmp);
    void clearMaxTemp();

    void addAvgTemp(QString date, double tmp);
    void clearAvgTemp();

    void addMinTemp(QString date, double tmp);
    void clearMinTemp();

    void addAvgHum(QString date, double hum);
    void clearAvgHum();

    void addAvgSoilHum(QString date, double hum);
    void clearAvgSoilHum();

    void addAirqualityHistory(QString date, double v);
    void clearAirqualityHistory();

    void addAirpressureHistory(QString date, double v);
    void clearAirpressureHistory();


signals:
    void fetchedData();

public slots:
    void fetchData(QString ip);
    void onfinish(QNetworkReply *rep);


};


