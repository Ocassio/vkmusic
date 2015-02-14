import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

import "modules/login"

ApplicationWindow {
    id: app

    property string appId: "4782178"
    property string token

    property string permissions: "audio"

    title: qsTr("VK Music")
    width: 640
    height: 480
    visible: true

    SystemPalette {
        id: palette
        colorGroup: SystemPalette.Active
    }

    Login {
        anchors.fill: parent
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
