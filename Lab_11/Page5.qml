import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    Item {
        width: 400;
        height: 300;

        Text {
             text: "Click Me!";
             font.pointSize: 24;
             width: 150; height: 50;

             Audio {
                 id: playMusic
                 source: "music.wav"
             }
             MouseArea {
                 id: playArea
                 anchors.fill: parent
                 onPressed:  { playMusic.play() }
             }
         }
    }
}
