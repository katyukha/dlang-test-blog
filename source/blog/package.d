module blog;

import vibe.http.router: URLRouter;
import vibe.web.web;

public import blog.web;


void register(URLRouter router){

    // register views
    auto postViewSettings = new WebInterfaceSettings();
    postViewSettings.urlPrefix = "/blog/";
    registerWebInterface(router, new PostView, postViewSettings);
}
