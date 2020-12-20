package main.java.Controllers;
//Author: Doan Duc Tin

import com.opensymphony.xwork2.ActionSupport;
import main.java.Database.DatabaseDAO;
import main.java.Database.ChangeLogModel.ChangeLog;
import main.java.Database.ChangeLogModel.ChangeLogModel;
import org.apache.struts2.ServletActionContext;

import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

public class LogController extends ActionSupport {

    public String viewChangeLog(){
        try {
            //Init
            ArrayList<ChangeLog> a = null;
            ChangeLogModel dataController = new ChangeLogModel();
            DatabaseDAO db = new DatabaseDAO();
            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                a = dataController.selectAll();
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }
            //View
            HttpServletRequest request= ServletActionContext.getRequest();
            request.setAttribute("logList", a);
        } catch (Exception e) {
            return "failure";
        }
        return "success";
    }
}
