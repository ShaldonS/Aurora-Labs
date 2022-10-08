import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: 300

        property var array: [{ name: "White", text_color: "black" },
            { name: "Black", text_color: "white" },
            { name: "Blue", text_color: "white" }]

        ListModel {
            id: model;

            ListElement { name: "White"; text_color: "black" }
            ListElement { name: "Black"; text_color: "white" }
            ListElement { name: "Blue"; text_color: "white" }
        }

        ListView {
            model: task_1.array;
            delegate: component;
            width: parent.width
            height: parent.height
            orientation:  Qt.Vertical
        }

        Component {
            id: component;

            Rectangle {
                width: task_1.width
                height: 120
                color: task_1.array[model.index].name
                border.width: 1
                border.color: "black"
                Text {
                    text: task_1.array[model.index].name
                    color: task_1.array[model.index].text_color
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
