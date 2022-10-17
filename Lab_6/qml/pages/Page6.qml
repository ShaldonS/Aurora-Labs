import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Item {
        id: task_6
        width: parent.width
        height: 300

        property int hours:0
        property int minutes:0
        property int seconds:0

        property date currentDate: new Date()

        Item {
            Timer {
                id: timer
                interval: 1000; running: false; repeat: true
                onTriggered: {
                    task_6.seconds++;
                    if(task_6.seconds == 60) {
                        task_6.minutes++
                        task_6.seconds = 0
                        if(task_6.minutes == 60) {
                            task_6.hours++;
                            task_6.minutes = 0;
                        }
                    }
                }
            }

            TimerText {
                id: time;
                _text: task_6.hours+":"+task_6.minutes+":"+task_6.seconds
            }

            /*Text {
                id: time;
                text: task_6.hours+":"+task_6.minutes+":"+task_6.seconds
            }*/

            Button {
                anchors.top: time.bottom
                property bool pushed: false
                text: "Start timer"
                onClicked: {
                    if(!pushed) {
                        timer.running = true;
                        pushed = true;
                        text= "Stop timer"
                    }
                    else {
                        timer.running = false;
                        text= "Start timer"
                        pushed = false;
                    }
                }
            }
        }

    }
}
