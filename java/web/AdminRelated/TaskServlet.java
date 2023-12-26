package web.AdminRelated;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Task;
import service.LogService;
import service.TaskService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(urlPatterns = "/main/admin/TaskServlet")
public class TaskServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TaskService service = new TaskService();
        req.setCharacterEncoding("UTF-8");
        try {
            int id= Integer.parseInt(req.getParameter("id"));
            String name=req.getParameter("taskName");
            String label=req.getParameter("label");
            int score= Integer.parseInt(req.getParameter("score"));
            String des=req.getParameter("des");
            service.UpdateTask(id,name,score,des,label);
            List<Task> tasks = service.getAllTask();
            req.setAttribute("tasks", tasks);
//            req.getRequestDispatcher("/administrator/taskManagement.jsp").forward(req, resp);

            //添加日志
            LogService logS=new LogService();
            //获取当下时间
            LocalDateTime now = LocalDateTime.now(); // 获取当前时间
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 定义日期时间格式
            String formattedDateTime = now.format(formatter); // 格式化日期时间为字符串
            String text="有任务修改:     "+"任务名称: "+name+"     修改任务时间: "+formattedDateTime+"!";
            logS.InsertLog(text);

            resp.sendRedirect(req.getContextPath()+"/main/administrator/taskManagement.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
