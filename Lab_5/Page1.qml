import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: 300

        ListModel {
            id: model;

            ListElement { name: "White"; text_color: "black" }
            ListElement { name: "Black"; text_color: "white" }
            ListElement { name: "Blue"; text_color: "white" }
        }

        ListView {
            model: model;
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
                color: name
                border.width: 1
                Text {
                    text: name
                    color: text_color
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
