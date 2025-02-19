import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: control

    required property string name
    required property real progress

    border.width: 1
    border.color: "#aaa"
    radius: 4

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        Label {
            text: control.name
            color: "#1e1e1e"
            font.pointSize: 12
            font.weight: Font.Medium
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 30
        }

        Item {
            Layout.fillWidth: true
        }

        Image {
            Layout.alignment: Qt.AlignVCenter
            source: "qrc:/Images/Vector.svg"
            Layout.preferredWidth: 20
            Layout.preferredHeight: 20
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        color: "#483EA8"
        height: 5
        width: control.width * progress
    }
}
