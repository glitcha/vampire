import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 0.1

import "vampire.js" as Vampire

Item {

    id: container
    width: parent.width
    height: 30

    Rectangle {
        x: 5
        y: 2
        height: parent.height - 5
        color: "#ffffff"
        width: parent.width - 40
        border.width: 1
        border.color: "#bbbbbb"
    }

    TextInput {
        id: addCatText
        x:7
        y:7
        text: ""
        activeFocusOnPress: false
        color: "#666666"
        width: parent.width - 30
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!addCatText.activeFocus) {
                    addCatText.forceActiveFocus();
                } else {
                    addCatText.focus = false;
                }
            }
        }
    }

    Rectangle {
        id: addCatButton
        width: 25
        height: 25
        x: parent.width - (addCatButton.width + 5)
        radius: width*0.5
        y: 2
        color:"#769e39"
        Text {
            x:5
            y:3
            text: "+"
            color: "#ffffff"
            font { bold: true; family: "Roboto"; pointSize: 12 }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Vampire.addCategory(addCatText.text);
            }
        }
    }

}
