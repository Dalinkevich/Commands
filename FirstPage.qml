import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {
    id: firstPage
    signal switching();

    Rectangle {
        id: mainRectangle
        anchors.fill: parent
        color: "lightgray"

        ComboBox {
            id: comboBox
            width: addButton.width / 1.5
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.rightMargin: 10
            anchors.right: parent.right

            background: Rectangle {
                color: "lightblue"
                border.color: "black"
                border.width: 2
                radius: 5
            }

            model: ["en", "ru"]
            // При изменении текста, инициализируем установку перевода через С++ слой
            onCurrentTextChanged: {
                qmlTranslator.setTranslation(comboBox.currentText)
            }
        }

        Button {
            id: addButton
            text: qsTr("Add Command") + qmlTranslator.emptyString

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 30

            background: Rectangle {
                color: "lightblue"
                border.color: "black"
                border.width: 2
                radius: 5
            }

            onClicked: {
                console.log("add button was clicked")
                firstPage.switching();

            }
        }

        ListView {
            id: comListView
            model: comListModelId
            width: parent.width * 0.5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 50
            anchors.rightMargin: 50
            anchors.top: addButton.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 40
            spacing: 5

            delegate: Rectangle {
                id: comDelegate
                width: comListView.width
                height: 50
                color: "white"
                radius: 10

                property url icon
                property string text
                icon: _icon
                text: _text

                Image {
                    id: comImg
                    width: parent.width / 8
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    source: comDelegate.icon
                }

                Label {
                    id: comLabel
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: comImg.right
                    anchors.right: comSwitch.left
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: {
                        if(comDelegate.text != "") {
                            comDelegate.text
                        } else {
                            "Error. Enter the name of the command"
                        }
                    }
                }

                Switch {
                    id: comSwitch
                    objectName: "switch"
                    enabled: true
                    checked: false
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    onCheckedChanged: {
                        if(checked) {
                            switchTimer.start()
                        } else {
                            switchTimer.stop()
                            console.log(checked)
                        }
                    }

                    Timer {
                        id: switchTimer
                        interval: 1000;
                        repeat: false

                        onTriggered: {
                            comSwitch.checked = false
                            console.log("Перекключатель сработал")
                        }
                    }
                }
            }
        }
    }
}

