import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import Network.module 1.0

Window {
    id: w
    width: Screen.width
    height: Screen.height
    visible: true

    Network {
        id: network
        onSendData:{
            chat.text += str
            chat.text+="\n"
        }
    }

    Item {
        id: page1
        visible: true
        x: 50
        y: 100

        Column {
            spacing: 20
            Text {
                id: ip
                width: 100
                height: 30
                text: "IP Address : "
            }
            TextField {
                id: ip_input
                width: 300
                height: 50
            }
            Text {
                id: port
                width: 100
                height: 30
                text: "Port : "
            }
            TextField {
                id: port_input
                width: 300
                height: 50
            }

            Row {
                spacing: 50
                x: 25
                Button {
                    id: exit
                    text: "Exit"
                    width: 100
                    height: 50
                }
                Button {
                    id: login
                    text: "Login"
                    width: 100
                    height: 50
                }
            }
        }

        Connections {
            target: login
            onClicked: {
                network.sendIpToClient(ip_input.text)
                network.sendPortToClient(port_input.text)
                network.setIpAndPort()

                page1.visible = !page1.visible
                page2.visible = !page2.visible
            }
        }
        Connections {
            target: exit
            onClicked: Qt.quit()
        }
    } //page1

    Item {
        id: page2
        visible: false
        x: 30
        y: 10

        Column {
            spacing: 20
            Row {
                spacing: 20
                Button {
                    id: back
                    width: 50
                    height: 50
                }
                Text {
                    width: 50
                    height: 50
                    text: qsTr("IP : ")
                }
                Text {
                    width: 50
                    height: 50
                }
            }

            Text {
                id: chat
                width: 400
                height: 400
            }

            Row {
                spacing: 5
                TextField {
                    id: send
                    width: 300
                    height: 50
                }
                Button {
                    id: send_button
                    width: 50
                    height: 50
                }
            }
        }

        Connections {
            target: back
            onClicked: {
                page1.visible = !page1.visible
                page2.visible = !page2.visible
            }
        }

        Connections {
            target: send_button
            onClicked: {
                network.qmlToCXX(send.text)
                //chat.text += send.text
                //chat.text += "\n"
                send.clear()
            }
        }
    } //page2
}
