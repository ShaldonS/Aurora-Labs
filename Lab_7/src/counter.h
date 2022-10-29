#ifndef COUNTER_H
#define COUNTER_H
#include <QObject>


class MyClass : public QObject {
   Q_OBJECT
   Q_PROPERTY(QString text READ getText WRITE setText NOTIFY textChanged)
private:
   QString text;
   int cnt;
public:
   MyClass();
   QString getText();
   void setText(QString &newText);
   Q_INVOKABLE void printText();

   Q_INVOKABLE void printCnt();
   Q_INVOKABLE void increaseCnt();
   Q_INVOKABLE void resetCnt();
   Q_INVOKABLE int getCnt();
private slots:
signals:
   void textChanged();
};

#endif // COUNTER_H
