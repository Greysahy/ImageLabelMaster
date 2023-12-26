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

@WebServlet(urlPatterns = "/main/shoppingMall/IndexPreview")
public class IndexPreviewServlet extends HttpServlet {
    ProductService service = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            List<Product> puProductsPreview = service.getPUProducts("学术科技与创新创业", -2147483647, 2147483647);
            List<Product> realProductsPreview = service.getRealProducts(-2147483647, 2147483647);
            List<Product> specialPowerPreview = service.getSpecialPowerProducts(-2147483647, 2147483647);
            req.setAttribute("puProductsPreview", puProductsPreview);
            req.setAttribute("realProductsPreview", realProductsPreview);
            req.setAttribute("specialPowerPreview", specialPowerPreview);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        req.getRequestDispatcher("/main/shoppingMall/mallIndex.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
