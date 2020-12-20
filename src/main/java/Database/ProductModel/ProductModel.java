package main.java.Database.ProductModel;

import main.java.Database.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductModel extends DBContext<Product> {

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
    public ArrayList<Product> selectAll() throws Exception {
        ArrayList<Product> arr;
        arr = new ArrayList<>();
        String sql
                = "Select * from Product";
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
            String k = rs.getString(9);
            arr.add(new Product(a, b, c, d, e, f, g,h,k));
        }
        //Return
        return arr;
    }

    @Override
    public Product selectById(int id) throws Exception {
        //Init
        Product product = null;
        String sql = "Select * from Product where id='" + id + "'";
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
            String k = rs.getString(9);
            product =new Product(a, b, c, d, e, f, g,h,k);
        }
        //Return
        return product;
    }

    @Override
    public int add(Product a) throws Exception {
        PreparedStatement stt = connection.prepareStatement("Insert into Product"
                + "(pName, pType, pImage, pDetails, pLink, pVersion\n)"
                + " values (?,?,?,?,?,?)");
        stt.setNString(1, a.getpName());
        stt.setString(2, a.getpType());
        stt.setString(3, a.getpImage());
        stt.setNString(4, a.getpDetails());
        stt.setString(5, a.getpLink());
        stt.setString(6, a.getpVersion());
        return stt.executeUpdate();
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "Delete from Product where id = " + id;
        PreparedStatement stt = connection.prepareStatement(sql);
        return stt.executeUpdate();
    }

    @Override
    public int update(Product a) throws Exception {
        //Init
        String sql
                = "Update Product Set "
                + "pName = '" + a.getpName() + "',"
                + "pType = '" + a.getpType() + "',"
                + "pImage = '" + a.getpImage() + "',"
                + "pDetails = '" + a.getpDetails() + "',"
                + "pLink = '" + a.getpLink() + "',"
                + "pVersion = '" + a.getpVersion() + "',"
                + "pDateupdate = current_timestamp "
                + "Where id='" + a.getId() + "'";
        //Excute
        Statement statement = connection.createStatement();
        return statement.executeUpdate(sql);
    }

}
