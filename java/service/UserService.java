package service;

import JDBCUtil.UserJDBC;
import pojo.User;

import java.util.List;

public class UserService {
    UserJDBC db = new UserJDBC();
    public User getUser(String username) throws Exception {
        return db.selectUser(username);
    }

    public void updateScore(String username, int score) throws Exception {
        db.updateUserScore(username, score);
    }

    public void updateHeadPath(String username, String headPath) throws Exception {
        db.updateUserHeadPath(username, headPath);
    }
    public List<User> selectAllUser() throws Exception {
        return db.selectAllUser();
    }

    public boolean deleteUser(String name) throws Exception {
        return db.deleteByName(name);
    }

    public List<User> selectUserByName(String name) throws Exception {
        return db.selectUserByName(name);
    }
}
