package web.AdminRelated;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;

@WebServlet("/main/admin/deleteUser")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService us = new UserService();
        try {
            String c=req.getParameter("choice");

            if(c.equals("2")){
                us.deleteUser(req.getParameter("name"));
//                req.getRequestDispatcher("/administrator/userManagement.jsp").forward(req, resp);
                resp.sendRedirect(req.getContextPath()+"/main/administrator/userManagement.jsp?");
            }
            else if(c.equals("1")){
                String name = req.getParameter("query");
                us.selectUserByName(name);
//                req.setAttribute("name",name);
                String targetURL = "/administrator/userManagement.jsp";
//                req.getRequestDispatcher("/administrator/userManagement.jsp").forward(req, resp);
                resp.sendRedirect(req.getContextPath()+"/main/administrator/userManagement.jsp?name="+name);
            }
//
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
