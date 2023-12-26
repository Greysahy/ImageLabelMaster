package web.AccountRelated;

import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet(urlPatterns = "/main/userspace/updateHeadPath")
@MultipartConfig
public class UpdateHeadPathServlet extends HttpServlet {
    UserService service = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Part filePart = req.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String savePath = getServletContext().getRealPath("/static/images/headImgs") + File.separator + fileName;
        String headPath = req.getContextPath() + "/static/images/headImgs" + File.separator + fileName;
        File directory = new File(savePath);
        if (!directory.exists()) {
            directory.mkdirs(); // 创建目录及其父目录
        }
        filePart.write(savePath);
        try {
            service.updateHeadPath((String) req.getSession().getAttribute("username"), headPath);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/main/userspace/userInfo").forward(req, resp);
    }
}
