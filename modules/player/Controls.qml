import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: controls

    color: palette.dark

    Column {
        anchors.fill: parent
        spacing: 5

        Slider {
            id: progressBar
            width: parent.width
            value: mediaPlayer.position
            maximumValue: {
                if (mediaPlayer.duration) {
                    return mediaPlayer.duration
                }
            }


//            updateValueWhileDragging: false


        }

//        Rectangle {
//            width: 10
//            height: 10

//            color: palette.highlight

//            x: progressBar.width * progressBar.value - width / 2
//        }
    }


}

