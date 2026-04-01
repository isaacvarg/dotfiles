import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import qs.assets.theme

RowLayout {
    spacing: 8

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    property PwNode sink: Pipewire.defaultAudioSink

    Text {
        text: {
            let audio = sink?.audio
            if (!audio) return "󰖁 --"
            let vol = Math.round(audio.volume * 100)
            let icon = audio.muted ? "󰖁 "
                     : vol > 50    ? "󰕾 "
                     : vol > 0     ? "󰖀 "
                                   : "󰕿 "
            return icon + " " + vol + "%"
        }
        color: Theme.text
        font.pixelSize: 14
    }
}
