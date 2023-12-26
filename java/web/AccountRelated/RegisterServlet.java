package web.AccountRelated;

import pojo.User;
import service.Register;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/account/register")
public class RegisterServlet extends HttpServlet {
    Register reg = new Register();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = new User(username, password);
        try {
            req.setAttribute("username", username);
            req.setAttribute("password", password);
            boolean res = reg.addUser(user);
            if(res) {
                req.setAttribute("registerSuccess", true);
                req.getRequestDispatcher("/account/regSuc.jsp").forward(req, resp);
            }
            else {
                req.setAttribute("registerSuccess", false);
                req.getRequestDispatcher("/account/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
