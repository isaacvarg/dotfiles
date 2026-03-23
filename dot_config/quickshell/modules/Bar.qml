import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: bar

    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 32

    color: "#1e1e2e"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8

        // Left: Clock
        Clock {}

        // Push workspaces to center
        Item { Layout.fillWidth: true }

        // Center: Workspaces
        Workspaces {}

        // Push tray to right
        Item { Layout.fillWidth: true }

        // Right: System Tray
        SysTray {
            panelWindow: bar
        }
    }
}
