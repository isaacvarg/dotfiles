import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    spacing: 4

    Repeater {
        model: Hyprland.workspaces

        delegate: Rectangle {
            required property HyprlandWorkspace modelData

            width: 24
            height: 24
            radius: 4

            color: modelData.focused ? "#cba6f7"
                 : modelData.active  ? "#585b70"
                                     : "#313244"

            Text {
                text: modelData.id
                color: modelData.focused ? "#1e1e2e" : "#cdd6f4"
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
