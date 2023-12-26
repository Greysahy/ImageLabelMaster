package web.PostRelated;

import pojo.Post;
import pojo.Response;
import pojo.User;
import service.PostService;
import service.ResponseService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(urlPatterns = "/main/bbs/singlePage")
public class SinglePostServlet extends HttpServlet {
    ResponseService responseService = new ResponseService();
    PostService postService = new PostService();
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 查询本页所有的回复
        int postId = Integer.parseInt(req.getParameter("postId"));
        try {
            Map<Response, User> responses = responseService.getAllResponseWithUserInfo(postId);
            Post post = postService.getPostById(postId);
            User user = userService.getUser(post.getUsername());
            req.setAttribute("responses", responses);
            req.setAttribute("post", post);
            req.setAttribute("head", user);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/main/bbs/bbsSinglePage.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
