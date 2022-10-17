import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: 300

        /*Timer{
             id:statechange
             interval: 300
             running:trues
             repeat:true
             onTriggered:
             {
                 sonwindow1.aNumber++
                 if(sonwindow1.aNumber>10) sonwindow1.aNumber = 0
                 switch(sonwindow1.aNumber%10)
                 {
                 case 0:
                     sonwindow1.state = "go";
                     break;
                 case 4:
                     sonwindow1.state = "wait";
                     break;
                 case 6:
                     sonwindow1.state = "stop";
                     break;
                 }
             }

         }

        Component.onCompleted: {statechange.start()}*/

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            id:sonwindow1
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

            // This animation specifically targets the Rectangle's properties to animate
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

            /*states: [
                State {
                    name: "stop"
                    PropertyChanges {
                        target: circle_red
                        color:"red"
                    }
                    PropertyChanges {
                        target: circle_green
                        color:"black"
                    }

                    PropertyChanges {
                        target: circle_yellow
                        color:"black"
                    }

                },
                State {
                    name: "wait"
                    PropertyChanges {
                        target: circle_yellow
                        color:"yellow"
                    }
                    PropertyChanges {
                        target: circle_green
                        color:"black"
                    }

                    PropertyChanges {
                        target: circle_red
                        color:"black"
                    }
                },
                State {
                    name: "go"

                    PropertyChanges {
                        target: circle_yellow
                        color:"black"
                    }
                    PropertyChanges {
                        target: circle_green
                        color:"green"
                    }
                    PropertyChanges {
                        target: circle_red
                        color:"black"
                    }
                }
            ]

            transitions: [

                Transition {
                    from: "stop"
                    to: "go"
                    reversible: true
                    PropertyAnimation{
                        target: circle_red |circle_green
                        properties: "color";
                        duration: 500

                    }
                },
                Transition {
                    reversible: true
                    from: "go"
                    to: "wait"
                    PropertyAnimation{
                        target: circle_green|circle_yellow
                        properties: "color"
                        duration: 200
                    }
                },
                Transition {
                    reversible: true
                    from: "stop"
                    to: "wait"
                    PropertyAnimation{
                        target: circle_green|circle_yellow
                        properties: "color"
                        duration: 500
                    }
                }

            ]*/

        }
    }
}
