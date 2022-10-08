import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    Item {
        id: task_2
        width: parent.width
        height: parent.height

        ListModel {
            id: list_model;
            /*ListElement { name: "Element 1"; }
            ListElement { name: "Element 2"; }
            ListElement { name: "Element 3"; }*/
        }

        SilicaListView  {
            id: list
            anchors.top: parent.top
            anchors.topMargin: 200
            model: list_model;
            delegate: component;
            width: parent.width
            height: parent.height
            orientation:  Qt.Vertical
        }

        Component {
            id: component;

            Rectangle {
                width: task_2.width
                height: 120
                border.width: 1
                Text {
                    text: name
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        list_model.remove(model.index)
                    }
                }
            }
        }


        Column {
            width: 500
            height: 300
            Row {
                width: 500
                height: 150
                TextField {
                    id: text_field
                    width: parent.width
                    height: parent.height
                    placeholderText: "Enter text"
                    color: "black"
                }
                Button {
                    text: "Add"
                    onClicked: {

                        var str = text_field.text
                        task_2.put(str)

                        list_model.append(str)
                        list.height+= 100
                    }
                }
            }
        }



        function open_db() {
            var database = LocalStorage.openDatabaseSync("NotesDB", "1.0")
            database.transaction(
                        function(tx) {
                            tx.executeSql("CREATE TABLE IF NOT EXISTS TransactionsTable(
                                id INTEGER PRIMARY KEY AUTOINCREMENT,
                                note_text TEXT");
                        }
                        )
        }

        function put(note_text) {
            var database = LocalStorage.openDatabaseSync("NotesDB", "1.0")
               database.transaction(function(tx) {
                   tx.executeSql("INSERT INTO TransactionsTable(note_text) VALUES(?)", [note_text]);
               });
        }

        function get(id, callback) {
               var database = LocalStorage.openDatabaseSync("NotesDB", "1.0");
               database.readTransaction(function(tx) {
                   var result = tx.executeSql("SELECT * FROM TransactionsTable WHERE id = ? ORDER BY id ASC", [id]);
                   callback(result.rows)
               });
        }

        Component.onCompleted: {
            task_2.open_db();
            task_2.put("Element 1")
            task_2.put("Element 2")
            task_2.put("Element 3")
            list_model.append(task_2.get(0))
            list_model.append(task_2.get(1))
            list_model.append(task_2.get(2))
        }

    }
}
