package web.AdminRelated;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Image;
import service.TaskService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/main/admin/exportData")
public class exportData extends HttpServlet  {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"data.csv\"");
//        告诉浏览器将响应内容作为一个文件下载，文件名是 data.csv。

        try (PrintWriter writer = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("taskId"));
            // 获取数据
            List<String[]> dataList = getDataFromDatabase(id);

            // 写入 CSV 文件
            for (String[] data : dataList) {
                writer.println(String.join(",", data));
            }
        }
    }

    private List<String[]> getDataFromDatabase(int id) {
        // 获取数据库数据的逻辑
        TaskService t=new TaskService();
        List<Image> image_list= null;
        try {
            image_list = t.getAllImageForTaskA(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        List<String[]> dataList = new ArrayList<>();
        for (Image a : image_list) {
            Map<String, Integer> mp = new HashMap<>();
            mp.put(a.getLabel1(), 1);

            if (mp.containsKey(a.getLabel2())) {
                mp.put(a.getLabel2(), mp.get(a.getLabel2()) + 1);
            } else mp.put(a.getLabel2(), 1);

            if (mp.containsKey(a.getLabel3())) {
                mp.put(a.getLabel3(), mp.get(a.getLabel3()) + 1);
            } else mp.put(a.getLabel3(), 1);

            if (mp.containsKey(a.getLabel4())) {
                mp.put(a.getLabel4(), mp.get(a.getLabel4()) + 1);
            } else mp.put(a.getLabel4(), 1);

            if (mp.containsKey(a.getLabel5())) {
                mp.put(a.getLabel5(), mp.get(a.getLabel5()) + 1);
            } else mp.put(a.getLabel5(), 1);

            if (mp.containsKey(a.getLabel6())) {
                mp.put(a.getLabel6(), mp.get(a.getLabel6()) + 1);
            } else mp.put(a.getLabel6(), 1);

            if (mp.containsKey(a.getLabel7())) {
                mp.put(a.getLabel7(), mp.get(a.getLabel7()) + 1);
            } else mp.put(a.getLabel7(), 1);

            int maxx = 0;
            String ans = null;
            for (Map.Entry<String, Integer> entry : mp.entrySet()) {
                String name = entry.getKey();
                int num = entry.getValue();
                if (num > maxx) {
                    maxx = num;
                    ans = name;
                }
            }
            dataList.add(new String[]{a.getImagePath(), ans});
        }
        return dataList;
    }
}
