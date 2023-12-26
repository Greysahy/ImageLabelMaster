package pojo;

public class Task {
    int taskId;
    String userName;
    String taskName;
    int numOfProblems;
    int numOfLabeled;
    String coverPath;
    boolean submitted;
    int awardScore;
    String description;
    String labelColumn;
    public Task(int taskId,String userName,String taskName,int numOfProblems,int numOfLabeled,String coverPath,boolean submitted,String labelColumn,int awardScore,String description){
        this.taskId = taskId;
        this.userName = userName;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
        this.submitted = submitted;
        this.labelColumn=labelColumn;
        this.awardScore=awardScore;
        this.description=description;
    }
    public Task(int taskId, String taskName, int numOfProblems, String coverPath) {
        this.taskId = taskId;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.coverPath = coverPath;
    }

    public Task(String taskName, int numOfProblems) {
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
    }
    public Task(int taskId, String userName, String taskName, int numOfProblems, int numOfLabeled, String coverPath, boolean submitted, int awardScore, String description, String labelColumn) {
        this.taskId = taskId;
        this.userName = userName;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
        this.submitted = submitted;
        this.awardScore = awardScore;
        this.description = description;
        this.labelColumn = labelColumn;
    }

    public Task(int taskId, String taskName, int numOfProblems, int numOfLabeled, String coverPath) {
        this.taskId = taskId;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
    }

    public Task(int taskId, String userName, String taskName, int numOfProblems, int numOfLabeled, String coverPath) {
        this.taskId = taskId;
        this.userName = userName;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
    }

    public Task(int taskId, String userName, String taskName, int numOfProblems, int numOfLabeled, String coverPath, boolean submitted) {
        this.taskId = taskId;
        this.userName = userName;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
        this.submitted = submitted;
    }

    public Task(int taskId, String userName, String taskName, int numOfProblems, int numOfLabeled, String coverPath, boolean submitted, String description) {
        this.taskId = taskId;
        this.userName = userName;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
        this.submitted = submitted;
        this.description = description;
    }

    public Task(int taskId, String userName, String taskName, int numOfProblems, int numOfLabeled, String coverPath, boolean submitted, int awardScore, String description) {
        this.taskId = taskId;
        this.userName = userName;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
        this.submitted = submitted;
        this.awardScore = awardScore;
        this.description = description;
    }

    public Task(int taskId, String userName, String taskName, int numOfProblems, int numOfLabeled, String coverPath, boolean submitted, int awardScore) {
        this.taskId = taskId;
        this.userName = userName;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
        this.submitted = submitted;
        this.awardScore = awardScore;
    }

    public Task(String taskName) {
        this.taskName = taskName;
    }


    public Task(int taskId, String userName, String taskName, int numOfProblems, int numOfLabeled, String coverPath, boolean submitted,String des,String labelColumn,int score) {
        this.taskId = taskId;
        this.userName = userName;
        this.taskName = taskName;
        this.numOfProblems = numOfProblems;
        this.numOfLabeled = numOfLabeled;
        this.coverPath = coverPath;
        this.submitted = submitted;
        this.description=des;
        this.labelColumn=labelColumn;
        this.awardScore=score;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }
    public String getLabelColumn() {
        return labelColumn;
    }
    public void setLabelColumn(String labelColumn) {
        this.labelColumn = labelColumn;
    }

    public int getNumOfProblems() {
        return numOfProblems;
    }

    public void setNumOfProblems(int numOfProblems) {
        this.numOfProblems = numOfProblems;
    }

    public String getCoverPath() {
        return coverPath;
    }

    public void setCoverPath(String coverPath) {
        this.coverPath = coverPath;
    }

    public int getNumOfLabeled() {
        return numOfLabeled;
    }

    public void setNumOfLabeled(int numOfLabeled) {
        this.numOfLabeled = numOfLabeled;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public boolean isSubmitted() {
        return submitted;
    }

    public void setSubmitted(boolean submitted) {
        this.submitted = submitted;
    }

    public int getAwardScore() {
        return awardScore;
    }

    public void setAwardScore(int awardScore) {
        this.awardScore = awardScore;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Task{" +
                "taskId=" + taskId +
                ", userName='" + userName + '\'' +
                ", taskName='" + taskName + '\'' +
                ", numOfProblems=" + numOfProblems +
                ", numOfLabeled=" + numOfLabeled +
                ", coverPath='" + coverPath + '\'' +
                ", submitted=" + submitted +
                '}';
    }
}
