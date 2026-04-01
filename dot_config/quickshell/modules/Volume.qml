import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Services.Pipewire
import Quickshell.Io
import qs.assets.theme

MouseArea {
    id: root
    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight
    acceptedButtons: Qt.LeftButton

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    property PwNode sink: Pipewire.defaultAudioSink

    Process {
        id: pavucontrol
        command: ["pavucontrol"]
    }

    onClicked: pavucontrol.startDetached()

    onWheel: event => {
        let audio = sink?.audio
        if (!audio) return
        let step = 0.01
        if (event.angleDelta.y > 0)
            audio.volume = Math.min(1.0, audio.volume + step)
        else if (event.angleDelta.y < 0)
            audio.volume = Math.max(0.0, audio.volume - step)
    }

    RowLayout {
        id: layout
        spacing: 8
        anchors.fill: parent

        Image {
            id: icon
            source: {
                let base = Qt.resolvedUrl("../assets/icons/")
                let audio = sink?.audio
                if (!audio) return base + "volume-off.svg"
                if (audio.muted) return base + "volume-x.svg"
                let vol = Math.round(audio.volume * 100)
                return vol > 50 ? base + "volume-2.svg"
                     : vol > 0  ? base + "volume-1.svg"
                                 : base + "volume.svg"
            }
            sourceSize.width: 20
            sourceSize.height: 20
            Layout.alignment: Qt.AlignVCenter
            layer.enabled: true
            layer.effect: MultiEffect {
                brightness: 1.0
            }
        }

        Text {
            text: {
                let audio = sink?.audio
                if (!audio) return "No Audio"
                return audio.muted ? "Muted" : Math.round(audio.volume * 100) + "%"
            }
            color: Theme.text
            font.pixelSize: 16
        }
    }
}
