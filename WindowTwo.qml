import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.1

Window {
    id: winTwo
    signal signalExit
    width: mainWin.width
    height: mainWin.height
    minimumWidth: mainWin.minimumWidth
    minimumHeight: mainWin.minimumHeight

    TextField {
        id: imageTextField
        placeholderText: "Image"
        width: parent.width / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: nameTextField.top
        anchors.bottomMargin: 5
        color: "indigo"
    }

    TextField {
        id: nameTextField
        placeholderText: "Name"
        width: parent.width / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: saveButton.top
        anchors.bottomMargin: 5
        color: "black"
    }

    Button {
        id: saveButton
        text: qsTr("Save") + qmlTranslator.emptyString
        anchors.centerIn: parent

        background: Rectangle {
            color: "coral"
            border.color: "black"
            border.width: 2
            radius: 5
        }

        onClicked: {
            console.log("save button was clicked")
            mainListModel.append({ "_icon": imageTextField.text, "_text": nameTextField.text })
            imageTextField.text = ""
            nameTextField.text = ""
            winTwo.signalExit()

        }
    }
}
