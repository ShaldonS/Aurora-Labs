import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: 300

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            id:sonwindow1
            width: 100
            height:300

            Signal {
                id:circle_red
                x:5
                y:5
                color: "red"
            }
            Signal {
                id:circle_yellow
                x:5
                y:105
            }
            Signal {
                id:circle_green
                x:5
                y:205
            }

            Component.onCompleted: {anim.running = true;}

            SequentialAnimation {
                id: anim

                onStopped: {running = true;}

                PropertyAnimation {target: circle_red; property: "color"; to: "black"; duration: 1500}
                PropertyAnimation {target: circle_green; property: "color"; to: "green"; duration: 1500}
                PropertyAnimation {target: circle_green; property: "color"; to: "black"; duration: 1500}
                PropertyAnimation {target: circle_yellow; property: "color"; to: "yellow"; duration: 1500}
                PropertyAnimation {target: circle_yellow; property: "color"; to: "black"; duration: 1500}
                PropertyAnimation {target: circle_red; property: "color"; to: "red"; duration: 1500}
            }


        }
    }
}
