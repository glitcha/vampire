import QtQuick 2.0

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
        height: window.height
    }

    function loadCategory(selectedCategory) {

        category = selectedCategory;
        clearFeedSet();

        for (var i = 0; i < category.feeds.count; ++i) {

            var newsItemComponent = Qt.createComponent("NewsItem.qml");
            var newsItem = newsItemComponent.createObject(feedSet, {
                                                              caption: category.feeds.get(i).name,
                                                              feedURL: category.feeds.get(i).feed,
                                                              x: i * 300,
                                                              y: 20
                                                          });
        }
    }

    function clearFeedSet() {
        for (var i = 0; i < feedSet.children.length; ++i) {
             feedSet.children[i].destroy()
        }
    }

}
