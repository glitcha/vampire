import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.XmlListModel 2.0
import Ubuntu.Components 0.1

import "vampire.js" as Vampire

Item {
    id: container
    property alias caption: itemTitle.text
    property string feedURL: ""

    XmlListModel {
        id: feedModel
        source: feedURL
        query: "/rss/channel/item"
        namespaceDeclarations: "declare namespace media = 'http://search.yahoo.com/mrss/';"
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        XmlRole { name: "description"; query: "description/string()" }
        XmlRole { name: "media"; query: "media:content/@url/string()" }
    }

    Text {
        id: itemTitle
        x:15
        y:0
        text: ""
        font { family: "Ubuntu Medium"; pixelSize: 16; bold: false }
        anchors.bottomMargin: 15
    }

    ListView {
        id: list
        y:20
        width: window.width - 220;
        height: window.height - (parent.y + 30)
        model: feedModel
        delegate: NewsItemRowDelegate {}
        clip: true;
    }
    ScrollBar {
        scrollArea: list;
        height: list.height;
        width: 5;
        anchors.right: list.right;
    }

    function reload() {
        feedModel.reload();
    }
}


