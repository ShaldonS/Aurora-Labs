import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Item {
        id: task_2
        width: parent.width
        height: parent.height
        property int elem_num: 4
        property bool last_elem: false

        ListModel {
            id: list_model;
            ListElement { name: "Element 1"; }
            ListElement { name: "Element 2"; }
            ListElement { name: "Element 3"; }
        }

        Button {
            id: btn_add
            text: "Add"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var str = ""
                var str2 = "Element " + task_2.elem_num
                var num = task_2.elem_num

                if((task_2.elem_num < list_model.count) &&
                        (!(list_model.get(task_2.elem_num-1).name === str2) ) ) {
                    str = "Element " + task_2.elem_num
                    num--;
                }
                else {
                    str = "Element " + (list_model.count+1)
                    num = list_model.count
                }

                list_model.insert(num, {"name": str})
                list.height+= 100
                task_2.elem_num++
                task_2.last_elem
            }
        }

        SilicaListView  {
            id: list
            anchors.top: parent.top
            anchors.topMargin: 100
            model: list_model;
            delegate: component;
            width: parent.width
            height: parent.height
            orientation:  Qt.Vertical
        }

        Component {
            id: component;

            Rectangle {
                width: task_2.width
                height: 120
                border.width: 1
                Text {
                    text: name
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        task_2.elem_num = model.index+1
                        list_model.remove(model.index)
                        console.log("index " + task_2.elem_num )
                    }
                }
            }
        }
    }
}
