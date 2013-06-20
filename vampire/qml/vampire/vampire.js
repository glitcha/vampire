function init() {

    loadCategories();
}

function loadCategories() {

    var categories = db.dbGetCategories().rows;
    var feeds = [];

    rssFeeds.clear();

    for(var i = 0; i < categories.length; i++) {

        feeds = db.dbGetFeeds(categories[i].id);
        rssFeeds.append({
                            'category_id' : categories[i].category_id,
                            'name' : categories[i].name,
                            'feeds' : feeds,
                        });
    }
}

function categorySelected(categoryIndex) {
    newsSpread.loadCategory(rssFeeds.get(categoryIndex));
    closeBrowser();
}


function openBrowser(link) {
    browser.url = link
    browser.visible = true
}

function closeBrowser() {
    browser.url = 'about:blank';
    browser.visible = false;
}

function formatDescription(description) {
    var out = description.replace(/(<([^>]+)>)/ig,"");
    out = out.split(" ").splice(0,20).join(" ") + '...';
    return out;
}

function addCategory(category) {
    db.dbAddCategory(category);
    loadCategories();
}

function addFeed(url) {
    db.dbAddFeed(1, url);
    loadCategories();
}
