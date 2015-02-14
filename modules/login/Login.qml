import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {

    signal succeeded()

    Column {
        anchors.centerIn: parent
        spacing: 5
        width: parent.width

        Label {
            text: qsTr("Greetings!")
            font.bold: true
            elide: Text.ElideRight
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Label {
            text: qsTr("You need to login using your VK account in order to use the app")
            elide: Text.ElideRight
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Label {
            id: loginErrorMsg
            visible: false
            color: "red"
            elide: Text.ElideRight
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Button {
            text: qsTr("Login")
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                loginErrorMsg.visible = false;
                loginWindow.visible = true;
                loginWindow.login();
            }
        }
    }

    function onLoginSuccess(token, userId) {
        app.token = token;
        app.userId = userId;
        loginWindow.destroy();
        succeeded();
    }

    function onLoginFailure(error) {
        loginErrorMsg.text = error;
        loginErrorMsg.visible = true;
        loginWindow.visible = false;
    }

    LoginWindow {
        id: loginWindow

        appId: app.appId
        permissions: app.permissions

        onSucceeded: onLoginSuccess(token, userId)
        onFailed: onLoginFailure(error)
    }
}

