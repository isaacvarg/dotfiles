import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

RowLayout {
    id: root
    spacing: 4

    required property var panelWindow

    Repeater {
        model: SystemTray.items

        delegate: Item {
            required property SystemTrayItem modelData

            implicitWidth: 24
            implicitHeight: 24

            Image {
                anchors.centerIn: parent
                source: modelData.icon
                sourceSize.width: 18
                sourceSize.height: 18
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                cursorShape: Qt.PointingHandCursor

                onClicked: (event) => {
                    if (event.button === Qt.LeftButton) {
                        if (modelData.onlyMenu) {
                            modelData.display(root.panelWindow, parent.x, parent.y);
                        } else {
                            modelData.activate();
                        }
                    } else if (event.button === Qt.RightButton) {
                        modelData.display(root.panelWindow, parent.x, parent.y);
                    }
                }
            }
        }
    }
}
