#include "data.h"
#include <QObject>


Data::Data(QObject *parent)
    : QObject{parent}
{
   i = 10;
}
