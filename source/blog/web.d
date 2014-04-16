module blog.web;

import blog.models;

import vibe.http.server: HTTPServerRequest;
import vibe.web.web;
import vibe.web.common;
import vibe.core.log;

import std.string: format;

class PostView {

    void index(){
        auto posts = Post.findAll();
        render!("blog/index.dt", posts);
    }

    void postAdd(HTTPServerRequest req){
        Post post = new Post();
        post.slug = req.form["slug"];
        post.title = req.form["title"];
        post.text = req.form["text"];
        post.save();
        redirect(format("/blog/%s/", post.slug));
    }

    @path("/:slug/")
    void getView(HTTPServerRequest req){
        string slug = req.params["slug"];
        auto post = Post.query().slug_eq(slug).find()[0];
        render!("blog/post/view.dt", post);
    }

}

