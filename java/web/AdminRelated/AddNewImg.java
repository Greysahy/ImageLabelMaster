package web.AdminRelated;

import JDBCUtil.ImageJDBC;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import service.LogService;
import service.Login;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(urlPatterns = "/main/admin/AddNewImg")
public class AddNewImg extends HttpServlet {
    Login log = new Login();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int imageId = Integer.parseInt(req.getParameter("imageId"));
            int taskId = Integer.parseInt(req.getParameter("taskId"));
            String imgPath=req.getParameter("imagePath");

            ImageJDBC img = new ImageJDBC();
            img.insertImg(imageId,taskId,imgPath);


            //添加日志
            LogService logS=new LogService();
            //获取当下时间
            LocalDateTime now = LocalDateTime.now(); // 获取当前时间
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 定义日期时间格式
            String formattedDateTime = now.format(formatter); // 格式化日期时间为字符串
            String text="有新图片添加:     "+"图片隶属于的任务: "+taskId+"     时间: "+formattedDateTime+"!";
            logS.InsertLog(text);

            resp.sendRedirect(req.getContextPath()+"/main/administrator/showImageResult.jsp?taskId="+taskId);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
