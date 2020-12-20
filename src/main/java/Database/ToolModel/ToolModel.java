package main.java.Database.ToolModel;
//Author: Doan Duc Tin

import main.java.Database.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ToolModel extends DBContext<Tool> {

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
    public ArrayList<Tool> selectAll() throws Exception {
        ArrayList<Tool> arr;
        arr = new ArrayList<>();
        String sql
                = "Select * from Tool";
        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            String d = rs.getString(4);
            String e = rs.getString(5);
            String f = rs.getString(6);
            String g = rs.getString(7);
            String h = rs.getString(8);
            arr.add(new Tool(a, b, c, d, e, f, g,h));
        }
        //Return
        return arr;
    }

    @Override
    public Tool selectById(int id) throws Exception {
        //Init
        Tool tool = null;
        String sql = "Select * from Tool where id='" + id + "'";
        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            String d = rs.getString(4);
            String e = rs.getString(5);
            String f = rs.getString(6);
            String g = rs.getString(7);
            String h = rs.getString(8);
            tool = new Tool(a, b, c, d, e, f, g,h);
        }
        //Return
        return tool;
    }

    @Override
    public int add(Tool a) throws Exception {
        PreparedStatement stt = connection.prepareStatement("Insert into Tool"
                + "(tTitle, tDescription,tLink,tImage,tWarning,tDanger)"
                + " values (?,?,?,?,?,?)");
        stt.setNString(1, a.gettTitle());
        stt.setNString(2, a.gettDescription());
        stt.setString(3, a.gettLink());
        stt.setString(4, a.gettImage());
        stt.setNString(5, a.gettWarning());
        stt.setNString(6, a.gettDanger());
        return stt.executeUpdate();
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "Delete from Tool where id = " + id;
        PreparedStatement stt = connection.prepareStatement(sql);
        return stt.executeUpdate();
    }

    @Override
    public int update(Tool a) throws Exception {
        //Init
        String sql
                = "Update Tool Set "
                + "tTitle = '" + a.gettTitle() + "',"
                + "tDescription = '" + a.gettDescription() + "',"
                + "tLink = '" + a.gettLink() + "',"
                + "tImage = '" + a.gettImage() + "',"
                + "tWarning = '" + a.gettWarning() + "',"
                + "tDanger = '" + a.gettDanger() + "',"
                + "tDateupdate = current_timestamp "
                + "Where id='" + a.getId() + "'";
        //Excute
        Statement statement = connection.createStatement();
        return statement.executeUpdate(sql);
    }

}
