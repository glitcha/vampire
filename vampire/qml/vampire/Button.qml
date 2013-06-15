import QtQuick 2.0

Item {

    id: container
    width: 100
    height: 20
    property string caption: "Button"
    signal clicked
    Rectangle {
        color: "#666666"
        radius: 3
        anchors.fill: parent
    }

    Text {
        text: caption
        color: "white"
        font { family: "Ubuntu Medium"; pixelSize: 10; bold: false }
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: parent.clicked()
    }

}
