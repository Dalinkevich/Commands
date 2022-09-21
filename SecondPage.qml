import QtQuick 2.11
import QtQuick.Controls 2.1


Item {
    id: secondPage
    signal signalExit
    width: mainWin.width
    height: mainWin.height

    TextField {
        id: imageTextField
        placeholderText: "Enter the url of the image"
        width: parent.width / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: nameTextField.top
        anchors.bottomMargin: 5
        color: "indigo"
    }

    TextField {
        id: nameTextField
        placeholderText: "Enter the name of the command"
        width: parent.width / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: saveButton.top
        anchors.bottomMargin: 5
        color: "black"
    }

    Label {
        id: errorLabel
        anchors.top: saveButton.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        text: ""
        color: "red"
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
            if (imageTextField.text == "") {
                saveButton.enabled = true
                errorLabel.text = "You have not entered the Url of the image"
            } else if (nameTextField.text == "") {
                saveButton.enabled = true
                errorLabel.text = "You didn't enter the command name"
            } else {
                comListModelId.append({ "_icon": imageTextField.text, "_text": nameTextField.text })
                imageTextField.text = ""
                nameTextField.text = ""
                errorLabel.text = ""
                secondPage.signalExit()
            }
        }
    }
}
