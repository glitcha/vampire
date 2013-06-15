import QtQuick 2.0
import "vampire.js" as Vampire

Item {
    id: delegate
    height: column.height + 40
    width: 300

    Rectangle {
        color: "white"
        x:15
        y:15
        width: parent.width - 22
        height: parent.height - 20
        border.width: 1
        border.color: "#aaaaaa"
        radius: 5
    }

    Column {
        id: column
        x: 20; y: 20
        width: parent.width - 40

        Text {
            id: titleText
            text: '<html><style type="text/css"></style><a href="' + link + '">' + title + '</a></html>';
            width: parent.width;
            wrapMode: Text.WordWrap
            font { bold: false; family: "Roboto"; pointSize: 11 }
            onLinkActivated: Vampire.openBrowser(link)
        }

        Text {
            id: descriptionText
            width: parent.width; text: description
            wrapMode: Text.WordWrap;
            font { bold: false; family: "Roboto"; pointSize: 8 }
            clip: true;
            textFormat: Text.RichText
            onLinkActivated: Vampire.openBrowser(link)
        }
    }
}