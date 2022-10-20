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
                       var key = 1;//cnt_push.value + 1;
                       //cnt_push.value = val;
                       conf_group.setValue("push", key);
                       conf_group.setValue("pop", 0);
                       task_7.pageStack(conf_group.value("push"), cnt_pop.value("pop"))
                   }
               }
            }
            /*Row {
               Button {
                   id: btn_pop
                   text: "Pop"
                   onClicked: {
                       pageStack.pop(pageStack.current_page)
                       var key = 1;//cnt_pop.value + 1;
                       //cnt_pop.value = val;
                       conf_group.setValue("pop", key);
                       task_7.pageStack(conf_group.value("push"), cnt_pop.value("pop"))
                   }
               }
            }*/
        }
        Component.onCompleted: {
            btn_push.clicked.connect(pageStack)
            btn_pop.clicked.connect(pageStack)
        }
    }
}
