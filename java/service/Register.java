package service;

import JDBCUtil.UserJDBC;
import pojo.User;

public class Register {
    UserJDBC db = new UserJDBC();
    public boolean addUser(User user) throws Exception {
        if(db.isExist(user)) {
            return false;
        }
        return db.insertUserInfo(user);
    }
}
