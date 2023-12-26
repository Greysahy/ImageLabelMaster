package web.AccountRelated;

import pojo.Record;
import service.RecordService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/main/userspace/userInfo")
public class UserInfoServlet extends HttpServlet {
    UserService service = new UserService();
    RecordService recordService = new RecordService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String)req.getSession().getAttribute("username");
        try {
            List<Record> records = recordService.getRecordsList(username);
            req.setAttribute("exchangeRecords", records);
            req.setAttribute("user", service.getUser(username));
            req.getRequestDispatcher("/main/userspace/userInformation.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
