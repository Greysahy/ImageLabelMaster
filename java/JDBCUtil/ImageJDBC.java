package JDBCUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ImageJDBC {
    public ImageJDBC() {
        super();
    }

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://121.199.5.54:3306/userdb", "root", "anhengyu1");
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        return DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root", "zukt8wrs6q");
    }

    public boolean insertTask(String taskId,String imagePath) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO image (taskId,imagePath) VALUES (?, ?)");
        ps.setString(1, taskId);
        ps.setString(2, imagePath);

        int n = ps.executeUpdate();
        return n >= 1;
    }

    public boolean insertImg(int imageId,int taskId,String imagePath) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO image (imageId,taskId,imagePath) VALUES (?,?, ?)");
        ps.setInt(1, imageId);
        ps.setInt(2, taskId);
        ps.setString(3, imagePath);
        int n = ps.executeUpdate();
        return n >= 1;
    }
}
