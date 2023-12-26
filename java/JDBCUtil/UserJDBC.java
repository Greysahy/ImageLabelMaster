package JDBCUtil;
import java.sql.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import pojo.User;

public class UserJDBC {

    public UserJDBC() {
        super();
    }

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://121.199.5.54:3306/userdb", "root", "anhengyu1");
    }

    public boolean insertUserInfo(User user) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("insert into cs_user (username, password) values (?, ?)");
        ps.setString(1, user.getUsername());
        ps.setString(2,user.getPassword());
        int n = ps.executeUpdate();
        conn.close();
        return n >= 1;
    }

    public boolean checkAccount(User user) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("select password from cs_user where username=?");
        ps.setString(1, user.getUsername());
        ResultSet rs = ps.executeQuery();
        String password = null;
        if(rs.next()) {
            password = rs.getString("password");
        }
        conn.close();
        return user.getPassword().equals(password);
    }

    public boolean isExist(User user) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from cs_user where username=?");
        ps.setString(1, user.getUsername());
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            return true;
        }
        conn.close();
        return false;
    }

    public User selectUser(String username) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from cs_user where username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        User newuser = null;
        if(rs.next()) {
            newuser  =  new User(
                    rs.getInt("userID"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getInt("type"),
                    rs.getString("tel"),
                    rs.getInt("score"),
                    rs.getString("college"),
                    rs.getString("headPath")
            );
        }
        conn.close();
        return newuser;
    }

    public List<User> selectAllUser() throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from cs_user");
        ResultSet rs = ps.executeQuery();
        List<User> userList = new ArrayList<>();
        User newuser = null;
        while(rs.next()) {
            newuser  =  new User(
                    rs.getInt("userID"),
                    rs.getString("username"),
                    rs.getInt("type"),
                    rs.getString("tel"),
                    rs.getInt("score"),
                    rs.getString("college"),
                    rs.getString("headPath")
            );
            userList.add(newuser);
        }
        return userList;
    }
    public User selectUserById(int userId) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from cs_user where userId=?");
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        User newuser = null;
        if(rs.next()) {
            newuser  =  new User(
                    rs.getInt("userID"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getInt("type"),
                    rs.getString("tel"),
                    rs.getInt("score"),
                    rs.getString("college"),
                    rs.getString("headPath")
            );
        }
        conn.close();
        return newuser;
    }

    public void updateUserScore(String username, int score) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("update cs_user set score=? where username=?");
        ps.setInt(1, score);
        ps.setString(2, username);
        ps.executeUpdate();
        conn.close();
    }
    public void updateUserHeadPath(String username, String headPath) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("update cs_user set headPath=? where username=?");
        ps.setString(1, headPath);
        ps.setString(2, username);
        ps.executeUpdate();
        conn.close();
    }


    public boolean deleteByName(String name) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("delete from cs_user where username = ?");
        ps.setString(1, name);
        int n = ps.executeUpdate();
        return n >= 1;
    }




    public List<User> selectUserByName(String name) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM cs_user WHERE username LIKE ?");
        ps.setString(1, "%"+name+"%");
        ResultSet rs = ps.executeQuery();
        List<User> userList = new ArrayList<>();
        User newuser = null;
        while(rs.next()) {
            newuser  =  new User(
                    rs.getInt("userID"),
                    rs.getString("username"),
                    rs.getInt("type"),
                    rs.getString("tel"),
                    rs.getInt("score"),
                    rs.getString("college"),
                    rs.getString("headPath")
            );
            userList.add(newuser);
        }
        return userList;
    }


}
