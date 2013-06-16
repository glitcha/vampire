import QtQuick 2.0

Rectangle {
    id: window
    width: 800; height: 480
    SystemPalette { id: systemPalette; colorGroup: SystemPalette.Active }
    property string currentFeed: "rss.news.yahoo.com/rss/topstories"
    //property bool loading: feedModel.status === XmlListModel.Loading

    RssFeeds { id: rssFeeds }

    Row {
        Rectangle {

            id: sidePanel
            width: 220; height: window.height
            color: "#cfcfcf"

            ListView {
                focus: true
                id: categories
                anchors.fill: parent
                model: rssFeeds
                delegate: CategoryDelegate {}
                highlight: Rectangle { color: "#4d90fe" }
            }
            ScrollBar {
                scrollArea: categories;
                height: categories.height;
                width: 8
                anchors.right: categories.right
            }
            FormAddContent {
                id: formAdd
                anchors.bottom: sidePanel.anchors.bottom
                y: sidePanel.height - formAdd.height
            }
        }

        Browser {
            id: browser
            width: window.width - 220; height: window.height
            x: 0
            y: 0
            visible: false
        }

        NewsSpread {
            id: newsSpread
            width: window.width - 220; height: window.height
        }

    }
    //ScrollBar { scrollArea: newsSpread; height: newsSpread.height; width: 8; anchors.right: window.right }
    Rectangle { x: 220; height: window.height; width: 1; color: "#ffffff" }
}
