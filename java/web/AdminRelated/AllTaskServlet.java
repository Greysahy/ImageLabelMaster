package web.AdminRelated;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Task;
import service.TaskService;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/main/admin/userspace/allTask")
public class AllTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TaskService service = new TaskService();
        try {
            List<Task> tasks = service.getAllTask();
            req.setAttribute("tasks", tasks);
            req.getRequestDispatcher("/main/userspace/userWorkSpace_allWork.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
