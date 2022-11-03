
import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Particles 2.0

/*Page {

    Rectangle {
        id: root
        width: 360
        height: 600
        color: "black"

        ParticleSystem {
            id: particlesSystem
        }

        ItemParticle {
            system: particlesSystem
            delegate: Rectangle {
                id: particleRect
                width: 5
                height: 5
                color: "white"
                radius: 100
            }
            groups: ["A"]
        }

        ItemParticle {
            system: particlesSystem
            delegate: Rectangle {
                id: particleRect1
                width: 5
                height: 5
                color: "red"
                radius: 100
            }
            groups: ["B"]
        }

        ItemParticle {
            system: particlesSystem
            delegate: Rectangle {
                id: particleRect2
                width: 5
                height: 5
                color: "green"
                radius: 100
            }
            groups: ["C"]
        }


        Emitter {
            id: fireWorkEmitter
            system: particlesSystem
            enabled: true
            lifeSpan: 1600
            maximumEmitted: 6
            group: "A"
            anchors{
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            velocity:  AngleDirection {
                angle: 270
                angleVariation: 10
                magnitude: 200
            }

            GroupGoal {
                groups: ["A"]
                goalState: "exploding"
                system: particlesSystem
                y: - root.height / 2
                width: parent.width
                height: 75
                jump: true
            }
        }

        TrailEmitter {
            system: particlesSystem
            group: "B"
            follow: "A"
            size: 12
            emitRatePerParticle: 80
            velocity: PointDirection {yVariation: 10; xVariation: 10}
            acceleration: PointDirection {y:  10}
        }

        ParticleGroup {
            name: "exploding"
            duration: 500
            system: particlesSystem

            TrailEmitter {
                group: "C"
                enabled: true
                anchors.fill: parent
                lifeSpan: 1000
                emitRatePerParticle: 350
                size: 10
                velocity: AngleDirection {angleVariation: 360; magnitude: 100}
                acceleration: PointDirection {y:  20}
            }
        }
    }
}*/

Page {
    /*
    Rectangle {
        id: rect
        width: parent.width
        height: parent.height
        color: "black"


        MouseArea {
            anchors.fill: parent
            onClicked: {
                //emitter.x = mouseX
                //emitter.y = mouseY
            }
        }

        ParticleSystem {
            id: particleSystem
        }

        /mitter {
            id: emitter
            anchors.centerIn: parent
            width: 100//parent.width
            height: 100//parent.height
            system: particleSystem
            lifeSpan: 1500
            maximumEmitted: 1
            emitRate: 1
        }

        ItemParticle {
            system: particleSystem
            delegate: Rectangle {
                id: particleRect
                width: 20
                height: 20
                color: "transparent"
                radius: 100
                border.width: 2
                border.color: "white"
                ParallelAnimation {
                    id: anim
                    running: true

                    NumberAnimation { target: particleRect; property: "width"; to: 200; duration: 1500 }
                    NumberAnimation { target: particleRect; property: "height"; to: 200; duration: 1500 }
                }
            }
        }
    }*/
    Rectangle {
        id: root
        color: "black"
        width: parent.width
        height: parent.height
        ParticleSystem {
            id: sys
        }

        ItemParticle {
            system: sys
            delegate: Rectangle {
                id: particleRect
                width: 20
                height: 20
                color: "transparent"
                radius: 100
                border.width: 2
                border.color: "white"
                ParallelAnimation {
                    id: anim
                    running: true

                    NumberAnimation { target: particleRect; property: "width"; to: 200; duration: 1500 }
                    NumberAnimation { target: particleRect; property: "height"; to: 200; duration: 1500 }
                }
            }
        }

        Component {
            id: emitterComp
            Emitter {
                id: container
                Emitter {
                    id: emitMore
                    system: sys
                    emitRate: 1
                    lifeSpan: 1000
                }

                Timer {
                    interval: 1000
                    running: true
                    onTriggered: container.destroy();
                }
            }
        }

        function customEmit(x,y) {
            var obj = emitterComp.createObject(root);
            obj.x = x
            obj.y = y
            obj.emitRate = 1;
        }

        /*Timer {
            interval: 10000
            triggeredOnStart: true
            running: true
            repeat: true
            onTriggered: customEmit(Math.random() * 320, Math.random() * 480)
        }*/
        MouseArea {
            anchors.fill: parent
            onClicked: root.customEmit(mouse.x, mouse.y);
        }

    }
}
