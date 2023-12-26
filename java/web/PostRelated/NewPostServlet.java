package web.PostRelated;

import pojo.Post;
import service.PostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(urlPatterns = "/main/bbs/newPost")
public class NewPostServlet extends HttpServlet {
    PostService service = new PostService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         // 添加新帖子
        req.setCharacterEncoding("utf-8");
        String postContent = req.getParameter("post-content");
        String title = req.getParameter("title-content");
        String username = (String) req.getSession().getAttribute("username");
        Timestamp postTime = new Timestamp(System.currentTimeMillis());
        Post post = new Post(postTime, postContent, title, username);
        try {
            service.addPost(post);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/main/bbs/allPosts").forward(req, resp);
    }
}
