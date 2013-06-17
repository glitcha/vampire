import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 0.1

import "vampire.js" as Vampire

Rectangle {

    id: window
    width: 800; height: 480

    SystemPalette { id: systemPalette; colorGroup: SystemPalette.Active }
    RssFeeds { id: rssFeeds }

    Database {
        id: db
        onReady: Vampire.init();
    }

    property string currentFeed: "rss.news.yahoo.com/rss/topstories"

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

    Rectangle { x: 220; height: window.height; width: 1; color: "#ffffff" }
}
