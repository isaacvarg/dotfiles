import QtQuick
import Quickshell
import qs.assets.theme

Text {
    id: dateDisplay

    color: Theme.text
    font.pixelSize: 14

    SystemClock {
        id: systemClock
        precision: SystemClock.Minutes
    }

    function getWeekNumber(date) {
        var d = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()));
        var dayNum = d.getUTCDay() || 7;
        d.setUTCDate(d.getUTCDate() + 4 - dayNum);
        var yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1));
        var week = Math.ceil((((d.getTime() - yearStart.getTime()) / 86400000) + 1) / 7);
        return (week < 10 ? "0" : "") + week;
    }

    text: Qt.formatDateTime(systemClock.date, "dd MMMM") + " • Week " + getWeekNumber(systemClock.date)
}