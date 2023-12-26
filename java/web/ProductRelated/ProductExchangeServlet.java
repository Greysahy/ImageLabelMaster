package web.ProductRelated;

import pojo.Product;
import pojo.User;
import pojo.Record;
import service.ProductService;
import service.RecordService;
import service.TaskService;
import service.UserService;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/main/shoppingMall/exchange")
public class ProductExchangeServlet extends HttpServlet {
    UserService userservice = new UserService();
    ProductService productservice = new ProductService();
    RecordService recordservice = new RecordService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getSession().getAttribute("username");
        int productId = Integer.parseInt(req.getParameter("productId"));
        try {
            User user = userservice.getUser(username);
            Product product = productservice.getProductsById(productId);
            String exchangeSuc = "false";
            int balance = user.getScore() - product.getScorePrice();
            if(balance >= 0 && product.getNumOfLeft() > 0) {
                exchangeSuc = "true";
                userservice.updateScore(username, balance);
                productservice.updateProductNum(productId, product.getNumOfLeft() - 1);
                Record record = new Record(productId, username, new Timestamp(System.currentTimeMillis()), product.getProductName(), product.getScorePrice());
                recordservice.insertRecord(record);
            }
            req.setAttribute("exchangeSuc", exchangeSuc);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/main/shoppingMall/singleProduct?productId="+productId).forward(req, resp);
    }
}
