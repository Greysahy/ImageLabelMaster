package service;

import JDBCUtil.ResponseJDBC;
import JDBCUtil.UserJDBC;
import pojo.Response;
import pojo.User;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ResponseService {
    ResponseJDBC db = new ResponseJDBC();
    UserJDBC userdb = new UserJDBC();
    public void addResponse(Response response) throws Exception {
        db.insertResponse(response);
    }

    public Map<Response, User> getAllResponseWithUserInfo(int postId) throws Exception {
        List<Response> responses = db.selectAllResponse(postId);
        Map<Response, User> responseUserMap = new LinkedHashMap<>();

        for (Response response : responses) {
            String username = response.getUsername();
            User user = userdb.selectUser(username);
            responseUserMap.put(response, user);
        }
        return responseUserMap;
    }
}
