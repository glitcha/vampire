import QtQuick 2.0
import QtWebKit 3.0

import "vampire.js" as Vampire

Item {

     id: container
     width: window.width
     height: window.height
     x: 0
     y: 0
     property alias url: webView.url

     Rectangle {
         height:30;
         width:parent.width
         anchors.right: parent.anchors.right
         color: "black"
     }

     Button {
         id: close_button
         y:0
         x:parent.width - (close_button.width + 10)
         height: 30
         width: 50
         anchors.right: parent.anchors.right;
         anchors.left: parent.anchors.left;
         onClicked: { Vampire.closeBrowser(); }
         caption: "Close"
     }

     WebView {
         id: webView
         y:30
         x:0
         height: parent.height - 30
         width: parent.width
     }

 }
