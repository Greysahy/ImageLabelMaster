package web.PostRelated;

import pojo.Response;
import service.ResponseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(urlPatterns = "/main/bbs/response")
public class ResponseServlet extends HttpServlet {
    ResponseService service = new ResponseService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        int postId = Integer.parseInt(req.getParameter("postId"));
        int floor = Integer.parseInt(req.getParameter("floor"));
        Timestamp postTime = new Timestamp(System.currentTimeMillis());
        String postContent = req.getParameter("post-content");
        String username = req.getParameter("username");

        Response response = new Response(postId, floor, postTime, postContent, username);
        try {
            service.addResponse(response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/main/bbs/singlePage?postId=" + postId).forward(req, resp);
    }
}
