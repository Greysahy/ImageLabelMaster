package web.AdminRelated;

import JDBCUtil.ImageJDBC;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import service.LogService;
import service.Login;
import service.TaskService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(urlPatterns = "/main/admin/publishNewTask")
public class publishNewTask extends HttpServlet {
    Login log = new Login();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TaskService t=new TaskService();
        req.setCharacterEncoding("UTF-8");
        try {
            int id= Integer.parseInt(req.getParameter("taskId"));
//            String label=req.getParameter("labelColumn");
            boolean check=t.isExistTask(id);

            if (check) {
                // 如果任务存在，将任务存在的信息放入 request 属性中
                req.setAttribute("isExist", true);
                req.getRequestDispatcher("/main/administrator/publishTask.jsp").forward(req,resp);
            } else {
                // 如果任务不存在，将任务信息保存到数据库,并写图片
                String taskId = req.getParameter("taskId");
                String taskName = req.getParameter("taskName");
                String numOfProblems = req.getParameter("numOfProblems");
                String numOfLabel = req.getParameter("numOfLabel");
                String username = req.getParameter("username");
                String awardScore = req.getParameter("awardScore");
                String submitted = req.getParameter("submitted");
                String description = req.getParameter("description");
                String coverPath=req.getParameter("coverPath");

                for(int i=1;i<=7;i++){
                    String s="label"+(char) (i + 48);
                    t.insertTask(taskId,taskName,numOfProblems,numOfLabel,username,awardScore,submitted,description,coverPath,s);
                }
                resp.sendRedirect(req.getContextPath()+"/main/administrator/taskManagement.jsp");

                String path=req.getParameter("imgPath");
                if(path!=null){
                    ImageJDBC img = new ImageJDBC();
                    String webAppPath = getServletContext().getRealPath("/");
                    String imagePath = webAppPath + "static/images/"+path;
                    List<String> imageFiles=ImageScanner.getImagesInDirectory(imagePath);
                    for (String imageName : imageFiles) {
                        String imgPath="/ImageLabelMaster/static/images/"+path+"/"+imageName;
                        img.insertTask(taskId,imgPath);
                    }
                }


                //添加日志
                LogService logS=new LogService();
                //获取当下时间
                LocalDateTime now = LocalDateTime.now(); // 获取当前时间
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 定义日期时间格式
                String formattedDateTime = now.format(formatter); // 格式化日期时间为字符串
                String text="有新任务发布:     "+"任务名称: "+taskName+"     发布任务时间: "+formattedDateTime+"!";
                logS.InsertLog(text);

            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
