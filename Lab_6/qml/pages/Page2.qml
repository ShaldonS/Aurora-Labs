
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Item {
        id: task_1
        width: parent.width
        height: 300

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            id: rectangles
            width: 100
            height:300
            property int aNumber: 0
            Rectangle{
                id:circle_red
                x:5;y:5
                width: 90;height:90
                radius: 100
                color: "red"
            }
            Rectangle{
                id:circle_yellow
                x:5;y:radius+5
                width: 90;height:90
                radius: 100
                color: "black"
            }
            Rectangle{
                id:circle_green
                x:5;y:radius*2+5
                width: 90;height:90
                radius: 100
                color: "black"
            }

            Component.onCompleted: {anim.running = true;}

            SequentialAnimation {
                id: anim

                onStopped: {running = true;}

                PropertyAnimation {target: circle_red; property: "color"; to: "black"; duration: 1500}
                ParallelAnimation {
                    NumberAnimation {
                        id: human_anim
                        target: human_icon
                        property: "x"
                        from: 0;
                        to: parent.width
                        duration: black_to_green.duration
                    }
                    PropertyAnimation {id: black_to_green; target: circle_green; property: "color"; to: "green"; duration: 2000}
                }

                PropertyAnimation {target: circle_green; property: "color"; to: "black"; duration: 1500}
                PropertyAnimation {target: circle_yellow; property: "color"; to: "yellow"; duration: 1500}
                PropertyAnimation {target: circle_yellow; property: "color"; to: "black"; duration: 1500}
                PropertyAnimation {target: circle_red; property: "color"; to: "red"; duration: 1500}
            }
        }
        IconButton {
            id: human_icon
            anchors.top: rectangles.bottom
            icon.source: "image://theme/icon-m-people?"
        }
    }
}
