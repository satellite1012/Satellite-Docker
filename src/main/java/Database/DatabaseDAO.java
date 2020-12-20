package main.java.Database;
//Author: Doan Duc Tin

import static main.java.Database.DatabaseInfo.driverName;
import static main.java.Database.DatabaseInfo.name;
import static main.java.Database.DatabaseInfo.pass;
import static main.java.Database.DatabaseInfo.url;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseDAO {

    Connection connection;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public void openConnection() throws Exception {
        Class.forName(driverName).newInstance();
        connection = DriverManager.getConnection(url, name, pass);
    }

    public void closeConnection() {
        try {
            connection.close();
        } catch (SQLException ex) {
            //NOTHING WE CAN DO
        }
    }
}
