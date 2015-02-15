import QtQuick 2.0
import QtMultimedia 5.0
import QtQuick.Controls 1.2

import "qrc:/js/URLQuery.js" as URLQuery
import "qrc:/js/XHR.js" as XHR

Rectangle {
    id: player

    property var tracks
    property int currentTrack

    function initialize() {
        getTracks();
    }

    function getTracks() {
        var params = {
            access_token: app.token,
            owner_id: app.userId,
            count: 50
        }

        function callback(request) {
            if (request.status === 200) {
                var result = JSON.parse(request.responseText);
                if (result.error) {
                    console.log("Error:", result.error.error_code, result.error.error_msg);
                } else {
                    result.response.splice(0, 1);
                    player.tracks = result.response;
                }
            } else {
                console.log("HTTP", request.status, request.statusText);
            }
        }

        XHR.sendXHR('POST', 'https://api.vk.com/method/audio.get', callback, URLQuery.serializeParams(params));
    }

    function play(trackNum) {
        if (tracks[trackNum]) {
            player.currentTrack = trackNum;
            mediaPlayer.source = tracks[trackNum].url;
            mediaPlayer.play();
        }
    }

    function playNext() {
        if (player.currentTrack < player.tracks.length - 1) {
            play(player.currentTrack + 1);
        } else {
            play(0);
        }
    }

    MediaPlayer {
        id: mediaPlayer

        onStatusChanged: {
            if (status === MediaPlayer.EndOfMedia) {
                player.playNext();
            }
        }
    }

    Column {
        anchors.fill: parent

        Tracklist {
            id: tracklist
            tracks: player.tracks

            height: parent.height - controls.height
            width: parent.width

            onTrackSelected: play(trackNum)
        }

        Controls {
            id: controls

            height: 100
            width: parent.width
        }
    }
}

