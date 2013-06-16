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
         y:5
         x:parent.width - (close_button.width + 5)
         height: 20
         width: 30
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
