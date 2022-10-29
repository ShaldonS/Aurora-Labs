import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.appname.MyModule 1.0

Page {
    id: page_1
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property int cnt: 0

    MyClass {
        id: myClass
        text: "My Class Text"
    }
    SilicaFlickable {
        Column {
            Label { text: "Counter: " + cnt }
            Button {
                width: parent.width
                text: "Increase"
                onClicked: {myClass.increaseCnt(); myClass.printCnt(); cnt = myClass.getCnt()}
            }
            Button {
                width: parent.width
                text: "Reset"
                onClicked: {myClass.resetCnt(); myClass.printCnt(); cnt = myClass.getCnt()}
            }
        }
    }

}
