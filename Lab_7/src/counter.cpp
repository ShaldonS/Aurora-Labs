#include "counter.h"
#include<QDebug>

MyClass::MyClass() : QObject() {
    cnt=0;
}

QString MyClass::getText() {
   return text;
}

void MyClass::setText(QString &newText) {
   text = newText;
}

void MyClass::printText() {
   qDebug() << text;
}



void MyClass::increaseCnt() {
    cnt++;
}

void MyClass::resetCnt() {
    cnt=0;
}


void MyClass::printCnt() {
   qDebug() << "Counter: " << cnt;
}

int MyClass::getCnt() {
   return cnt;
}
