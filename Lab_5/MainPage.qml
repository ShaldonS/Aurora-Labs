import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    /*Item {
        id: task_1
        width: 500
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
                x: 100
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
    }*/

    Column {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Row {
            Button {
                text: "Task 1"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Page1.qml"))
                }
            }
        }
        Row {
            Button {
                text: "Task 2"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Page2.qml"))
                }
            }
        }
        Row {
            Button {
                text: "Task 3"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Page3.qml"))
                }
            }
        }
        Row {
            Button {
                text: "Task 4"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Page4.qml"))
                }
            }
        }
        Row {
            Button {
                text: "Task 5"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Page5.qml"))
                }
            }
        }
        Row {
            Button {
                text: "Task 6"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Page6.qml"))
                }
            }
        }
        Row {
            Button {
                text: "Task 7"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Page7.qml"))
                }
            }
        }
        Row {
            Button {
                text: "Task 8"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Page8.qml"))
                }
            }
        }
    }


}
