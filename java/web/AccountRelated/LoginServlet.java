package web.AccountRelated;

import pojo.User;
import service.Login;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/account/login")
public class LoginServlet extends HttpServlet {
    Login log = new Login();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String rememberMe = req.getParameter("rememberMe");
        User user = new User(username, password);
        try {
            req.setAttribute("username", username);
            req.setAttribute("password", password);
            if (log.isAuthorized(user)) {
                HttpSession session = req.getSession();
                UserService userservice = new UserService();
                session.setAttribute("user", userservice.getUser(username));
                session.setAttribute("username", username);
                if(rememberMe != null && rememberMe.equals("on")) {
                    Cookie usernameCookie = new Cookie("username", username);
                    Cookie passwordCookie = new Cookie("password", password);
                    Cookie checkboxCookie = new Cookie("checkboxStatus", "checked");
                    usernameCookie.setMaxAge(7 * 24 * 60 * 60); // 设置 Cookie 过期时间为一周
                    passwordCookie.setMaxAge(7 * 24 * 60 * 60);
                    checkboxCookie.setMaxAge(7 * 24 * 60 * 60);
                    resp.addCookie(usernameCookie);
                    resp.addCookie(passwordCookie);
                    resp.addCookie(checkboxCookie);
                }
                else
                {
                    Cookie[] cookies = req.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            cookie.setMaxAge(0);
                            resp.addCookie(cookie);
                        }
                    }
                }
                User judgeUser = (User) session.getAttribute("user");
                if(judgeUser.getType() == 0) {
                    req.getRequestDispatcher("/mall/AllTask").forward(req, resp);
                }
                else {
                    req.getRequestDispatcher("/main/administrator/userManagement.jsp").forward(req, resp);
                }
            }
            else {
                req.setAttribute("loginError", "密码错误！");
                req.getRequestDispatcher("/account/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
