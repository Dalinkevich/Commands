import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.1

Window {
    id: mainWin
    visible: true
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2
    minimumWidth: 600
    minimumHeight: 450
    width: 640
    height: 480
    title: qsTr("Commands") + qmlTranslator.emptyString

    ListModel {
        id: comListModelId
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: firstComp
    }

    Component {
       id: firstComp
       FirstPage {
           onSwitching: {
               stackView.push(secondComp)
           }
       }
    }

    Component {
        id: secondComp
        SecondPage {
            onSignalExit: {
                stackView.push(firstComp)
            }
        }
    }
}
