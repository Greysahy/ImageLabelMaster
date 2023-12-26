package pojo;

import java.sql.Timestamp;

public class Response {
    int postId;
    int floor;
    Timestamp postTime;
    String postContent;

    String username;

    public Response(int floor, Timestamp postTime, String postContent, String username) {
        this.floor = floor;
        this.postTime = postTime;
        this.postContent = postContent;
        this.username = username;
    }

    public Response(int postId, int floor, Timestamp postTime, String postContent, String username) {
        this.postId = postId;
        this.floor = floor;
        this.postTime = postTime;
        this.postContent = postContent;
        this.username = username;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Response{" +
                "postId=" + postId +
                ", floor=" + floor +
                ", postTime=" + postTime +
                ", postContent='" + postContent + '\'' +
                '}';
    }
}
