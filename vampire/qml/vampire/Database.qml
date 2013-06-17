import QtQuick 2.0
import QtQuick.LocalStorage 2.0

import "vampire.js" as Vampire

Item {

    property var db

    signal ready

    Component.onCompleted: {
        dbCreate();
        dbCreateSchema();
        ready();
    }

    function dbCreate() {
        db = LocalStorage.openDatabaseSync("Vampie", "1.0", "Vampire", 100000, db);
        dbCreateSchema();

        return dbGetCategories().rows;
    }

    function dbCreateSchema() {
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS category (Id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL);");
        });
    }

    function dbAddCategory(category) {
        db.transaction(function(tx) {
            tx.executeSql("INSERT INTO category (name) VALUES (?);", [category]);
        });
    }

    function dbGetCategories() {

        var out = [];

        db.transaction(function(tx) {
            out = tx.executeSql("SELECT * FROM category;");
        });

        return out;
    }
}
