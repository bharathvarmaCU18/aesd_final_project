import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15

Window {
    visible: true
    width: 400
    height: 200
    title: "Jetson Nano Remote Stream"

    property bool streaming: false

    MediaPlayer {
        id: remotePlayer
        source: "gst-pipeline: nvarguscamerasrc ! video/x-raw(memory:NVMM),width=1280,height=720,framerate=30/1,format=NV12 ! nvvidconv ! nvv4l2h264enc bitrate=2000000 ! h264parse ! rtph264pay config-interval=1 pt=96 ! udpsink host=10.0.0.121 port=5000 sync=false"
        autoPlay: false
        onError: console.error("Remote error:", errorString)
    }

    Rectangle {
        width: 200
        height: 60
        radius: 10
        color: streaming ? "red" : "green"
        anchors.centerIn: parent

        Text {
            anchors.centerIn: parent
            text: streaming ? "Stop Stream" : "Start Stream"
            color: "white"
            font.pixelSize: 18
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (streaming) {
                    remotePlayer.stop();
                    streaming = false;
                } else {
                    remotePlayer.play();
                    streaming = true;
                }
            }
        }
    }
}

