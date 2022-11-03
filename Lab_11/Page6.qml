import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    Button {
        id: btn
        text: "Play"
        onClicked: {
            video.play()
        }
    }

    Video {
        anchors.top: btn.bottom
        id: video
        width : 800
        height : 600
        source: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.ogv"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                video.play()
            }
        }

        //focus: true
        Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        Keys.onLeftPressed: video.seek(video.position - 5000)
        Keys.onRightPressed: video.seek(video.position + 5000)
    }
}

