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
import java.util.Objects;

@WebServlet(urlPatterns = "/main/userspace/userspaceAllImage")
public class AllImageServlet extends HttpServlet {
    TaskService service = new TaskService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String tmp_taskId = req.getParameter("taskId");
            int taskId = 1;
            String tmp_labelColumn = req.getParameter("labelColumn");
            if (tmp_taskId == null) {
                taskId = (int)session.getAttribute("taskId");
            }
            else {
                taskId = Integer.parseInt(tmp_taskId);
            }
            if(tmp_labelColumn == null) {
                tmp_labelColumn = (String)session.getAttribute("labelColumn");
            }
            String labelColumn = tmp_labelColumn;
            List<Image> images = service.getAllImageForTask(taskId, labelColumn);
            session.setAttribute("allImages", images);
            session.setAttribute("taskId", taskId);
            session.setAttribute("labelColumn", labelColumn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/main/userspace/userWorkSpace_doWork.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
