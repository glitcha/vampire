import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Item {
    id: container
    property alias caption: itemTitle.text
    property string feedURL: "rss.news.yahoo.com/rss/topstories"

    XmlListModel {
        id: feedModel
        source: "http://" + feedURL
        query: "/rss/channel/item"
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        XmlRole { name: "description"; query: "description/string()" }
    }

    Text {
        id: itemTitle
        text: ""
        font { family: "Ubuntu Medium"; pixelSize: 16; bold: false }
    }

    ListView {
        id: list
        width: window.width - 220; height: window.height
        model: feedModel
        delegate: NewsItemRowDelegate {}

    }
    ScrollBar {
        scrollArea: list;
        height: list.height;
        width: 5;
        anchors.right: parent.right }

    function reload() {
        feedModel.reload();
    }
}


