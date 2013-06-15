import QtQuick 2.0
import "vampire.js" as Vampire

Item {

     id: delegate
     width: delegate.ListView.view.width; height: 30

     Text {
         text: name
         color: delegate.ListView.isCurrentItem ? "white" : "black"
         font { family: "Ubuntu Medium"; pixelSize: 16; bold: false }
         anchors {
             left: parent.left; leftMargin: 15
             verticalCenter: parent.verticalCenter
         }
     }

     BusyIndicator {
         scale: 0.6
         //on: delegate.ListView.isCurrentItem && window.loading
         anchors { right: parent.right; rightMargin: 10; verticalCenter: parent.verticalCenter }
     }

     Rectangle {
         width: delegate.width; height: 1; color: "#cccccc"
         anchors.bottom: delegate.bottom
         visible: delegate.ListView.isCurrentItem ? false : true
     }

     Rectangle {
         width: delegate.width; height: 1; color: "white"
         visible: delegate.ListView.isCurrentItem ? false : true
     }

     MouseArea {
         anchors.fill: delegate
         onClicked: {
             delegate.ListView.view.currentIndex = index
             Vampire.categorySelected(delegate.ListView.view.currentIndex);
         }
     }
 }
