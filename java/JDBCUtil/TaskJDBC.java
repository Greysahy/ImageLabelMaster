package JDBCUtil;

import pojo.Image;
import pojo.Task;
import pojo.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;

public class TaskJDBC {
    public TaskJDBC() {
        super();
    }

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://121.199.5.54:3306/userdb", "root", "anhengyu1");
    }


    public List<Task> selectAllTask() throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from task ");
        List<Task> tasks = new ArrayList<Task>();
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            int taskId = rs.getInt("taskId");
            String taskName = rs.getString("taskName");
            int numOfProblems = rs.getInt("numOfProblems");
            int numOfLabeled = rs.getInt("numOfLabeled");
            String userName = rs.getString("userName");
            String coverPath = rs.getString("coverPath");
            boolean submitted = rs.getBoolean("submitted");
            String labelColumn=rs.getString("labelColumn");
            int awardScore=rs.getInt("awardScore");
            String des=rs.getString("description");

            Task task = new Task(taskId, userName, taskName, numOfProblems, numOfLabeled, coverPath, submitted,labelColumn,awardScore,des);

            tasks.add(task);
        }
        return tasks;
    }
    public Task getTaskById(int taskId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from task where taskId=?");
        ps.setInt(1, taskId);
        ResultSet rs = ps.executeQuery();
        Task target = null;
        while(rs.next()) {
            int taskid = rs.getInt("taskId");
            String taskName = rs.getString("taskName");
            int numOfProblems = rs.getInt("numOfProblems");
            int numOfLabeled = rs.getInt("numOfLabeled");
            String userName = rs.getString("userName");
            String coverPath = rs.getString("coverPath");
            boolean submitted = rs.getBoolean("submitted");
            int awardScore = rs.getInt("awardScore");
            String description = rs.getString("description");
            target = new Task(taskId, userName, taskName, numOfProblems, numOfLabeled, coverPath, submitted,awardScore,description);


        }
        return target;
    }


    public Task updateTaskStatus(Task task) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement numAll = conn.prepareStatement("select count(*) from image where taskId=?");
        numAll.setInt(1, task.getTaskId());
        PreparedStatement numSolved = conn.prepareStatement("select count(*) from image where taskId=? and label!=?");
        numSolved.setInt(1, task.getTaskId());
        numSolved.setString(2, "null");
        PreparedStatement updateTask = conn.prepareStatement("update task set numOfProblems=?, numOfLabeled=? where taskId=?");
        ResultSet rs1 = numAll.executeQuery();
        ResultSet rs2 = numSolved.executeQuery();
        int numOfProblems = 0, numOfLabeled = 0;
        if(rs1.next()) {
            numOfProblems = rs1.getInt(1);
        }
        if(rs2.next()) {
            numOfLabeled = rs2.getInt(1);
        }
        updateTask.setInt(1, numOfProblems);
        updateTask.setInt(2, numOfLabeled);
        updateTask.setInt(3, task.getTaskId());
        updateTask.executeUpdate();
        task.setNumOfProblems(numOfProblems);
        task.setNumOfLabeled(numOfLabeled);
        conn.close();
        return task;
    }
    public void submitTask(int taskId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("update task set submitted=? where taskId=?");
        ps.setBoolean(1, true);
        ps.setInt(2, taskId);
        ps.executeUpdate();
        conn.close();
    }
    public List<Image> selectAllImageForTask(int taskId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from image where taskId=?");
        ps.setInt(1, taskId);
        ResultSet rs = ps.executeQuery();
        List<Image> images = new ArrayList<Image>();
        while(rs.next()) {
            int curImageId = rs.getInt("imageId");
            int curTaskId = rs.getInt("taskId");
            String curImagePath = rs.getString("imagePath");
            String curLabel = rs.getString("label");
            Image curimage = new Image(curImageId, curTaskId, curImagePath, curLabel);
            images.add(curimage);
        }
        conn.close();
        return images;
    }

    public List<Image> selectAllImageForTaskA(int taskId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from image where taskId=?");
        ps.setInt(1, taskId);
        ResultSet rs = ps.executeQuery();
        List<Image> images = new ArrayList<Image>();
        while(rs.next()) {
            int curImageId = rs.getInt("imageId");
            int curTaskId = rs.getInt("taskId");
            String curImagePath = rs.getString("imagePath");
            String Label1 = rs.getString("label1");
            String Label2 = rs.getString("label2");
            String Label3 = rs.getString("label3");
            String Label4 = rs.getString("label4");
            String Label5 = rs.getString("label5");
            String Label6 = rs.getString("label6");
            String Label7 = rs.getString("label7");

            Image curimage = new Image(curImageId, curTaskId, curImagePath,Label1,Label2,Label3,Label4,Label5,Label6,Label7);
            images.add(curimage);
        }
        return images;
    }

    public List<Image> selectUnlabeledImageForTask(int taskId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from image where taskId=? and label=?");
        ps.setInt(1, taskId);
        ps.setString(2, "null");
        ResultSet rs = ps.executeQuery();
        List<Image> images = new ArrayList<Image>();
        while(rs.next()) {
            int curImageId = rs.getInt("imageId");
            int curTaskId = rs.getInt("taskId");
            String curImagePath = rs.getString("imagePath");
            String curLabel = rs.getString("label");
            Image curimage = new Image(curImageId, curTaskId, curImagePath, curLabel);
            images.add(curimage);
        }
        conn.close();
        return images;
    }

    public List<Image> selectLabeledImageForTask(int taskId) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from image where taskId=? and label != ?");
        ps.setInt(1, taskId);
        ps.setString(2, "null");
        ResultSet rs = ps.executeQuery();
        List<Image> images = new ArrayList<Image>();
        while(rs.next()) {
            int curImageId = rs.getInt("imageId");
            int curTaskId = rs.getInt("taskId");
            String curImagePath = rs.getString("imagePath");
            String curLabel = rs.getString("label");
            Image curimage = new Image(curImageId, curTaskId, curImagePath, curLabel);
            images.add(curimage);
        }
        conn.close();
        return images;
    }
    public boolean ChooseTask(int taskId,String username) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("update task set username=? where taskId=?");
        ps.setString(1, username);
        ps.setInt(2, taskId);
        int n = ps.executeUpdate();
        conn.close();
        return n >= 1;
    }
    public boolean UpdateLabel(int imageId, String label) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("update image set label=? where imageId=?");
        ps.setString(1, label);
        ps.setInt(2, imageId);
        int n = ps.executeUpdate();
        conn.close();
        return n >= 1;
    }


    public List<Task> selectAllTask(String username) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from task where userName=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        List<Task> tasks = new ArrayList<Task>();
        while(rs.next()) {
            int taskId = rs.getInt("taskId");
            String taskName = rs.getString("taskName");
            int numOfProblems = rs.getInt("numOfProblems");
            int numOfLabeled = rs.getInt("numOfLabeled");
            String userName = rs.getString("userName");
            int score = rs.getInt("awardScore");
            String coverPath = rs.getString("coverPath");
            boolean submitted = rs.getBoolean("submitted");
            String description = rs.getString("description");
            String labelColumn = rs.getString("labelColumn");

            Task task = new Task(taskId, userName, taskName, numOfProblems, numOfLabeled, coverPath, submitted, score, description, labelColumn);
            task = updateTaskStatus(task, labelColumn);
            tasks.add(task);
        }
        conn.close();
        return tasks;
    }


    public boolean UpdataTask(int id, String name, int score, String des,String label) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("UPDATE task SET taskName=?, awardScore=?, description=? WHERE taskId=? AND labelColumn=?");
        ps.setString(1, name);
        ps.setInt(2,score);
        ps.setString(3, des);
        ps.setInt(4, id);
        ps.setString(5, label);
        int n = ps.executeUpdate();
        return n >= 1;
    }


    public Task updateTaskStatus(Task task, String labelColumn) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement numAll = conn.prepareStatement("select count(*) from image where taskId=?");
        numAll.setInt(1, task.getTaskId());
        PreparedStatement numSolved = conn.prepareStatement("select count(*) from image where taskId=? and " + labelColumn + " != ?");
        numSolved.setInt(1, task.getTaskId());
        numSolved.setString(2, "null");
        PreparedStatement updateTask = conn.prepareStatement("update task set numOfProblems=?, numOfLabeled=? where taskId=?");
        ResultSet rs1 = numAll.executeQuery();
        ResultSet rs2 = numSolved.executeQuery();
        int numOfProblems = 0, numOfLabeled = 0;
        if(rs1.next()) {
            numOfProblems = rs1.getInt(1);
        }
        if(rs2.next()) {
            numOfLabeled = rs2.getInt(1);
        }
        updateTask.setInt(1, numOfProblems);
        updateTask.setInt(2, numOfLabeled);
        updateTask.setInt(3, task.getTaskId());
        updateTask.executeUpdate();
        task.setNumOfProblems(numOfProblems);
        task.setNumOfLabeled(numOfLabeled);
        conn.close();
        return task;
    }

    public List<Image> selectAllImageForTask(int taskId, String labelColumn) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from image where taskId=?");
        ps.setInt(1, taskId);
        ResultSet rs = ps.executeQuery();
        List<Image> images = new ArrayList<Image>();
        while(rs.next()) {
            int curImageId = rs.getInt("imageId");
            int curTaskId = rs.getInt("taskId");
            String curImagePath = rs.getString("imagePath");
            String curLabel = rs.getString(labelColumn);
            Image curimage = new Image(curImageId, curTaskId, curImagePath, curLabel);
            images.add(curimage);
        }
        conn.close();
        return images;
    }

    public List<Image> selectUnlabeledImageForTask(int taskId, String labelColumn) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from image where taskId=? and " + labelColumn + " =?");
        ps.setInt(1, taskId);
        ps.setString(2, "null");
        ResultSet rs = ps.executeQuery();
        List<Image> images = new ArrayList<Image>();
        while(rs.next()) {
            int curImageId = rs.getInt("imageId");
            int curTaskId = rs.getInt("taskId");
            String curImagePath = rs.getString("imagePath");
            String curLabel = rs.getString(labelColumn);
            Image curimage = new Image(curImageId, curTaskId, curImagePath, curLabel);
            images.add(curimage);
        }
        conn.close();
        return images;
    }

    public List<Image> selectLabeledImageForTask(int taskId, String labelColumn) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from image where taskId=? and " + labelColumn + " != ?");
        ps.setInt(1, taskId);
        ps.setString(2, "null");
        ResultSet rs = ps.executeQuery();
        List<Image> images = new ArrayList<Image>();
        while(rs.next()) {
            int curImageId = rs.getInt("imageId");
            int curTaskId = rs.getInt("taskId");
            String curImagePath = rs.getString("imagePath");
            String curLabel = rs.getString(labelColumn);
            Image curimage = new Image(curImageId, curTaskId, curImagePath, curLabel);
            images.add(curimage);
        }
        conn.close();
        return images;
    }

    public boolean UpdateLabel(int imageId, String labelColumn, String label) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("UPDATE image SET " + labelColumn + " = ? WHERE imageId = ?");
        ps.setString(1, label);
        ps.setInt(2, imageId);
        int n = ps.executeUpdate();
        conn.close();
        return n >= 1;
    }

    public boolean isExistTask(int id) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from task where taskId=? ");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        return rs.next(); // 如果结果集中有数据，则任务存在
    }

    public boolean insertTask(String taskId, String taskName, String numOfProblem, String numOfLabel, String username, String awardScore, String submitted, String description, String coverPath,String labelColumn) throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO task (taskId, taskName, numOfProblems, numOfLabeled, userName, awardScore, submitted, description,coverPath,labelColumn) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
        ps.setString(1, taskId);
        ps.setString(2, taskName);
        ps.setString(3, numOfProblem);
        ps.setString(4, numOfLabel);
        ps.setString(5, username);
        ps.setString(6, awardScore);
        ps.setString(7, submitted);
        ps.setString(8, description);
        ps.setString(9, coverPath);
        ps.setString(10, labelColumn);


        int n = ps.executeUpdate();
        return n >= 1;
    }

    public List<Task> selectAllTaskByLabel1() throws Exception {
        Connection conn = this.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from task where labelColumn=?");
        ps.setString(1, "label1");
        ResultSet rs = ps.executeQuery();
        List<Task> tasks = new ArrayList<Task>();
        while(rs.next()) {
            int taskId = rs.getInt("taskId");
            String taskName = rs.getString("taskName");
            int numOfProblems = rs.getInt("numOfProblems");
            int numOfLabeled = rs.getInt("numOfLabeled");
            String userName = rs.getString("userName");
            String coverPath = rs.getString("coverPath");
            boolean submitted = rs.getBoolean("submitted");
            String des=rs.getString("description");
            String labelColumn=rs.getString("labelColumn");
            int score=rs.getInt("awardScore");

            Task task = new Task(taskId, userName, taskName, numOfProblems, numOfLabeled, coverPath, submitted,des,labelColumn,score);
//            task = updateTaskStatus(task);
            tasks.add(task);
        }
        return tasks;
    }





}
