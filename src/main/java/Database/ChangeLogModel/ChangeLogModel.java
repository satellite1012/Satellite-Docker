package main.java.Database.ChangeLogModel;
//Author: Doan Duc Tin

import main.java.Database.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ChangeLogModel extends DBContext<ChangeLog> {

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
    public ArrayList<ChangeLog> selectAll() throws SQLException {
        ArrayList<ChangeLog> arr=new ArrayList<>();
        String sql
                = "Select * from ChangeLog";
        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            String d = rs.getString(4);
            arr.add(new ChangeLog(a, b, c, d));
        }
        //Return
        return arr;
    }

    @Override
    public ChangeLog selectById(int id) throws Exception {
        //Init
        ChangeLog log = null;
        String sql = "Select * from ChangeLog where id='" + id + "'";
        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            String d = rs.getString(4);
            log = new ChangeLog(a, b, c, d);
        }
        //Return
        return log;
    }

    @Override
    public int add(ChangeLog a) throws Exception {
        PreparedStatement stt = connection.prepareStatement("Insert into ChangeLog"
                + "(lTitle, lDescription)"
                + " values (?,?)");
        stt.setNString(1, a.getlTitle());
        stt.setNString(2, a.getlDescription());
        return stt.executeUpdate();
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "Delete from ChangeLog where id = " + id;
        PreparedStatement stt = connection.prepareStatement(sql);
        return stt.executeUpdate();
    }

    @Override
    public int update(ChangeLog a) throws Exception {
        //Init
        String sql
                = "Update ChangeLog Set "
                + "lTitle = '" + a.getlTitle() + "',"
                + "lDescription = '" + a.getlDescription() + "'"
                + "Where id='" + a.getId() + "'";
        //Excute
        Statement statement = connection.createStatement();
        return statement.executeUpdate(sql);
    }
}
