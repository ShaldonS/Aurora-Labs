/*import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    Item {
        id: task_2
        width: parent.width
        height: parent.height

        property var database
        property int id_last_elem: 1

        ListModel {
            id: list_model;
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
                        if (model.index < list_model.count)
                            task_2.id_last_elem = model.index;
                        else task_2.id_last_elem--;
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

                        task_2.id_last_elem++;
                    }
                }
            }
        }



        function open_db() {
            database = LocalStorage.openDatabaseSync("NotesDB", "1.0");
            database.transaction(
                        function(tx) {
                            tx.executeSql("CREATE TABLE IF NOT EXISTS TransactionsTable(
                                id INTEGER PRIMARY KEY AUTOINCREMENT,
                                note_text TEXT)");
                        }
                        )
        }

        function put(note_text) {
               database.transaction(function(tx) {
                   tx.executeSql("INSERT INTO TransactionsTable(note_text) VALUES(?)", [note_text]);
               });
        }

        function get(id, callback) {
            var result;
               database.readTransaction(function(tx) {
                   result = tx.executeSql("SELECT * FROM TransactionsTable WHERE id = ?", [id]);
               });
            return result.rows[id-1].note_text;
        }

        Component.onCompleted: {
            open_db();
            put("Element 1")
            put("Element 2")
            put("Element 3")

            list_model.append({"name":get(1)})
            id_last_elem++;
            list_model.append({"name":get(2)})

        }

    }
}*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    id: task_2
    property var database

    Component.onCompleted: {
        database = LocalStorage.openDatabaseSync("notesDB", "1.0")
        database.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS notesDB
                           (id INTEGER PRIMARY KEY AUTOINCREMENT,
                            note_text TEXT)");
        })
        updateList();
    }

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
                    put(text_field.text)
                    updateList()
                }
            }
        }

        SilicaListView  {
            id: list
            anchors.top: parent.top
            anchors.topMargin: 200
            model: ListModel { id: list_model; }
            delegate: Rectangle {
                width: task_2.width
                height: 120
                border.width: 1
                Text {
                    text: note
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        del(model.id)
                        updateList()
                    }
                }
            }
            width: parent.width
            height: parent.height
            orientation:  Qt.Vertical
        }

        function put(note_text) {
               database.transaction(function(tx) {
                   tx.executeSql("INSERT INTO notesDB (note_text) VALUES(?)", [note_text]);
               });
        }

        function del(id) {
            database.transaction(function(tx){
                tx.executeSql("DELETE FROM notesDB WHERE id = ?", [id]);
            });
        }

        function get(callback) {
               database.readTransaction(function(tx) {
                   var result = tx.executeSql("SELECT * FROM notesDB");
                   callback(result.rows)
               });
        }

        function updateList() {
            list_model.clear();
            get(function(notes) {
                for (var i = 0; i < notes.length; i++) {
                    var note = notes.item(i);
                    list_model.append({ id: note.id, note: note.note_text });
                }
            });
        }

}

