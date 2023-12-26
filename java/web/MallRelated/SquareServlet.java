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

@WebServlet(urlPatterns = "/mall/AllTask")
public class SquareServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TaskService service = new TaskService();
        //String username = (String)req.getSession().getAttribute("username");
        //UserService userservice = new UserService();
        try {
            HttpSession session = req.getSession();
            //session.setAttribute("user", userservice.getUser(username));
            List<Task> tasks = service.getAllTask();
            session.setAttribute("tasklist", tasks);
            resp.sendRedirect(req.getContextPath()+"/main.jsp");
            //req.getRequestDispatcher(req.getContextPath()+"/main.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
