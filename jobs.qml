import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4

Rectangle{
    width: parent.width
    height: parent.height

    Text {
        x: 20
        y: 10
        text: "Printer"
        font.bold: true
        height: 20
        font.family: "Sans"
    }

    /* Better to create a visual separator like
      a straight line for more comprehensive look */

    Text {
        x: parent.width/3 + 20
        y: 10
        text: "Location"
        font.bold: true
        height: 20
        font.family: "Sans"
    }

    Text {
        x: 2*parent.width/3 + 20
        y: 10
        text: "Status"
        font.bold: true
        height: 20
        font.family: "Sans"
    }

    /* Move from listmodel to a context property
    obtained from backend */

    ListModel{
        id: jobs_model

        ListElement{
            printer: "Canon Pixma"
            location: "Office Desk"
            status: "Completed"
        }

        ListElement{
            printer: "HP Laser Jet"
            location: "Home"
            status: "Running"
        }

        ListElement{
            printer: "Xerox"
            location: "Office Reception"
            status: "Pending"
        }
    }

    ListView {
        width: parent.width
        height: parent.height - 200
        model: jobs_model
        y: 40

        delegate: Rectangle {
            width: parent.width
            height: 20

            Menu { //Should this menu be for every job or is there some other way?
                id: menu

                MenuItem{ text: "Pause" }
                MenuItem{ text: "Stop" }
                MenuItem{ text: "Cancel" }
                MenuItem{ text: "Repeat" }
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                hoverEnabled: true

                onEntered: { parent.color = "#EEEEEE"}
                onExited:  { parent.color = "white"}
                onClicked: { //Add color to indicate right-clicked job
                    menu.x = mouseX
                    menu.y = mouseY
                    menu.open()
                }
            }

            Text {
                x: 20
                text: printer
                font.family: "Sans"
            }

            Text {
                x: parent.width/3 + 20
                text: location
                font.family: "Sans"
            }

            Text {
                x: 2*parent.width/3 + 20
                text: status
                font.family: "Sans"
            }
        }
    }

    Text {
        x: 20
        y: parent.height - 147
        text: "Start Job : "
        font.family: "Sans"
    }

    ComboBox {
        x: 120
        y: parent.height - 150
        width: parent.width - 180
        height: 24
        font.family: "Sans"
        font.pixelSize: 12
        model: ["Immediately", "After a delay of", "Never"]
    }
// Add textfield for delay option in above ComboBox
    Text {
        x: 20
        y: parent.height - 107
        text: "Save Job : "
        font.family: "Sans"
    }

    Switch {
        x: 105
        y: parent.height - 120
    } // Add textfield or browse button for save location
}
