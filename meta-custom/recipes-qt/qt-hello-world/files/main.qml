import QtQuick 2.15  
import QtQuick.Window 2.15
import QtMultimedia 5.15

Window {
    visible: true
    width: 1280
    height: 720
    title: "Jetson Nano CSI Camera"

    MediaPlayer {
        id: mediaPlayer
        source: "gst-pipeline: nvarguscamerasrc ! video/x-raw(memory:NVMM), format=NV12, width=1280, height=720, framerate=30/1 ! nvvidconv ! video/x-raw, format=BGRx ! videoconvert ! qtvideosink"
        autoPlay: false
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        source: mediaPlayer
        fillMode: VideoOutput.PreserveAspectFit
    }

    Rectangle {
        id: startButton
        width: 200
        height: 60
        color: "green"
        radius: 10
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20

        Text {
            anchors.centerIn: parent
            text: "Start Camera"
            color: "white"
            font.pixelSize: 18
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                mediaPlayer.play();
                parent.color = "gray";
            }
        }
    }
}

A

A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A


