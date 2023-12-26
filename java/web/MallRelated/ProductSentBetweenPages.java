package web.MallRelated;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.Task;
import service.TaskService;
import service.UserService;

import java.io.IOException;
import java.util.List;
@WebServlet(urlPatterns = "/mall/ProductSentBetweenPages")
public class ProductSentBetweenPages extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 将商品信息存储到会话中
        try {
            String productId = request.getParameter("productId");

            TaskService service = new TaskService();
            HttpSession session = request.getSession();
            Task task=service.getTaskByTaskId(Integer.parseInt(productId));
            session.setAttribute("nowproduct", task);
            // 重定向到详情页面
           // System.out.println(getServletContext().getRealPath("/main/mall/task-page.jsp"));
            response.sendRedirect(request.getContextPath()+"/task-page.jsp");
            //request.getRequestDispatcher(request.getContextPath()+"/task-page.jsp").forward(request,response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
