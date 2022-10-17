import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: parent.height

        Text {
            id: text_field
            text: "Hello there"
            anchors.horizontalCenter: parent.horizontalCenter
            color: "blue"

            ParallelAnimation {

                id: text_anim
                NumberAnimation {
                    target: text_field
                    property: "y"
                    to: 600
                    duration: 1000
                }
                PropertyAnimation {
                    target: text_field
                    property: "color"
                    to: "green"
                    duration: 1000
                }
                RotationAnimation {
                    target: text_field
                    from: 0
                    to: 180
                    duration: 1000
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    text_anim.running = true;
                }
            }
        }
    }
}
