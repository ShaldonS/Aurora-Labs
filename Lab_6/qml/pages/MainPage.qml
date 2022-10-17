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
    }
}
