package service;

import JDBCUtil.PostJDBC;
import pojo.Post;

import java.util.List;

public class PostService {
    PostJDBC db = new PostJDBC();
    public List<Post> getAllPosts() throws Exception {
        return db.selectAllPosts();
    }

    public Post getPostById(int postId) throws Exception {
        return db.selectPostById(postId);
    }

    public void addPost(Post post) throws Exception {
        db.insertPost(post);
    }
}
