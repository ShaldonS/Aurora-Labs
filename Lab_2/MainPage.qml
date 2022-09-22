import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All
    property int count_num: 0
    PageHeader {
        objectName: "pageHeader"
        //Column {
            /*Row {
                Label {
                    text: count_num
                }
            }
            Row {
                Button {
                    text: "Increase"
                    onClicked: {
                        count_num++;
                    }
                }
            }*/
            /*Canvas {
                id: root
                width: 600; height: 600
                onPaint: {

                    var green = getContext("2d")
                    green.fillStyle = "green";
                    green.beginPath()
                    green.rect(200, 100, 200, 200)
                    green.fillRect(200, 100, 200, 200);
                    green.closePath()

                    var blue = getContext("2d")
                    blue.fillStyle = "blue";
                    blue.beginPath()
                    blue.rect(300, 0, 200, 200)
                    blue.fillRect(300, 0, 200, 200);
                    blue.textAlign = "center"
                    blue.fillStyle = "white";
                    blue.font = "bold 20px sans-serif";
                    blue.fillText("Квадрат", 400, 100)
                    blue.closePath()

                    var red = getContext("2d")
                    red.fillStyle = "red";
                    red.beginPath()
                    red.rect(0, 0, 200, 200)
                    red.fillRect(0, 0, 200, 200);
                    red.closePath()

                }
            }*/
            /*Column {
                Row {
                    Canvas {
                        width: 600; height: 210
                        onPaint: {

                            var green = getContext("2d")
                            green.fillStyle = "green";
                            green.beginPath()
                            green.rect(210, 0, 200, 200)
                            green.fillRect(210, 0, 200, 200);
                            green.closePath()

                            var blue = getContext("2d")
                            blue.fillStyle = "blue";
                            blue.beginPath()
                            blue.rect(420, 0, 200, 200)
                            blue.fillRect(420, 0, 200, 200);
                            blue.closePath()

                            var red = getContext("2d")
                            red.fillStyle = "red";
                            red.beginPath()
                            red.rect(0, 0, 200, 200)
                            red.fillRect(0, 0, 200, 200);
                            red.closePath()

                        }
                    }
                }
                Row {
                    Canvas {
                        width: 600; height: 210
                        onPaint: {

                            var blue = getContext("2d")
                            blue.fillStyle = "black";
                            blue.beginPath()
                            blue.rect(420, 0, 200, 200)
                            blue.fillRect(420, 0, 200, 200);
                            blue.closePath()

                            var red = getContext("2d")
                            red.fillStyle = "pink";
                            red.beginPath()
                            red.rect(0, 0, 200, 200)
                            red.fillRect(0, 0, 200, 200);
                            red.closePath()

                        }
                    }
                }
            }*/
            /*Grid {
                columns: 3
                rows: 2
                spacing: 40
                Rectangle { color: "red"; width: 200; height: 200;  }
                Rectangle { color: "green"; width: 200; height: 200 }
                Rectangle { color: "blue"; width: 200; height: 200 }
            }
            Grid {
                columns: 3
                spacing: 280
                Rectangle { color: "pink"; width: 200; height: 200; }
                Rectangle { color: "black"; width: 200; height: 200;}
            }*/
            /*Grid {
                columns: 2
                spacing: 20
                Rectangle { color: "black"; width: 300; height: 300}
                Rectangle {
                    color: "black"; width: 300; height: 300
                    transform: [
                        Translate {
                            y: 250
                            x: -100
                        },
                        Scale {
                            origin.x: 200;
                            origin.y: 100;
                            xScale: 1
                            yScale: 0.5
                        },
                        Rotation {
                            origin.x: 25;
                            origin.y: 25;
                            angle: -45
                        }
                    ]
                }
            }*/
            /*Rectangle {
                property int size: 300
                id: rect
                color: "black";
                width: size;
                height: size;


                ParallelAnimation {
                    running: true
                    NumberAnimation { target: rect; property: "y"; to: 300; duration: 1000 }
                    NumberAnimation { target: rect; property: "size"; to: 400; duration: 1000 }
                }
            }*/

        //}
    }
    Item {
        Button {
            text: "Push me"
            onClicked: {dialog.open()}
        }
        Dialog {
           id: dialog
           Column {
               anchors.fill: parent
               width: parent.width
               //spacing: Theme.paddingMedium
               DialogHeader { }
               Row {
                   width: parent.width
                   height: 200
                   TextField {
                       id: textField1
                       width: parent.width/2
                   }
                   TextField {
                       id: textField2
                       width: parent.width/2
                   }
               }
           }
           onAccepted: {
               var num1, num2;
               num1 = parseInt(textField1.text.toString());
               num2 = parseInt(textField2.text.toString());
               var sum = num1+num2;
               console.log("Sum is " + sum);
           }
        }
    }
}
