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

public class DiscussModel extends DBContext<Discuss> {

    Connection connection;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        if (this.connection==null) {
            this.connection = connection;
        }
    }

    public ArrayList<Discuss> selectTop() throws Exception {
        ArrayList<Discuss> arr;
        arr = new ArrayList<>();
        String sql = "Select * from `Discuss` where validate>=0 ORDER BY validate DESC LIMIT 3";

        //Relation_QA
        QAModel model1=new QAModel();
        model1.setConnection(connection);
        //Relation_User
        UserModel model2=new UserModel();
        model2.setConnection(connection);

        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            int d = Integer.parseInt(rs.getString(4));
            int e = Integer.parseInt(rs.getString(5));
            int f = Integer.parseInt(rs.getString(6));
            String g = rs.getString(7);
            QA h=model1.selectById(e);
            User i=model2.selectById(f);
            arr.add(new Discuss(a, b, c, d, e, f, g,h,i));
        }
        //Return
        return arr;
    }

    @Override
    public ArrayList<Discuss> selectAll() throws Exception {
        ArrayList<Discuss> arr;
        arr = new ArrayList<>();
        String sql = "Select * from `Discuss` where validate>=0 ORDER BY validate DESC";

        //Relation_QA
        QAModel model1=new QAModel();
        model1.setConnection(connection);
        //Relation_User
        UserModel model2=new UserModel();
        model2.setConnection(connection);

        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            int d = Integer.parseInt(rs.getString(4));
            int e = Integer.parseInt(rs.getString(5));
            int f = Integer.parseInt(rs.getString(6));
            String g = rs.getString(7);
            QA h=model1.selectById(e);
            User i=model2.selectById(f);
            arr.add(new Discuss(a, b, c, d, e, f, g,h,i));
        }
        //Return
        return arr;
    }

    public ArrayList<Discuss> selectByQA(int qa) throws Exception {
        ArrayList<Discuss> arr;
        arr = new ArrayList<>();
        String sql = "Select * from `Discuss` where qa=? and validate>=0 ORDER BY validate DESC";

        //Relation_QA
        QAModel model1=new QAModel();
        model1.setConnection(connection);
        //Relation_User
        UserModel model2=new UserModel();
        model2.setConnection(connection);

        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1,qa);
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            int d = Integer.parseInt(rs.getString(4));
            int e = Integer.parseInt(rs.getString(5));
            int f = Integer.parseInt(rs.getString(6));
            String g = rs.getString(7);
            QA h=model1.selectById(e);
            User i=model2.selectById(f);
            arr.add(new Discuss(a, b, c, d, e, f, g,h,i));
        }
        //Return
        return arr;
    }

    @Override
    public Discuss selectById(int id) throws Exception {
        //Init
        Discuss dis = null;
        String sql = "Select * from `Discuss` where id=?";

        //Relation_QA
        QAModel model1=new QAModel();
        model1.setConnection(connection);
        //Relation_User
        UserModel model2=new UserModel();
        model2.setConnection(connection);

        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1,id);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            int d = Integer.parseInt(rs.getString(4));
            int e = Integer.parseInt(rs.getString(5));
            int f = Integer.parseInt(rs.getString(6));
            String g = rs.getString(7);
            QA h=model1.selectById(e);
            User i=model2.selectById(f);
            dis=new Discuss(a, b, c, d, e, f, g,h,i);
        }
        //Return
        return dis;
    }

    public Discuss selectLast() throws Exception {
        //Init
        Discuss dis = null;
        String sql = "SELECT * FROM `Discuss` ORDER BY id DESC LIMIT 1";

        //Relation_QA
        QAModel model1=new QAModel();
        model1.setConnection(connection);
        //Relation_User
        UserModel model2=new UserModel();
        model2.setConnection(connection);

        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            int d = Integer.parseInt(rs.getString(4));
            int e = Integer.parseInt(rs.getString(5));
            int f = Integer.parseInt(rs.getString(6));
            String g = rs.getString(7);
            QA h=model1.selectById(e);
            User i=model2.selectById(f);
            dis=new Discuss(a, b, c, d, e, f, g,h,i);
        }
        //Return
        return dis;
    }

    @Override
    public int add(Discuss a) throws Exception {
        PreparedStatement stt = connection.prepareStatement("Insert into `Discuss`"
                + "(name,comment,qa,user,datecreated)"
                + " values (?,?,?,?,?)");
        stt.setNString(1, a.getName());
        stt.setNString(2, a.getComment());
        stt.setInt(3, a.getQa());
        stt.setInt(4, a.getUser());
        stt.setString(5,a.getDatecreated());

        return stt.executeUpdate();
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "Delete from `Discuss` where id = " + id;
        PreparedStatement stt = connection.prepareStatement(sql);
        return stt.executeUpdate();
    }

    @Override
    public int update(Discuss a) throws Exception {
        //Init
        String sql = null;

        //Excute
        Statement statement = connection.createStatement();
        return statement.executeUpdate(sql);
    }

    public void updateLiked(Discuss a, int count) throws Exception {
        //Init
        a.setValidate(a.getValidate()+count);
        String sql
                = "Update `Discuss` Set "
                + "validate = ?"
                + " Where id=?";

        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1,a.getValidate());
        statement.setInt(2,a.getId());
        statement.executeUpdate();
    }

}
