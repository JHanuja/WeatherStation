#pragma once
#include <QObject>



class Data : public QObject
{
    Q_OBJECT
public:
    int i;
    explicit Data(QObject *parent = nullptr);


};

