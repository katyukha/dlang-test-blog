import vibe.d;

import config: Config;
static import blog;

import vibe.core.log;
import std.conv;

shared static this()
{
    auto config = new Config();
    config.getOptions();

    auto router = new URLRouter;
    router.get("/", &hello);
    blog.register(router);


	listenHTTP(config.httpSettings, router);
}

void hello(HTTPServerRequest req, HTTPServerResponse res)
{
	res.writeBody("Hello, World!");
}
