package pojo;
import java.sql.Timestamp;

public class Record {
    int productId;
    String username;
    Timestamp exchangeDate;
    String productName;
    int scoreCost;
    public Record(int productId, String username, Timestamp exchangeDate, String productName, int scoreCost) {
        this.productId = productId;
        this.username = username;
        this.exchangeDate = exchangeDate;
        this.productName = productName;
        this.scoreCost = scoreCost;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(Timestamp exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getScoreCost() {
        return scoreCost;
    }

    public void setScoreCost(int scoreCost) {
        this.scoreCost = scoreCost;
    }

    @Override
    public String toString() {
        return "Record{" +
                "productId=" + productId +
                ", username='" + username + '\'' +
                ", exchangeDate=" + exchangeDate +
                '}';
    }
}
