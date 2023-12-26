package web.ProductRelated;

import pojo.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/main/shoppingMall/SpecialPowerProducts")
public class SpecialPowerServlet extends HttpServlet {
    ProductService service = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        int minScore = -2147483647;
        int maxScore = 2147483647;
        String tmp_minScore = req.getParameter("minScore");
        String tmp_maxScore = req.getParameter("maxScore");
        if (tmp_minScore != null && !tmp_minScore.isEmpty()) {
            minScore = Integer.parseInt(tmp_minScore);
        }
        if (tmp_maxScore != null && !tmp_maxScore.isEmpty()) {
            maxScore = Integer.parseInt(tmp_maxScore);
        }
        try {
            List<Product> products = service.getSpecialPowerProducts(minScore, maxScore);
            req.setAttribute("SpecialPowerProducts", products);
            req.getRequestDispatcher("/main/shoppingMall/specialPowerMall.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
