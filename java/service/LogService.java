package service;

import JDBCUtil.LogJDBC;
import pojo.Log;

import java.util.List;

public class LogService {
    LogJDBC db = new LogJDBC();
    public List<Log> getAllLog() throws Exception {
        return db.selectAllLog();
    }

    public boolean InsertLog(String logName) throws Exception {
        return db.insertLog(logName);
    }

}
