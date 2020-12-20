package main.java.Database.QAModel;
//Author: Doan Duc Tin

import main.java.Database.DBContext;
import main.java.Database.UserModel.User;
import main.java.Database.UserModel.UserModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class QAModel extends DBContext<QA> {

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
    public ArrayList<QA> selectAll() throws Exception {
        ArrayList<QA> arr;
        arr = new ArrayList<>();
        String sql = "Select * from `QA` where validate>=1 ORDER BY datecreated DESC";

        //Relation_User
        UserModel model=new UserModel();
        model.setConnection(connection);

        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            int b = Integer.parseInt(rs.getString(2));
            String c = rs.getString(3);
            String d = rs.getString(4);
            String e = rs.getString(5);
            int f = Integer.parseInt(rs.getString(6));
            String g = rs.getString(7);
            int h = Integer.parseInt(rs.getString(8));
            String i = rs.getString(9);
            User j=model.selectById(b);
            arr.add(new QA(a, b, c, d, e, f, g,h,i,j));
        }
        //Return
        return arr;
    }

    @Override
    public QA selectById(int id) throws Exception {
        //Init
        QA qa = null;
        String sql = "Select * from `QA` where id=?";

        //Relation_User
        UserModel model=new UserModel();
        model.setConnection(connection);

        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1,id);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            int b = Integer.parseInt(rs.getString(2));
            String c = rs.getString(3);
            String d = rs.getString(4);
            String e = rs.getString(5);
            int f = Integer.parseInt(rs.getString(6));
            String g = rs.getString(7);
            int h = Integer.parseInt(rs.getString(8));
            String i = rs.getString(9);
            User j=model.selectById(b);
            qa=new QA(a, b, c, d, e, f, g,h,i,j);
        }
        //Return
        return qa;
    }

    public QA selectLast() throws Exception {
        //Init
        QA qa = null;
        String sql = "SELECT * FROM `QA` where validate>=1 ORDER BY id DESC LIMIT 1";

        //Relation_User
        UserModel model=new UserModel();
        model.setConnection(connection);

        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            int b = Integer.parseInt(rs.getString(2));
            String c = rs.getString(3);
            String d = rs.getString(4);
            String e = rs.getString(5);
            int f = Integer.parseInt(rs.getString(6));
            String g = rs.getString(7);
            int h = Integer.parseInt(rs.getString(8));
            String i = rs.getString(9);
            User j=model.selectById(b);
            qa=new QA(a, b, c, d, e, f, g,h,i,j);
        }
        //Return
        return qa;
    }


    @Override
    public int add(QA a) throws Exception {
        PreparedStatement stt = connection.prepareStatement("Insert into `QA`"
                + "(user,title,image,content,type,datecreated)"
                + " values (?,?,?,?,?,?)");
        stt.setInt(1, a.getUser());
        stt.setNString(2, a.getTitle());
        stt.setString(3, a.getImage());
        stt.setNString(4, a.getContent());
        stt.setString(5, a.getType());
        stt.setString(6,a.getDatecreated());
        return stt.executeUpdate();
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "Delete from `QA` where id = " + id;
        PreparedStatement stt = connection.prepareStatement(sql);
        return stt.executeUpdate();
    }

    @Override
    public int update(QA a) throws Exception {
        //Init
        String sql=null;

        //Excute
        Statement statement = connection.createStatement();
        return statement.executeUpdate(sql);
    }

    public void updateAnswerCount(QA a, int count) throws Exception {
        //Init
        a.setAnswered(a.getAnswered()+count);
        String sql
                = "Update `QA` Set "
                + "answered = ?"
                + " Where id=?";

        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1,a.getAnswered());
        statement.setInt(2,a.getId());
        statement.executeUpdate();
    }
}
