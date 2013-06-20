import QtQuick 2.0
import QtQuick.LocalStorage 2.0

import "vampire.js" as Vampire

Item {

    property var db

    signal ready

    Component.onCompleted: {
        dbCreate();
        //dbNuke();
        dbCreateSchema();
        ready();
    }

    function dbCreate() {
        db = LocalStorage.openDatabaseSync("Vampire", "1.0", "Vampire", 100000, db);
        LocalStorage.offLine
        dbCreateSchema();

        return dbGetCategories().rows;
    }

    function dbNuke() {
        db.transaction(function(tx) {
            tx.executeSql("DROP TABLE category;");
        });
        db.transaction(function(tx) {
            tx.executeSql("DROP TABLE feed;");
        });
    }

    function dbCreateSchema() {
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS category (category_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL);");
            tx.executeSql("CREATE TABLE IF NOT EXISTS feed (feed_id INTEGER PRIMARY KEY AUTOINCREMENT, category_id INT NOT NULL, name TEXT NOT NULL, url VARCHAR(255) NOT NULL);");
        });
    }

    function dbAddCategory(category) {
        db.transaction(function(tx) {
            tx.executeSql("INSERT INTO category (name) VALUES (?);", [category]);
        });
    }

    function dbAddFeed(categoryId, url) {
        db.transaction(function(tx) {
            tx.executeSql("INSERT INTO feed (category_id, name, url) VALUES (?, ?, ?);", [categoryId, "test", url]);
        });
    }

    function dbGetFeeds(categoryId) {

        var out = [];

        db.transaction(function(tx) {
            out = tx.executeSql("SELECT * FROM feed WHERE category_id = ?;", [categoryId]);
        });

        return out;
    }

    function dbGetCategories() {

        var out = [];

        db.transaction(function(tx) {
            out = tx.executeSql("SELECT * FROM category;");
        });

        return out;
    }
}
