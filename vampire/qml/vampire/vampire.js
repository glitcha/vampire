
function categorySelected(categoryId) {
    newsSpread.loadCategory(rssFeeds.get(categoryId));
    closeBrowser();
}

function openBrowser(link) {

    browser.url = link
    browser.visible = true
}

function closeBrowser() {
    browser.visible = false;
    browser.url = 'about:blank';
}
