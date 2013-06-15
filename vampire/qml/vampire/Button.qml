import QtQuick 2.0

Item {

    id: container
    width: 100
    height: 30
    property string caption: "Button"
    signal clicked
    Rectangle {
        color: "white"
        border.width: 1
        border.color: "#cccccc"
        radius: 5
        anchors.fill: parent
    }

    Text {
        text: caption
        color: "black"
        font { family: "Ubuntu Medium"; pixelSize: 10; bold: false }
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: parent.clicked()
    }

}
