package JDBCUtil;


import pojo.Response;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResponseJDBC {
    public ResponseJDBC() {
        super();
    }
    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://121.199.5.54:3306/userdb", "root", "anhengyu1");
    }

    public List<Response> selectAllResponse(int postId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from response where postId=? order by floor asc");
        ps.setInt(1, postId);
        ResultSet rs = ps.executeQuery();
        List<Response> responses = new ArrayList<>();
        while(rs.next()) {
            int floor = rs.getInt("floor");
            Timestamp postTime = rs.getTimestamp("postTime");
            String postContent = rs.getString("postContent");
            String username = rs.getString("username");

            Response response = new Response(postId, floor, postTime, postContent, username);
            responses.add(response);
        }
        conn.close();
        return responses;
    }

    public void insertResponse(Response response) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("insert into response values(?, ?, ?, ?, ?)");
        ps.setInt(1, response.getPostId());
        ps.setInt(2, response.getFloor());
        ps.setTimestamp(3, response.getPostTime());
        ps.setString(4,response.getPostContent());
        ps.setString(5, response.getUsername());
        ps.executeUpdate();
        conn.close();
    }
}

