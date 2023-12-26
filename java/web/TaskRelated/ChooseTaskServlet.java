package web.TaskRelated;

import pojo.Task;
import service.TaskService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/main/mall/ChooseTask")
public class ChooseTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TaskService service = new TaskService();
        try {

            int productId = Integer.parseInt(req.getParameter("ChoosedProductId"));

            HttpSession session = req.getSession();
            if(service.ChooseTask(productId,(String)(session.getAttribute("username"))))
            {
                Task task = service.getTaskByTaskId(productId);
                session.setAttribute("nowproduct",task);
                session.setAttribute("has_chosen","true");
            }
            else {
                session.setAttribute("has_chosen","false");
            }
            req.getRequestDispatcher("/task-page.jsp").forward(req,resp);
             } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
