import QtQuick 2.0
import QtMultimedia 5.0

import "qrc:/js/URLQuery.js" as URLQuery
import "qrc:/js/XHR.js" as XHR

Rectangle {
    id: player

    property var tracks

    function initialize() {
        getTracks();
//        console.log(tracks);
//        if (tracks) {
//            mediaPlayer.source = tracks[1].url;
//            mediaPlayer.play();
//        }
    }

    function getTracks() {
        var params = {
            access_token: app.token,
            owner_id: app.userId,
            count: 10
        }

        function callback(request) {
            if (request.status === 200) {
                var result = JSON.parse(request.responseText);
                if (result.error) {
                    console.log("Error:", result.error.error_code, result.error.error_msg);
                } else {
                    player.tracks = result.response;
                    play();
                }
            } else {
                console.log("HTTP", request.status, request.statusText);
            }
        }

        XHR.sendXHR('POST', 'https://api.vk.com/method/audio.get', callback, URLQuery.serializeParams(params));
    }

    function play() {
        if (tracks && tracks.length > 1) {
            mediaPlayer.source = tracks[1].url;
            mediaPlayer.play();
        }
    }

    MediaPlayer {
        id: mediaPlayer
    }
}

