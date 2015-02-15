import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: tracklist

    property var tracks

    signal trackSelected(int trackNum)

    TableView {
        id: list

        anchors.fill: parent
        selectionMode: SelectionMode.SingleSelection

        model: tracks

        TableViewColumn {
            title: qsTr("Artist")
            role: "artist"
        }

        TableViewColumn {
            title: qsTr("Title")
            role: "title"
        }

        TableViewColumn {
            title: qsTr("Duration")
            role: "duration"
        }

        onActivated: trackSelected(row)
    }

    function setCurrent() {
        list.currentRow = 10;
    }

//    ListView {
//        anchors.fill: parent

//        model: tracks

//        delegate: Row {
//            width: parent.width

//            Text {
//                text: modelData["artist"]
//            }

//            Text {
//                text: modelData["title"]
//            }
//        }
//    }
}

