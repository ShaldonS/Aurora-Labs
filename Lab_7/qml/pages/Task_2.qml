import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.appname.MyModule 1.0

Page {
    id: page_2
    objectName: "mainPage"
    //allowedOrientations: Orientation.All

    property string list: ""

    MyList {
        id: myList
    }

    SilicaFlickable {
        Column {
            TextField {
                id: text_field
                width: 400
                placeholderText: "Enter text"
                color: "black"
            }
            Button {
                width: parent.width
                text: "Append"
                onClicked: {
                    myList.addString(text_field.text);
                    //console.log(myList.getLastOfList());
                    list = myList.getAllStrings()
                }
            }
            Button {
                width: parent.width
                text: "Pop"
                onClicked: {
                    myList.popList()
                    list = myList.getAllStrings()
                }
            }
            Label {
                width: 400
                text: "List: " + list
                wrapMode: Text.WordWrap
            }
        }
    }

}
