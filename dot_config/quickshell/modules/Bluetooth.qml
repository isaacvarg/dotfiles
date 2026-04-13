import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Bluetooth
import Quickshell.Io
import qs.assets.theme

MouseArea {
    id: root
    implicitWidth: 20
    implicitHeight: 20
    acceptedButtons: Qt.LeftButton

    property var adapter: Bluetooth.defaultAdapter

    property bool anyConnected: {
        if (!adapter) return false
        let devs = adapter.devices
        for (let i = 0; i < devs.count; i++) {
            if (devs.values[i].connected) return true
        }
        return false
    }

    Process {
        id: bluetui
        command: ["ghostty", "-e", "bluetui"]
    }

    onClicked: bluetui.startDetached()

    Image {
        id: icon
        source: {
            let base = Qt.resolvedUrl("../assets/icons/")
            if (!adapter) return base + "bluetooth-off.svg"
            let s = adapter.state
            if (s === BluetoothAdapterState.Disabled || s === BluetoothAdapterState.Blocked)
                return base + "bluetooth-off.svg"
            if (adapter.discovering)
                return base + "bluetooth.svg"
            if (root.anyConnected)
                return base + "bluetooth-connected.svg"
            return base + "bluetooth.svg"
        }
        sourceSize.width: 20
        sourceSize.height: 20
        anchors.centerIn: parent
        layer.enabled: true
        layer.effect: MultiEffect {
            brightness: 1.0
        }
    }
}
