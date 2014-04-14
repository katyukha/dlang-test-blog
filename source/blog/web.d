module blog.web;

//import blog.models;


import vibe.web.web;
import vibe.web.common;

class PostView {

    void index(){
         string test="TEST";
         render!("blog/index.dt", test);
    }

}

