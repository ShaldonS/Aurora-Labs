import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All
    property int count_num: 0
    PageHeader {
        objectName: "pageHeader"
        Rectangle {
            id: label_rect
            height: 50
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                leftMargin: 350;
            }

            Label {
                text: count_num
            }
        }
        Rectangle {
            id: button_rect
            anchors {
                top: label_rect.bottom
                bottom: parent.bottom
                left: parent.left
                right: parent.right
                leftMargin: 200;
            }

            Button {
                text: "Increase"
                onClicked: {
                    count_num++;
                }
            }
        }
    }
}
