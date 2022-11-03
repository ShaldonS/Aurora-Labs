import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Particles 2.0

Page {
    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        color: "black"

        ParticleSystem {
            anchors.fill: parent

            ItemParticle {
                system: particleSystem
                delegate: Rectangle {
                    id: particleRect
                    width: 5
                    height: 5
                    color: "white"
                    radius: 100
                }
            }

            Emitter {
                height: 10; width: 10
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                velocity : AngleDirection { angle: 270; angleVariation: 10; magnitude: 100}
                lifeSpan: 15000
                sizeVariation: 5
                emitRate: 100
            }

            Gravity {
               anchors.fill: parent
               angle: 90
               acceleration: 15
            }
        }
    }
}
