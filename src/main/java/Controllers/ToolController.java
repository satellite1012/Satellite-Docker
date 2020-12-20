package main.java.Controllers;

import com.opensymphony.xwork2.ActionSupport;
import main.java.Database.DatabaseDAO;
import main.java.Database.ToolModel.Tool;
import main.java.Database.ToolModel.ToolModel;
import org.apache.struts2.interceptor.SessionAware;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class ToolController extends ActionSupport implements SessionAware {

    public Map<String, Object> session;
    public static ArrayList<Tool> toolList = new ArrayList<>();

    public String getListTool() {
        try {
            //Init
            ToolModel dataController = new ToolModel();
            DatabaseDAO db = new DatabaseDAO();
            //Validation

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                if (toolList==null||toolList.isEmpty())
                toolList = dataController.selectAll();
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }
            //View
        } catch (Exception e) {
            session.put("log_ToolController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }

}
