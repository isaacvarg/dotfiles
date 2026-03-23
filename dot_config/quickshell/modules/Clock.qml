import QtQuick
import Quickshell

Text {
    id: clock

    color: "#cdd6f4"
    font.pixelSize: 14

    SystemClock {
        id: systemClock
        precision: SystemClock.Minutes
    }

    text: Qt.formatDateTime(systemClock.date, "hh:mm AP")
}
