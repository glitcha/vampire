import QtQuick 2.0
import QtQuick.LocalStorage 2.0 as Ls
import Ubuntu.Components 0.1

import "vampire.js" as Vampire

Item {

    id: delegate
    height: column.height + 40
    width: 300

    Rectangle {
        color: "white"
        x:15
        y:0
        width: parent.width - 10
        height: parent.height - 10
        border.width: 1
        border.color: "#d8d8d8"
        radius: 5
    }

    Column {

        id: column
        x: 20; y: 5
        width: parent.width - 40

        Image {
            id: articleImage
            source: media
        }

        Text {
            id: titleText
            text: '<a style="color: #000000;" href="' + link + '">' + title + '</a>';
            width: parent.width
            wrapMode: Text.Wrap
            font { bold: false; family: "Roboto"; pointSize: 11 }
            onLinkActivated: Vampire.openBrowser(link)
        }

        Text {
            id: descriptionText
            width: parent.width
            text: Vampire.formatDescription(description)
            wrapMode: Text.WordWrap
            font { bold: false; family: "Roboto"; pointSize: 8 }
            clip: true
            textFormat: Text.RichText
            onLinkActivated: Vampire.openBrowser(link)
        }

    }
}
