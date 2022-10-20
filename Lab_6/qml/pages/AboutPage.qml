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
        }

        ConfigurationValue {
            id: cnt_pop
            key: "cnt_pop"
        }

        ConfigurationGroup {
            id: conf_group
            path: "/path"
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
                       var key = conf_group.value("push") + 1;
                       conf_group.setValue("push", key);
                       var push_val = conf_group.value("push")
                       var pop_val = conf_group.value("pop")
                       task_7.pageStack(push_val, pop_val)
                   }
               }
            }
            Row {
               Button {
                   id: btn_pop
                   text: "Pop"
                   onClicked: {
                       pageStack.pop(pageStack.current_page)
                       var key = conf_group.value("pop") + 1;
                       var key_log = conf_group.value("pop")
                       if(!key_log) {
                           console.log("Hello")
                       }

                       conf_group.setValue("pop", key);
                       var push_val = conf_group.value("push")
                       var pop_val = conf_group.value("pop")
                       task_7.pageStack(push_val, pop_val)
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
