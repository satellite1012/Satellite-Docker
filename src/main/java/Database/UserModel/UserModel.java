package main.java.Database.UserModel;

import main.java.Database.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//Author: Doan Duc Tin
public class UserModel extends DBContext<User> {

    Connection connection;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        if (this.connection==null) {
            this.connection = connection;
        }
    }

    public void updateCountAccess(int increament) throws Exception {
        int count = getCountAccess() + increament;
        String sql = "UPDATE `User` SET uRole ='" + count + "' WHERE uName='count_acess' AND uPass='h29f38hffwje9f'";
        //Excute
        Statement statement = connection.createStatement();
        statement.executeUpdate(sql);
    }

    public int getCountAccess() throws Exception {
        User temp = findUserByNameAndPass("count_acess", "h29f38hffwje9f");
        return temp.getuRole();
    }

    public User findUserByNameAndPass(String name, String pass) throws Exception {
        ArrayList<User> arr = selectAll();
        for (User i : arr) {
            if (i.getuName().trim().equals(name) && i.getuPass().trim().equals(pass)) {
                return i;
            }
        }
        return null;
    }

    public User findUserByEmail(String email) throws Exception {
        return selectAll()
                .parallelStream()
                .filter(user -> user.getuEmail().equals(email))
                .findFirst()
                .orElse(null);
    }

    public void setStone(int id, int stone) throws SQLException {
        String sql = "Update `User` SET uStone='" + stone + "' Where id='" + id + "'";
        //Excute
        Statement statement = connection.createStatement();
        statement.executeUpdate(sql);
        //Return
    }

    public User selectByUsername(String id) throws Exception {
        //Init
        User user = null;
        String sql = "Select * from `User` where uName=?";
        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,id);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            int d = Integer.parseInt(rs.getString(4));
            String e = rs.getString(5);
            String avatar=rs.getString(6);
            int f = Integer.parseInt(rs.getString(7));
            String g = rs.getString(8);
            String h = rs.getString(9);
            String i = rs.getString(10);
            String j = rs.getString(11);
            String k = rs.getString(12);
            String l = rs.getString(13);
            int m = Integer.parseInt(rs.getString(14));
            int n = Integer.parseInt(rs.getString(15));
            int o = Integer.parseInt(rs.getString(16));
            int p = Integer.parseInt(rs.getString(17));
            int q = Integer.parseInt(rs.getString(18));
            String s = rs.getString(19);
            String t = rs.getString(20);
            user=new User(a, b, c, d, e,avatar, f, g, h, i, j, k, l, m, n, o, p, q, s, t,"");
        }
        //Return
        return user;
    }

    @Override
    public ArrayList<User> selectAll() throws Exception {
        ArrayList<User> arr;
        arr = new ArrayList<>();
        String sql = "Select * from `User`";
        //Excute
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            int d = Integer.parseInt(rs.getString(4));
            String e = rs.getString(5);
            String avatar=rs.getString(6);
            int f = Integer.parseInt(rs.getString(7));
            String g = rs.getString(8);
            String h = rs.getString(9);
            String i = rs.getString(10);
            String j = rs.getString(11);
            String k = rs.getString(12);
            String l = rs.getString(13);
            int m = Integer.parseInt(rs.getString(14));
            int n = Integer.parseInt(rs.getString(15));
            int o = Integer.parseInt(rs.getString(16));
            int p = Integer.parseInt(rs.getString(17));
            int q = Integer.parseInt(rs.getString(18));
            String s = rs.getString(19);
            String t = rs.getString(20);
            arr.add(new User(a, b, c, d, e,avatar, f, g, h, i, j, k, l, m, n, o, p, q, s, t,""));
        }
        //Return
        return arr;
    }

    @Override
    public User selectById(int id) throws Exception {
        //Init
        User user = null;
        String sql = "Select * from `User` where id=?";
        //Excute
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1,id);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            int a = Integer.parseInt(rs.getString(1));
            String b = rs.getString(2);
            String c = rs.getString(3);
            int d = Integer.parseInt(rs.getString(4));
            String e = rs.getString(5);
            String avatar=rs.getString(6);
            int f = Integer.parseInt(rs.getString(7));
            String g = rs.getString(8);
            String h = rs.getString(9);
            String i = rs.getString(10);
            String j = rs.getString(11);
            String k = rs.getString(12);
            String l = rs.getString(13);
            int m = Integer.parseInt(rs.getString(14));
            int n = Integer.parseInt(rs.getString(15));
            int o = Integer.parseInt(rs.getString(16));
            int p = Integer.parseInt(rs.getString(17));
            int q = Integer.parseInt(rs.getString(18));
            String s = rs.getString(19);
            String t = rs.getString(20);
            user=new User(a, b, c, d, e,avatar, f, g, h, i, j, k, l, m, n, o, p, q, s, t,"");
        }
        //Return
        return user;
    }

    @Override
    public int add(User a) throws Exception {
        String sql
                = "Insert into `User`" +
                "(uName, uPass, uRole, uDigitalName, uAvatar, uStone, uPhone," +
                " uEmail, uDob, uLocation, uCmt_title, uCmt_descrip, " +
                " uStrength_backend, uStrength_frontend, uStrength_alogrythm, " +
                " uStrength_designer, uStrength_creation,uDatecreated,uDateupdate)" +
                " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        //Excute
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, a.getuName());
        ps.setString(2, a.getuPass());
        ps.setString(3, Integer.toString(a.getuRole()));
        ps.setNString(4, a.getuDigitalName());
        ps.setString(5, a.getuImage());
        ps.setString(6, Integer.toString(a.getuStone()));
        ps.setString(7, a.getuPhone());
        ps.setString(8, a.getuDob());
        ps.setString(9, a.getuEmail());
        ps.setNString(10, a.getuLocation());
        ps.setNString(11, a.getuCmt_title());
        ps.setNString(12, a.getuCmt_descrip());
        ps.setString(13, Integer.toString(a.getuStrength_backend()));
        ps.setString(14, Integer.toString(a.getuStrength_frontend()));
        ps.setString(15, Integer.toString(a.getuStrength_alogrythm()));
        ps.setString(16, Integer.toString(a.getuStrength_designer()));
        ps.setString(17, Integer.toString(a.getuStrength_creation()));
        ps.setString(18,a.getuDatecreated());
        ps.setString(19,a.getuDateupdate());
        //Return
        return ps.executeUpdate();
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "Delete from `User` where id = " + id;
        PreparedStatement stt = connection.prepareStatement(sql);
        return stt.executeUpdate();
    }

    @Override
    public int update(User a) throws Exception {
        //Init
        String sql
                = "Update `User` Set "
                + "`uName` = ?,"
                + "`uPass` = ?,"
                + "`uRole` = ?,"
                + "`uDigitalName` = ?,"
                + "`uAvatar` = ?,"
                + "`uStone` = ?,"
                + "`uPhone` = ?,"
                + "`uEmail` = ?,"
                + "`uDob` = ?,"
                + "`uLocation` = ?,"
                + "`uCmt_title` = ?,"
                + "`uCmt_descrip` = ?,"
                + "`uStrength_backend` = ?,"
                + "`uStrength_frontend`= ?,"
                + "`uStrength_alogrythm` = ?,"
                + "`uStrength_designer` = ?,"
                + "`uStrength_creation` = ?,"
                + "`uDateupdate` = ?"
                + " Where `id`=?";
        //Excute
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, a.getuName());
        ps.setString(2, a.getuPass());
        ps.setString(3, Integer.toString(a.getuRole()));
        ps.setNString(4, a.getuDigitalName());
        ps.setString(5, a.getuImage());
        ps.setString(6, Integer.toString(a.getuStone()));
        ps.setString(7, a.getuPhone());
        ps.setString(8, a.getuEmail());
        ps.setString(9, a.getuDob());
        ps.setNString(10, a.getuLocation());
        ps.setNString(11, a.getuCmt_title());
        ps.setNString(12, a.getuCmt_descrip());
        ps.setString(13, Integer.toString(a.getuStrength_backend()));
        ps.setString(14, Integer.toString(a.getuStrength_frontend()));
        ps.setString(15, Integer.toString(a.getuStrength_alogrythm()));
        ps.setString(16, Integer.toString(a.getuStrength_designer()));
        ps.setString(17, Integer.toString(a.getuStrength_creation()));
        ps.setString(18,a.getuDateupdate());
        ps.setInt(19, a.getId());
        return ps.executeUpdate();
    }
}
