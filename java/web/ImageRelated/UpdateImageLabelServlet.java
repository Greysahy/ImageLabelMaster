package web.ImageRelated;

import service.TaskService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet(urlPatterns = "/main/userspace/updateLabel")
public class UpdateImageLabelServlet extends HttpServlet {
    TaskService service = new TaskService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String fromPage = req.getParameter("fromPage");
        String classLabel = req.getParameter("classLabel");
        String labelColumn = (String) session.getAttribute("labelColumn");
        int imageId = Integer.parseInt(req.getParameter("imageId"));
        try {
            boolean res = service.doUpdateLabel(imageId, labelColumn, classLabel);
            req.getRequestDispatcher("/main/userspace/userspace" + fromPage).forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);

    }
}
