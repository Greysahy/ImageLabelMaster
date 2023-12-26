package service;

import JDBCUtil.TaskJDBC;
import pojo.Image;
import pojo.Task;
import pojo.User;

import java.util.ArrayList;
import java.util.List;

public class TaskService {
    TaskJDBC db = new TaskJDBC();
    public List<Task> getAllTask(String username) throws Exception {
        return db.selectAllTask(username);
    }
    public List<Task> getAllTask() throws Exception {
        return db.selectAllTask();
    }
    public List<Task> getCurTask(String username) throws Exception {
        List<Task> tmp =  db.selectAllTask(username);
        List<Task> tasks = new ArrayList<Task>();
        for(Task task: tmp) {
            if(task.getNumOfLabeled() < task.getNumOfProblems()) {
                tasks.add(task);
            }
        }
        return tasks;
    }
    public Task getTaskByTaskId(int taskId) throws Exception {
        return db.getTaskById(taskId);
    }
    public List<Image> getAllImageForTask(int taskId, String labelColumn) throws Exception {
        return db.selectAllImageForTask(taskId, labelColumn);
    }

    public List<Image> getUnlabeledImageForTask(int taskId, String labelColumn) throws Exception {
        return db.selectUnlabeledImageForTask(taskId, labelColumn);
    }

    public List<Image> getLabeledImageForTask(int taskId, String labelColumn) throws Exception {
        return db.selectLabeledImageForTask(taskId, labelColumn);
    }

    public boolean doUpdateLabel(int imageId, String labelColumn, String label) throws Exception {
        return db.UpdateLabel(imageId, labelColumn, label);
    }
    public boolean ChooseTask(int taskId,String username) throws Exception {
       return db.ChooseTask(taskId,username);
    }

    public List<Image> getAllImageForTask(int taskId) throws Exception {
        return db.selectAllImageForTask(taskId);
    }
    public List<Image> getAllImageForTaskA(int taskId) throws Exception {
        return db.selectAllImageForTaskA(taskId);
    }

    public List<Image> getUnlabeledImageForTask(int taskId) throws Exception {
        return db.selectUnlabeledImageForTask(taskId);
    }

    public List<Image> getLabeledImageForTask(int taskId) throws Exception {
        return db.selectLabeledImageForTask(taskId);
    }

    public boolean doUpdateLabel(int imageId, String label) throws Exception {
        return db.UpdateLabel(imageId, label);
    }

    public void getTaskSubmitted(int taskId) throws Exception {
        db.submitTask(taskId);
    }

    public boolean UpdateTask(int id, String name, int score, String des,String label) throws Exception {
        return db.UpdataTask(id,name,score,des,label);
    }

    public boolean isExistTask(int id) throws Exception {
        return db.isExistTask(id);
    }

    public boolean insertTask(String taskId, String taskName, String numOfProblems, String numOfLabel, String username, String awardScore, String submitted, String description, String coverPath,String labelColumn) throws Exception {
        return db.insertTask(taskId,taskName,numOfProblems,numOfLabel,username,awardScore,submitted,description,coverPath,labelColumn);
    }

    public List<Task> getAllTaskByLabel1() throws Exception {
        return db.selectAllTaskByLabel1();
    }
}
