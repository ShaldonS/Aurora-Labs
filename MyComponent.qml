import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: root
    default property var some_text
    property string _color

    Button {
        text: "Hello" + some_text.text;
        color: _color
    }
}
