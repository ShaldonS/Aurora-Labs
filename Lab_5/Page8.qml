import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    Item {
        id: task_1
        width: parent.width
        height: 300


        ConfigurationGroup {
            id: conf_group
            path: "/path"
        }

        Column {
            width: 500
            height: 300
            Row {
                width: 500
                height: 150
                TextField {
                    id: text_field
                    width: parent.width
                    height: parent.height
                    placeholderText: "Enter text"
                    color: "black"
                }
                Button {
                    text: "Save"
                    onClicked: {
                        var key = text_field.text;
                        conf_group.setValue("key1", key);
                        console.log(conf_group.value("key1") + " " + key)
                    }
                }
            }
            Row {
                width: 500
                height: 100
                TextSwitch {
                    id: text_switch
                    text: "Active"
                    description: "Description"
                    onCheckedChanged: {
                        var key = text_switch.checked ? "/On" : "/Off"
                        conf_group.setValue("key2", key);
                        console.log(conf_group.value("key2") + " " + key)
                    }
                }
            }
        }

    }
}
