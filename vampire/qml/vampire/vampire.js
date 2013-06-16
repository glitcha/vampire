
function categorySelected(categoryId) {
    newsSpread.loadCategory(rssFeeds.get(categoryId));
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

}
