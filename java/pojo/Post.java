package pojo;

import java.sql.Timestamp;

public class Post {
    int postId;
    Timestamp postTime;
    String postContent;
    String title;

    String username;

    public Post(int postId, Timestamp postTime, String postContent, String title, String username) {
        this.postId = postId;
        this.postTime = postTime;
        this.postContent = postContent;
        this.title = title;
        this.username = username;
    }

    public Post(Timestamp postTime, String postContent, String title, String username) {
        this.postTime = postTime;
        this.postContent = postContent;
        this.title = title;
        this.username = username;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Timestamp getPostTime() {
        return postTime;
    }

    public void setPostTime(Timestamp postTime) {
        this.postTime = postTime;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
