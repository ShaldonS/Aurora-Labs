#ifndef LIST_OF_STRING_H
#define LIST_OF_STRING_H
#include <QObject>

class list_of_string : public QObject {
   Q_OBJECT
   //Q_PROPERTY(QString text READ getText WRITE setText NOTIFY textChanged)
   Q_PROPERTY(QList<QString> list STORED true USER true)
private:
   QList<QString> list;
   //QString text;
   QString allStrings;
   int size_of_last;
public:
   list_of_string();
   //QString getText();
   //void setText(QString &newText);
  // Q_INVOKABLE void printText();

   Q_INVOKABLE void addString(QString str);

   Q_INVOKABLE void popList();

   //Q_INVOKABLE QString getLastOfList();

   Q_INVOKABLE QString getAllStrings();
private slots:
signals:
   void textChanged();
};

#endif // LIST_OF_STRING_H

