module blog.models;

import dvorm;

import std.string: format;


@dbName("blogPost")
class Post {
     @dbId {
         string slug;
     }

     string title;
     string text;

     string getURL(){
         return format("/blog/%s/", slug);
     }

     mixin OrmModel!Post;
}
