module blog.models;

import dvorm;

@dbName("blogPost")
class Post {
     @dbId {
         string slug;
     }

     string title;
     string text;

     mixin OrmModel!Post;
}
