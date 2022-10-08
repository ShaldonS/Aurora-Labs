import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: parent.height

        XmlListModel {
            id: xmlModel
            source: "http://www.cbr.ru/scripts/XML_daily.asp"
            query: "/ValCurs/Valute"

            XmlRole { name: "Name"; query: "string()" }
            XmlRole { name: "Value"; query: "string()" }
        }

        ListView {
             width: 180; height: parent.height
             model: xmlModel
             delegate: Text { text: Name + ": " + Value }
         }
    }
}
