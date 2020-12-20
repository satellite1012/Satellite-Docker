package main.java.Database.DocumentModel;
//Author: Doan Duc Tin

import main.java.Database.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DocumentModel extends DBContext<Document> {

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
    public ArrayList<Document> selectAll() throws Exception {
        //Init
        ArrayList<Document> arr = new ArrayList<>();
        String sql = "Select * from Document";
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
            String i = rs.getString(9);
            int j = Integer.parseInt(rs.getString(10));
            int k = Integer.parseInt(rs.getString(11));
            String l = rs.getString(12);
            String m = rs.getString(13);
            arr.add(new Document(a, b, c, d, e, f, g, h, i,j,k,l,m));
        }
        //Return
        return arr;
    }

    @Override
    public Document selectById(int id) throws Exception {
        //Init
        Document document = null;
        String sql = "Select * from Document where id=?";
        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1,id);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            String d = rs.getString(4);
            String e = rs.getString(5);
            String f = rs.getString(6);
            String g = rs.getString(7);
            String h = rs.getString(8);
            String i = rs.getString(9);
            int j = Integer.parseInt(rs.getString(10));
            int k = Integer.parseInt(rs.getString(11));
            String l = rs.getString(12);
            String m = rs.getString(13);
            document=(new Document(a, b, c, d, e, f, g, h, i,j,k,l,m));
        }
        //Return
        return document;
    }

    public ArrayList<Document> selectByCourse(String course) throws Exception {
        //Init
        ArrayList<Document> arr = new ArrayList<>();
        String sql = "Select * from Document where dCourse=?";
        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,course);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            String d = rs.getString(4);
            String e = rs.getString(5);
            String f = rs.getString(6);
            String g = rs.getString(7);
            String h = rs.getString(8);
            String i = rs.getString(9);
            int j = Integer.parseInt(rs.getString(10));
            int k = Integer.parseInt(rs.getString(11));
            String l = rs.getString(12);
            String m = rs.getString(13);
            arr.add(new Document(a, b, c, d, e, f, g, h, i,j,k,l,m));
        }
        //Return
        return arr;
    }

    @Override
    public int add(Document a) throws Exception {
        PreparedStatement stt = connection.prepareStatement("Insert into Document"
                + "(dTitle, dDescription, dLink,dCourse,dSubject,dImage)"
                + " values (?,?,?,?,?,?)");
        stt.setNString(1, a.getdTitle());
        stt.setNString(2, a.getdDescription());
        stt.setString(3, a.getdLink());
        stt.setString(4, a.getdCourse());
        stt.setString(5, a.getdSubject());
        stt.setString(6, a.getdImage());
        return stt.executeUpdate();
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "Delete from Document where id = " + id;
        PreparedStatement stt = connection.prepareStatement(sql);
        return stt.executeUpdate();
    }

    @Override
    public int update(Document a) throws Exception {
        //Init
        String sql
                = null;
        //Excute
        Statement statement = connection.createStatement();
        return statement.executeUpdate(sql);
    }

    public int updateView(Document a,int count) throws Exception {
        a.setdView(a.getdView()+count);
        //Init
        String sql
                = "Update `Document` set"
                + " dView=? Where id=?";
        //Excute
        PreparedStatement stt = connection.prepareStatement(sql);
        stt.setInt(1,a.getdView());
        stt.setInt(2,a.getId());
        return stt.executeUpdate();
    }

}
