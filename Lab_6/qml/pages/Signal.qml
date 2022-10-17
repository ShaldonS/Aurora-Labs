import QtQuick 2.0

Rectangle {
    id: root

    property int _x: 0
    property int _y: 0
    property string color : "black"

    Item {
        Rectangle{
            width: 90
            height:90
            x:root._x
            y:root._y
            radius: 100
            color: root.color
        }
    }
}
