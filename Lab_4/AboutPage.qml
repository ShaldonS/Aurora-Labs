import QtQuick 2.0
import Sailfish.Silica 1.0
/*
Page {
    id: page_2
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        Column {
            id: column_2
            width: parent.width
            spacing: 20

            PageHeader {
                title: "New Page"
                    Button {
                        id: btn_next_pg2
                        text: "Prev"


                        onClicked: {
                            pageStack.pop(pageStack.current_page)
                        }
                    }
                    Button {
                        text: "Next"
                        anchors.top: parent.bottom

                        onClicked: {
                            pageStack.push(Qt.resolvedUrl("MainPage.qml"))
                        }
                    }
                Text {
                    anchors.top: btn_next_pg2.bottom
                    id: text_depth_2
                    text: "Stack Depth: " + pageStack.depth
                }
            }
        }
    }
}*/

Page {
    id: page_2
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: parent.height
        Column {
            id: column_2
            width: parent.width
            spacing: 20

            PageHeader {
                title: "New Page"
                    Button {
                        id: btn_next_pg2
                        text: "Go back"

                        onClicked: {
                            pageStack.navigateBack()
                        }
                    }
            }
        }
    }
}
