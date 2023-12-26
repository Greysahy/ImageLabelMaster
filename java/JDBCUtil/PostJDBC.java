package JDBCUtil;

import pojo.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostJDBC {
    public PostJDBC() {
        super();
    }
    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://121.199.5.54:3306/userdb", "root", "anhengyu1");
    }

    public List<Post> selectAllPosts() throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from post order by postTime desc");
        ResultSet rs = ps.executeQuery();
        List<Post> posts = new ArrayList<>();
        while(rs.next()) {
            int postId = rs.getInt("postId");
            Timestamp postTime = rs.getTimestamp("postTime");
            String postContent = rs.getString("postContent");
            String title = rs.getString("title");
            String username = rs.getString("username");

            Post post = new Post(postId, postTime, postContent, title, username);
            posts.add(post);
        }
        conn.close();
        return posts;
    }

    public Post selectPostById(int postId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from post where postId=?");
        ps.setInt(1, postId);
        ResultSet rs = ps.executeQuery();
        Post post = null;
        if(rs.next()) {
            int tmp_postId = rs.getInt("postId");
            Timestamp postTime = rs.getTimestamp("postTime");
            String postContent = rs.getString("postContent");
            String title = rs.getString("title");
            String username = rs.getString("username");

            post = new Post(tmp_postId, postTime, postContent, title, username);
        }
        return post;
    }

    public void insertPost(Post post) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("insert into post values(default, ?, ?, ?, ?)");
        ps.setTimestamp(1, post.getPostTime());
        ps.setString(2, post.getPostContent());
        ps.setString(3, post.getTitle());
        ps.setString(4, post.getUsername());
        ps.executeUpdate();
    }
}
