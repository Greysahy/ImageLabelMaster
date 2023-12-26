package pojo;

public class Product {
    int productId;
    String productName;
    int scorePrice;
    int numOfLeft;
    String coverPath;
    String type;

    String category;

    public Product(int productId, String productName, int scorePrice, int numOfLeft, String coverPath, String type, String category) {
        this.productId = productId;
        this.productName = productName;
        this.scorePrice = scorePrice;
        this.numOfLeft = numOfLeft;
        this.coverPath = coverPath;
        this.type = type;
        this.category = category;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getScorePrice() {
        return scorePrice;
    }

    public void setScorePrice(int scorePrice) {
        this.scorePrice = scorePrice;
    }

    public int getNumOfLeft() {
        return numOfLeft;
    }

    public void setNumOfLeft(int numOfLeft) {
        this.numOfLeft = numOfLeft;
    }

    public String getCoverPath() {
        return coverPath;
    }

    public void setCoverPath(String coverPath) {
        this.coverPath = coverPath;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", scorePrice=" + scorePrice +
                ", numOfLeft=" + numOfLeft +
                ", coverPath='" + coverPath + '\'' +
                ", type='" + type + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
