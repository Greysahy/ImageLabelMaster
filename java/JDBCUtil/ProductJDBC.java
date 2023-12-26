package JDBCUtil;
import java.sql.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import pojo.Product;

public class ProductJDBC {

    public ProductJDBC() {
        super();
    }

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://121.199.5.54:3306/userdb", "root", "anhengyu1");
    }

    public List<Product> selectProductByCondition(String category, String type, int minPrice, int maxPrice) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = null;
        if(type != null) {
            ps = conn.prepareStatement("select * from product where category=? " +
                    "and type=? and scorePrice between ? and ?");
            ps.setString(1, category);
            ps.setString(2, type);
            ps.setInt(3, minPrice);
            ps.setInt(4, maxPrice);
        }else {
            ps = conn.prepareStatement("select * from product where category=? " +
                    "and scorePrice between ? and ?");
            ps.setString(1, category);
            ps.setInt(2, minPrice);
            ps.setInt(3, maxPrice);
        }
        ResultSet rs = ps.executeQuery();
        List<Product> products = new ArrayList<Product>();
        while(rs.next()) {
            int productId = rs.getInt("productId");
            String productName = rs.getString("productName");
            int scorePrice = rs.getInt("scorePrice");
            int numOfLeft = rs.getInt("numOfLeft");
            String coverPath = rs.getString("coverPath");
            String ptype = rs.getString("type");
            String pcategory = rs.getString("category");
            Product product = new Product(productId, productName, scorePrice, numOfLeft, coverPath, ptype, pcategory);
            products.add(product);
        }
        conn.close();
        return products;
    }

    public Product selectProductById(int productId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from product where productId=?");
            ps.setInt(1, productId);
        ResultSet rs = ps.executeQuery();
        List<Product> products = new ArrayList<Product>();
        if(rs.next()) {
            int pproductId = rs.getInt("productId");
            String productName = rs.getString("productName");
            int scorePrice = rs.getInt("scorePrice");
            int numOfLeft = rs.getInt("numOfLeft");
            String coverPath = rs.getString("coverPath");
            String ptype = rs.getString("type");
            String pcategory = rs.getString("category");

            return new Product(pproductId, productName, scorePrice, numOfLeft, coverPath, ptype, pcategory);
        }
        conn.close();
        return null;
    }

    public void ProductNumMinusOne(int productId, int numOfLeft) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("update product set numOfLeft=? where productId=?");
        ps.setInt(1, numOfLeft);
        ps.setInt(2, productId);
        ps.executeUpdate();
        conn.close();
    }
}
