package web.ProductRelated;

import pojo.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/main/shoppingMall/singleProduct")
public class SingleProductServlet extends HttpServlet {
    ProductService service = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        String exchangeSuc = "";
        if (req.getAttribute("exchangeSuc") != null) {
            exchangeSuc = (String) req.getAttribute("exchangeSuc");
        }
        try {
            Product product = service.getProductsById(productId);
            req.setAttribute("product", product);
            req.setAttribute("exchangeSuc", exchangeSuc);
            req.getRequestDispatcher("/main/shoppingMall/singleProduct.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
