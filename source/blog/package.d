module blog;

import vibe.http.router: URLRouter;
import vibe.web.web;

public import blog.web;

import std.stdio;
import vibe.core.log;
import std.conv;

void register(URLRouter router){
    auto postViewSettings = new WebInterfaceSettings();
    postViewSettings.urlPrefix = "/blog/post";
    registerWebInterface(router, new PostView, postViewSettings);
}
