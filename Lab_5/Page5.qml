import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: parent.height

        //XMLHttpRequest

        XmlListModel {
            id: xmlModel
            query: "/ValCurs/Valute"

            XmlRole { name: "Name"; query: "Name/string()" }
            XmlRole { name: "Value"; query: "Value/string()" }
        }


        ListView {
             width: 180; height: parent.height
             model: xmlModel
             delegate: Text { text: Name + ": " + Value }
         }

        Component.onCompleted: {
            task_1.getXML()
        }

        function getXML() {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'http://www.cbr.ru/scripts/XML_daily.asp', true);
            xhr.ContentType = "text/xml; charset=windows-1251"
            xhr.send();


            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) xmlModel.xml = xhr.responseText
            }
        }

    }
}
