import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

     Image {
        x:200;
        id: image1;
        source: "https://art.pixilart.com/66094e826e621be.png";
        visible: false
    }

     Column {
         id: col;
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.top: sequence.bottom
         anchors.topMargin: 100
         Row {
             anchors.horizontalCenter: parent.horizontalCenter
             Button {
                 text: "↑"
                 width: 40
                 onClicked: {
                     sequence.y+=5;
                     sequence.jumpTo("up");
                     sequence.running = true;

                 }
             }
         }
         Row {
             Button {
                 text: "<"
                 width: 40
                 onClicked: {
                     sequence.x-=5;
                     sequence.jumpTo("left");
                     sequence.running = true;
                 }
             }
             Button {
                 text: "↓"
                 width: 40
                 onClicked: {
                     sequence.y-=5;
                     sequence.jumpTo("down");
                     sequence.running = true;
                 }
             }
             Button {
                 text: ">"
                 width: 40
                 onClicked: {
                     sequence.x+=5;
                     sequence.jumpTo("right");
                     sequence.running = true;
                 }
             }
         }
     }

     SpriteSequence {
         anchors.centerIn: parent
         id: sequence;
         width: 50;
         height: 100;
         //interpolate: false;
         running: false;
         sprites: [
             Sprite {
                 name: "down";
                 source: image1.source;
                 frameCount: 4;
                 frameWidth: image1.width/4;
                 frameHeight: image1.height/4;
                 frameRate: 10;
             },
             Sprite {
                 name: "up";
                 source: image1.source;
                 frameCount: 4;
                 frameY: image1.height/4;
                 frameWidth: image1.width/4;
                 frameHeight: image1.height/4;
                 frameRate: 10;
             },
             Sprite {
                 name: "left";
                 source: image1.source;
                 frameCount: 4;
                 frameY: image1.height/4*2;
                 frameWidth: image1.width/4;
                 frameHeight: image1.height/4;
                 frameRate: 10;
             },
             Sprite {
                 name: "right";
                 source: image1.source;
                 frameCount: 4;
                 frameY: image1.height/4*3;
                 frameWidth: image1.width/4;
                 frameHeight: image1.height/4;
                 frameRate: 10;
             }
         ]
     }
     focus: true;
}
