package JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import pojo.Record;
import service.RecordService;

public class RecordJDBC {
    public RecordJDBC() {
        super();
    }

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://121.199.5.54:3306/userdb", "root", "anhengyu1");
    }

    public void insertExchangeRecord(Record record) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("insert into exchange_record values (?, ?, ?, ?, ?)");
        ps.setInt(1, record.getProductId());
        ps.setString(2, record.getUsername());
        ps.setTimestamp(3, record.getExchangeDate());
        ps.setString(4, record.getProductName());
        ps.setInt(5, record.getScoreCost());
        ps.executeUpdate();
        conn.close();
    }

    public List<Record> getRecordByName(String username) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from exchange_record where username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        List<Record> records = new ArrayList<>();
        while(rs.next()) {
            int productId = rs.getInt("productId");
            String name = rs.getString("username");
            Timestamp time = rs.getTimestamp("exchangeTime");
            String productName = rs.getString("productName");
            int scoreCost = rs.getInt("score");
            Record record = new Record(productId, name, time, productName, scoreCost);
            records.add(record);
        }
        conn.close();
        return records;
    }
}
