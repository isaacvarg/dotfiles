import QtQuick
import Quickshell
import qs.assets.theme

Text {
    id: clock

    color: Theme.text
    font.pixelSize: 14

    SystemClock {
        id: systemClock
        precision: SystemClock.Minutes
    }

    text: Qt.formatDateTime(systemClock.date, "hh:mm AP")
}
