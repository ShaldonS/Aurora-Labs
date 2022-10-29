import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Column {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Row {
                Button {
                    text: "Task 1"
                    onClicked: {
                        pageStack.push(Qt.resolvedUrl("Task_1.qml"))
                    }
                }
            }
            Row {
                Button {
                    text: "Task 2"
                    onClicked: {
                        pageStack.push(Qt.resolvedUrl("Task_2.qml"))
                    }
                }
            }
            Row {
                Button {
                    text: "Task 3"
                    onClicked: {
                        pageStack.push(Qt.resolvedUrl("Task_3.qml"))
                    }
                }
            }

        }
}
