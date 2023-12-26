package pojo;

public class User {
    int userId;
    String username;
    String password;

    int type;
    String tel;
    int score;
    String college;
    String headPath;
    public User(int userId, String username, int type, String tel, int score, String college, String headPath) {
        this.userId = userId;
        this.username = username;
        this.type = type;
        this.tel = tel;
        this.score = score;
        this.college = college;
        this.headPath = headPath;
    }
    public User(int userId, String username, String password, int type, String tel, int score, String college, String headPath) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.type = type;
        this.tel = tel;
        this.score = score;
        this.college = college;
        this.headPath = headPath;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getHeadPath() {
        return headPath;
    }

    public void setHeadPath(String headPath) {
        this.headPath = headPath;
    }


}
