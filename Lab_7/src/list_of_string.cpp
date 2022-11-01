#include "list_of_string.h"
#include<QDebug>

list_of_string::list_of_string() {
    size_of_last = 0;
}

void list_of_string::addString(QString str) {
    if(list.size() == 0) {
        str.replace(0, 1, str[0].toUpper());
    }
    else {
        str.push_front(", ");
    }
    list.append(str);
    allStrings += str;
    size_of_last = str.size();
}

void list_of_string::popList() {
    list.pop_back();
    qDebug() << "Size: " << list.size();
    allStrings.remove(allStrings.size()-size_of_last, size_of_last);
    //allStrings = "";
    /*for(int i = 0; i < list.size(); ++i) {
        allStrings += list.takeFirst();
        qDebug() << "Append: " << list.takeFirst();
    }*/
}

QString list_of_string::getAllStrings() {
    return allStrings;
}
