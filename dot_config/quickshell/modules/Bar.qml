import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.assets.theme

PanelWindow {
    id: bar
    required property var modelData
    screen: modelData

    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 40

    color: "transparent"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 4
        anchors.bottomMargin: 4

        // Left: Clock island
        Rectangle {
            color: Theme.base
            radius: 8
            Layout.preferredWidth: clockItem.implicitWidth + 16
            Layout.preferredHeight: clockItem.implicitHeight + 8

            Clock {
                id: clockItem
                anchors.centerIn: parent
            }
        }

        // Push workspaces to center
        Item { Layout.fillWidth: true }

        // Center: Workspaces island
        Rectangle {
            color: Theme.base
            radius: 8
            Layout.preferredWidth: workspacesItem.implicitWidth + 16
            Layout.preferredHeight: workspacesItem.implicitHeight + 8

            Workspaces {
                id: workspacesItem
                anchors.centerIn: parent
                screenName: bar.screen.name
            }
        }

        // Push tray to right
        Item { Layout.fillWidth: true }

        // Right: Bluetooth island
        Rectangle {
            color: Theme.base
            radius: 8
            Layout.preferredWidth: bluetoothItem.implicitWidth + 16
            Layout.preferredHeight: bluetoothItem.implicitHeight + 8

            Bluetooth {
                id: bluetoothItem
                anchors.centerIn: parent
            }
        }

        // Right: Status tray island
        Rectangle {
            color: Theme.base
            radius: 8
            Layout.preferredWidth: statusTrayItem.implicitWidth + 16
            Layout.preferredHeight: statusTrayItem.implicitHeight + 8

            StatusTray {
                id: statusTrayItem
                anchors.centerIn: parent
            }
        }

        // Right: System Tray island
        Rectangle {
            color: Theme.base
            radius: 8
            Layout.preferredWidth: trayItem.implicitWidth + 16
            Layout.preferredHeight: trayItem.implicitHeight + 8

            SysTray {
                id: trayItem
                panelWindow: bar
                anchors.centerIn: parent
            }
        }
    }
}
