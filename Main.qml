import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import UploadFileUI

ApplicationWindow {
    visible: true
    width: 600
    height: 700
    title: qsTr("Upload File UI")

    ColumnLayout {
        anchors {
            fill: parent
            margins: 20
        }

        spacing: 10

        Label {
            text: qsTr("Upload")
            font {
                pointSize: 18
                weight: Font.DemiBold
            }
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.preferredHeight: 10
        }

        UploadRect {
            Layout.fillWidth: true
            Layout.preferredHeight: 220

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 10

                Image {
                    Layout.alignment: Qt.AlignHCenter
                    source: "qrc:/Images/Upload icon.svg"
                    Layout.preferredHeight: 100
                    Layout.preferredWidth: 100
                    fillMode: Image.PreserveAspectFit
                }

                Item {
                    Layout.fillHeight: true
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Drag & drop files or <font color='#473ea7'><u>Browse</u></font>")
                    textFormat: Text.StyledText
                    font {
                        pointSize: 16
                        weight: Font.DemiBold
                    }
                }

                Text {
                    text: qsTr("Supported formates: JPEG, PNG, GIF, MP4, PDF, PSD, AI, Word, PPT")
                    font.pointSize: 10
                    color: "#777"
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        Item {
            Layout.preferredHeight: 10
        }

        Label {
            text: qsTr("Uploading - %1/%1 %2").arg(listView.count).arg("files")
            color: "#777"
            font {
                weight: Font.DemiBold
                pointSize: 14
            }
        }

        Item {
            Layout.preferredHeight: 10
        }

        ListModel {
            id: listModel

            ListElement {
                name: qsTr("Algorithms.pdf")
                progress: 0.5
            }

            ListElement {
                name: qsTr("Database.pdf")
                progress: 0.7
            }
            ListElement {
                name: qsTr("Network.pdf")
                progress: 0.2
            }
            ListElement {
                name: qsTr("C++.pdf")
                progress: 0.8
            }
        }

        ListView {
            id: listView
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            spacing: 10
            model: listModel
            delegate: myDelegate
            clip: true
            currentIndex: 1
            ScrollBar.vertical: ScrollBar {

            }
        }

        Component {
            id: myDelegate

            CustomListItem {
                width: listView.width
                height: 44

                // Expose accessibility properties.
                Accessible.focusable: true
                Accessible.role: Accessible.ListItem
                Accessible.selected: ListView.isCurrentItem  // Reports true when this delegate is the current item.
                Accessible.name: name  // Uses the file name from the model.

            }
        }

        Item {
            Layout.fillHeight: true
        }

        Button {
            id: button
            Layout.fillWidth: true
            hoverEnabled: true
            topPadding: 15
            bottomPadding: 15
            contentItem: Text {
                text: qsTr("Upload Files")
                font {
                    pointSize: 12
                    weight: Font.DemiBold
                    capitalization: Font.AllUppercase
                }
                color: "#fafafa"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                anchors.fill: parent
                color: button.hovered ? Qt.darker("#a39ed4", 1.1) : "#a39ed4"
                radius: 4
            }
        }
    }
}
