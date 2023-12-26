package service;

import JDBCUtil.ProductJDBC;
import pojo.Product;

import java.util.List;

public class ProductService {
    ProductJDBC db = new ProductJDBC();
    public List<Product> getPUProducts(String type, int minPrice, int maxPrice) throws Exception {
        return db.selectProductByCondition("PU学分", type , minPrice , maxPrice);
    }

    public List<Product> getRealProducts(int minPrice, int maxPrice) throws Exception {
        return db.selectProductByCondition("实物奖品", "可兑换奖品", minPrice , maxPrice);
    }

    public List<Product> getSpecialPowerProducts(int minPrice, int maxPrice) throws Exception {
        return db.selectProductByCondition("特权权益", "可兑换奖品",  minPrice , maxPrice);
    }

    public Product getProductsById(int productId) throws Exception {
        return db.selectProductById(productId);
    }

    public void updateProductNum(int productId, int numOfLeft) throws Exception {
        db.ProductNumMinusOne(productId, numOfLeft);
    }
}
