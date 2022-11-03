import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    Item {
        width: 400;
        height: 300;

        Audio {
            id: player;
            playlist: Playlist {
                id: playlist
                PlaylistItem { source: "C:\Users\eemee\Downloads\song1.mp3"; } //https://www.chosic.com/download-audio/29589/
                PlaylistItem { source: "C:\Users\eemee\Downloads\song2.mp3"; } //https://www.chosic.com/download-audio/24985/
            }
        }

        ListView {
            model: playlist;
            delegate: Text {
                font.pixelSize: 16;
                text: source;
            }
        }

        MouseArea {
            anchors.fill: parent;
            onPressed: {
                if (player.playbackState != Audio.PlayingState) {
                    player.play();
                } else {
                    player.pause();
                }
            }
        }
    }
}
