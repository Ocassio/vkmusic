import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

import "modules/login"
import "modules/player"

ApplicationWindow {
    id: app

    property string appId: "4782178"
    property string token

    property string permissions: "audio"

    property string userId

    title: "VKMusic"
    width: 640
    height: 480
    visible: true

    SystemPalette {
        id: palette
        colorGroup: SystemPalette.Active
    }

    Login {
        id: loginForm
        anchors.fill: parent
        visible: true

        onSucceeded: onLogin()
    }

    Player {
        id: player
        anchors.fill: parent
        visible: false
    }

    function onLogin() {
        loginForm.visible = false;
        player.visible = true;
        player.initialize();
    }
}
