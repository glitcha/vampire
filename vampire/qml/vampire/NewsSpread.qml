import QtQuick 2.0
import QtQuick.LocalStorage 2.0 as Ls
import Ubuntu.Components 0.1

import "vampire.js" as Vampire

Item {
    id: container
    height: window.height
    width: delegate.ListView.view.width

    property QtObject category: null

    Rectangle {
        color: "#e5e5e5"
        height: window.height
        x: 0
        y: 0
        anchors.fill: parent
    }

    Column {
        id: feedSet
        x: 0
        y: 0
        width: window.width
        height: window.height - 30
        clip: true
    }

    Rectangle {
        color: "#d8d8d8"
        height: 30
        width: parent.width
        y: window.height - 30
        x:0
        FormAddFeed {
            id: formAddFeed
        }
    }

    function loadCategory(selectedCategory) {

        category = selectedCategory;
        clearFeedSet();

        for (var i = 0; i < category.feeds.count; ++i) {

            var newsItemComponent = Qt.createComponent("NewsItem.qml");
            var newsItem = newsItemComponent.createObject(feedSet, {
                                                              caption: category.feeds.get(i).name,
                                                              feedURL: category.feeds.get(i).url,
                                                              x: i * 300,
                                                              y: 5
                                                          });
        }
    }

    function clearFeedSet() {
        for (var i = 0; i < feedSet.children.length; ++i) {
             feedSet.children[i].destroy()
        }
    }

}
