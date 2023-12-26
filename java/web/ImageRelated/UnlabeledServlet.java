package web.ImageRelated;

import pojo.Image;
import service.TaskService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/main/userspace/userspaceUnlabeled")
public class UnlabeledServlet extends HttpServlet {
    TaskService service = new TaskService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            int taskId = (int)session.getAttribute("taskId");
            String labelColumn = (String) session.getAttribute("labelColumn");
            List<Image> images = service.getUnlabeledImageForTask(taskId, labelColumn);
            session.setAttribute("unlabeledImages", images);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/main/userspace/userWorkSpace_unlabeled.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

}