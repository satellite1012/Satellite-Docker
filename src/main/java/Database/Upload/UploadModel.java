package main.java.Database.Upload;
//Author: Doan Duc Tin

import main.java.Database.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UploadModel extends DBContext<Upload> {

    Connection connection;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        if (this.connection==null) {
            this.connection = connection;
        }
    }

    @Override
    public ArrayList<Upload> selectAll() throws Exception {
        ArrayList<Upload> arr;
        arr = new ArrayList<>();
        String sql = "Select * from Upload";
        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            String d = rs.getString(4);
            int e = Integer.parseInt(rs.getString(5));
            String f = rs.getString(6);
            arr.add(new Upload(a, b, c, d, e, f));
        }
        //Return
        return arr;
    }

    @Override
    public Upload selectById(int id) throws Exception {
        //Init
        Upload uploadDocument = null;
        String sql = "Select * from Upload where id='" + id + "'";
        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            String d = rs.getString(4);
            int e = Integer.parseInt(rs.getString(5));
            String f = rs.getString(6);
            uploadDocument = new Upload(a, b, c, d, e, f);

        }
        //Return
        return uploadDocument;
    }

    @Override
    public int add(Upload a) throws Exception {
        PreparedStatement stt = connection.prepareStatement("Insert into Upload"
                + "(dHash,dName,dLink,dStoneget)"
                + " values (?,?,?,?)");
        stt.setString(1, a.getdHash());
        stt.setNString(2, a.getdName());
        stt.setString(3, a.getdLink());
        stt.setInt(4, a.getdStoneget());
        return stt.executeUpdate();
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "Delete from Upload where id = " + id;
        PreparedStatement stt = connection.prepareStatement(sql);
        return stt.executeUpdate();
    }

    @Override
    public int update(Upload a) throws Exception {
        //Init
        String sql
                = "Update Upload Set "
                + "dHash = '" + a.getdHash() + "',"
                + "dName = '" + a.getdName() + "',"
                + "dLink = '" + a.getdLink() + "',"
                + "dStoneget = '" + a.getdStoneget() + "'"
                + "Where id='" + a.getId() + "'";
        //Excute
        Statement statement = connection.createStatement();
        return statement.executeUpdate(sql);
    }

}
