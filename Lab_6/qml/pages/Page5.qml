import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: 300

        MyComponent {
            id: comp
            _color: "green"
            Text { text: "There";}
            //some_text: Text { text: "world!" }
        }

    }
}
