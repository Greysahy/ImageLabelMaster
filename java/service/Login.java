package service;

import JDBCUtil.UserJDBC;
import pojo.User;

public class Login {
    UserJDBC db = new UserJDBC();
    public boolean isAuthorized(User user) throws Exception {
        return db.checkAccount(user);
    }
}
