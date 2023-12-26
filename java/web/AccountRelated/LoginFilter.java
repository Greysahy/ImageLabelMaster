package web.AccountRelated;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/main/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        if (req.getSession().getAttribute("username") != null) {
            // 用户已登录，继续请求
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            // 用户未登录，重定向到登录页面
            resp.sendRedirect(req.getContextPath() + "/account/login.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
