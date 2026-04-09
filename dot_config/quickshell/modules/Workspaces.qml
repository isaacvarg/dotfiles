import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.assets.theme

RowLayout {
    spacing: 4

    property string screenName: ""

    Repeater {
        model: Hyprland.workspaces.values.filter(ws => ws.monitor && ws.monitor.name === screenName)

        delegate: Rectangle {
            required property var modelData

            width: 24
            height: 24
            radius: 4

            color: modelData.focused ? Theme.iris
                 : modelData.active  ? Theme.highlightHigh
                                     : Theme.highlightMed

            Text {
                text: modelData.id
                color: modelData.focused ? Theme.base : Theme.text
                font.pixelSize: 12
                font.bold: modelData.focused
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + modelData.id)
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
