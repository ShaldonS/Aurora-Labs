import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    Item {
        id: task_7
        width: parent.width
        height: 300

        ConfigurationValue {
            id: cnt_push
            key: "cnt_push"
            value : 0
        }

        ConfigurationValue {
            id: cnt_pop
            key: "cnt_pop"
            value : 0
        }

        signal pageStack(int cnt_push, int cnt_pop)

        onPageStack: {
            console.log("Push: ", cnt_push)
            console.log("Pop: ", cnt_pop)
        }

        Column {
            Row {
               Button {
                   id: btn_push
                   text: "Push"
                   onClicked: {
                       pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                       var val = cnt_push.value + 1;
                       cnt_push.value = val;
                       task_7.pageStack(cnt_push.value, cnt_pop.value)
                   }
               }
            }
            Row {
               Button {
                   id: btn_pop
                   text: "Pop"
                   onClicked: {
                       pageStack.pop(pageStack.current_page)
                       var val = cnt_pop.value + 1;
                       cnt_pop.value = val;
                       task_7.pageStack(cnt_push.value, cnt_pop.value)
                   }
               }
            }
        }
        Component.onCompleted: {
            btn_push.clicked.connect(pageStack)
            btn_pop.clicked.connect(pageStack)
        }
    }
}
