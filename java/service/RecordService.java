package service;

import JDBCUtil.RecordJDBC;
import pojo.Record;

import java.util.List;

public class RecordService {
    RecordJDBC db = new RecordJDBC();

    public void insertRecord(Record record) throws Exception {
        db.insertExchangeRecord(record);
    }

    public List<Record> getRecordsList(String username) throws Exception {
        return db.getRecordByName(username);
    }
}
