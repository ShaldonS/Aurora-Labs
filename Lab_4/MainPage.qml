import QtQuick 2.0
import Sailfish.Silica 1.0

/*Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Main Page")
        extraContent.children: [
            Button {
                text: "Start"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    pageStack.push(page_1)//Qt.resolvedUrl("AboutPage.qml"))
                }
            }
        ]*/
/*
Page {
    id: page_1
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        Column {
            id: column
            width: parent.width
            spacing: 20

            PageHeader {
                title: "New Page"
                    Button {
                        id: btn_next_pg1
                        text: "Prev"


                        onClicked: {
                            pageStack.pop(pageStack.current_page)
                        }
                    }
                    Button {
                        text: "Next"
                        anchors.top: parent.bottom

                        onClicked: {
                            pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                        }
                    }
                Text {
                    anchors.top: btn_next_pg1.bottom
                    id: text_depth_1
                    text: "Stack Depth: " + pageStack.depth
                }
            }
        }
    }
}*/

Page {
    id: page_1
    /*SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        Column {
            id: column
            width: parent.width
            spacing: 20

            PageHeader {
                title: "New Page"
                    Button {
                        id: btn_next_pg1
                        text: "Remove Page"

                        onClicked: {
                            pageStack.popAttached()
                        }
                    }
                    Button {
                        text: "Add Page"
                        anchors.top: parent.bottom

                        onClicked: {
                            pageStack.pushAttached(Qt.resolvedUrl("AboutPage.qml"))
                        }
                    }
            }
        }
    }*/

    /*Item {
        id: task_3
        width: parent.width
        height: parent.height

        Column {
            spacing: 40
            Row {
                Button {
                    text: "Open Dialog"
                    onClicked: {
                        dlg_1.open();
                    }
                }
            }
            Row {
                Text {
                    id: text_2
                    text: "Inputed text"
                }
            }
            Dialog {
                id: dlg_1
                TextField {
                    id: text_1
                    width: parent.width
                    placeholderText: "Enter text"
                    color: "black"
                }
                Button {
                    anchors.top: text_1.bottom
                    text: "Apply"

                    onClicked: {
                        text_2.text = text_1.text
                    }
                }
            }
        }
    }*/

    /*Item {
        id: task_4
        width: parent.width
        height: parent.height
        Column {
            spacing: 40
            Row {
                Button {
                    text: "Open Dialog"
                    onClicked: {
                        dlg_1.open();
                    }
                }
            }
            Row {
                Text {
                    id: text_2
                    text: "Inputed date"
                }
            }
            Dialog {
                id: dlg_1
                property date date: new Date()

                DatePicker {
                    id: date_picker
                    date: new Date()
                    onDateChanged: {
                        dlg_1.date = date;
                    }
                }

                Button {
                    anchors.top: date_picker.bottom
                    text: "Apply"

                    onClicked: {
                        text_2.text = dlg_1.date.toDateString()
                    }
                }
            }
        }
    }*/

    /*Item {
        id: task_5
        width: parent.width
        height: parent.height

        Column {
            spacing: 40
            Row {
                Button {
                    text: "Open Dialog"
                    onClicked: {
                        dlg_1.open();
                    }
                }
            }
            Row {
                Text {
                    id: text_2
                    text: "Inputed time"
                }
            }
            Dialog {
                id: dlg_1

                TimePicker  {
                    id: time_picker
                    hour: 13
                    minute: 30
                }


                Button {
                    anchors.top: time_picker.bottom
                    text: "Apply"

                    onClicked: {
                        text_2.text = time_picker.timeText
                    }
                }
            }
        }
    }*/

    /*Item {
        id: task_6
        width: parent.width
        height: parent.height
        PageHeader {
            title: "Tasks"
        }

        SilicaListView {
            width: parent.width; height: parent.height
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.bottom: parent.bottom
            model: ListModel {
                id: model
                        //ListElement { option: ""; date: "Tasks"}
                        ListElement { option: "Do what you like"; date: "17 october" }
                        ListElement { option: "Like what you do"; date: "19 october" }
                        ListElement { option: "Do something else you also like";date: "23 october" }
                    }

            delegate: Item {
                width: ListView.view.width
                height: Theme.itemSizeSmall

                Label {
                    text: option
                }
            }
            section.property: "date"
            section.criteria: ViewSection.FullString
            section.delegate: BackgroundItem { PageHeader { title: section } }

        }
    }*/

    /*Item {
        id: task_7
        width: parent.width
        height: parent.height

        SilicaWebView {
            id: webView

            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: urlField.top
            }
            url: "https://habr.com/ru/all/"
        }

        TextField {
            id: urlField
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            inputMethodHints: Qt.ImhUrlCharactersOnly
            label: webView.title
        }
    }*/


    /*Item {
        id: task_8
        width: parent.width
        height: parent.height

        SilicaListView {
            id: list_1
            visible: false
            width: parent.width;
            height: parent.height
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.bottom: parent.bottom
            model: ListModel {
                        //ListElement { option: ""; date: "Tasks"}
                        ListElement { option: "Do what you like"; date: "17 october" }
                        ListElement { option: "Like what you do"; date: "19 october" }
                        ListElement { option: "Do something else you also like";date: "23 october" }
                    }

            delegate: Item {
                width: ListView.view.width
                height: Theme.itemSizeSmall

                Label {
                    text: option
                }
            }

            section.property: "date"
            section.criteria: ViewSection.FullString
            section.delegate: BackgroundItem { PageHeader { title: section } }

        }

        SlideshowView {
            id: view
            height: 300
            itemWidth: parent.width
            orientation: Qt.Vertical

            model: 3

            ListModel {
                id: list_model
                ListElement { option: "Do what you like"; date: "17 october" }
                ListElement { option: "Like what you do"; date: "19 october" }
                ListElement { option: "Do something else you also like";date: "23 october" }
            }

            delegate: Rectangle {
                id: rect
                width: view.itemWidth
                height: view.height
                border.width: 1

                SilicaListView {
                    id: list_2
                    visible: true
                    width: parent.width;
                    height: parent.height
                    anchors.top: parent.top

                    model: list_model.get(index)
                    delegate: Item {
                        width: ListView.view.width
                        height: Theme.itemSizeSmall

                        Label {
                            text: option
                        }
                    }

                    section.property: "date"
                    section.criteria: ViewSection.FullString
                    section.delegate: BackgroundItem { PageHeader { title: section } }

                }

                Text {
                    text: index
                }
                property int index: model.index
            }
        }
    }*/


    /*Item {
        id: task_9
        width: parent.width
        height: parent.height

        SilicaFlickable {
                anchors.fill: parent
                contentHeight: 200

                PullDownMenu {
                    MenuItem {
                        text: qsTr("Option 1")
                        onClicked: {label_1.text = text}
                    }
                    MenuItem {
                        text: qsTr("Option 2")
                        onClicked: {label_1.text = text}
                    }
                    MenuItem {
                        text: qsTr("Option 3")
                        onClicked: {label_1.text = text}
                    }
                }
                PushUpMenu {
                    MenuItem {
                        text: qsTr("Option 1")
                        onClicked: {label_1.text = text}
                    }
                    MenuItem {
                        text: qsTr("Option 2")
                        onClicked: {label_1.text = text}
                    }
                    MenuItem {
                        text: qsTr("Option 3")
                        onClicked: {label_1.text = text}
                    }
                }

                Label {
                    id: label_1
                    text: "Menu item text"
                    width: page.width
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.verticalCenter
                    anchors.topMargin: task_9.height/3
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
            }

    }*/

    /*Item {
        id: task_10
        width: parent.width
        height: parent.height

        SilicaListView {
            anchors.fill: parent

            model: ListModel {
                    id: model_1
                    ListElement { option: "Do what you like"}
                    ListElement { option: "Like what you do"}
                    ListElement { option: "Do something else you also like"}
            }

            delegate: ListItem {
                width: ListView.view.width

                Label {
                    id: label
                    text: model.option
                    anchors.centerIn: parent
                }

                menu: ContextMenu {
                    MenuItem {
                        text: "Type element in console"
                        onClicked: {console.log("Element: " + model.option)}
                    }
                    MenuItem {
                        text: "Type index of element in console"
                        onClicked: {console.log("Index: " + model.index)}
                    }
                }
            }
        }
    }*/

    Item {
        id: task_11
        width: parent.width
        height: parent.height

        Cover {
            id: cover
            anchors.fill: parent
            transparent: true

            Label {
                id: lbl_1
                property int score: 0
                anchors.centerIn: parent
                text: "Score: " + score
            }

            Button {
                id: btn_1
                anchors.top: lbl_1.bottom
                text: "+"
                onClicked: lbl_1.score++;
            }
            Button {
                anchors.top: lbl_1.bottom
                anchors.right: parent.right
                text: "-"
                onClicked: lbl_1.score--;
            }

        }
    }


}


    //}
//}
