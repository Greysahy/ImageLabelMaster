package JDBCUtil;

import pojo.Log;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LogJDBC {
    public LogJDBC() {
        super();
    }

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://121.199.5.54:3306/userdb", "root", "anhengyu1");
//
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        return DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root", "zukt8wrs6q");
    }

    public List<Log> selectAllLog() throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from log");
        ResultSet rs = ps.executeQuery();
        List<Log> logs = new ArrayList<Log>();
        while(rs.next()) {
            String logName = rs.getString("logName");
            Log l = new Log(logName);
            logs.add(l);
        }
        return logs;
    }

    public boolean insertLog(String log) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO log (logName) VALUES (?)");
        ps.setString(1, log);
        int n = ps.executeUpdate();
        return n >= 1;
    }
}
