package main.java.Controllers;

import com.opensymphony.xwork2.ActionSupport;
import main.java.Database.DatabaseDAO;
import main.java.Database.UserModel.UserModel;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.Map;

public class HomeController extends ActionSupport implements SessionAware {
    //Log
    private String log_HomeController_Home = "true";
    //Other
    public Map<String, Object> session;

    public String getLog_HomeController_Home() {
        return log_HomeController_Home;
    }

    public void setLog_HomeController_Home(String log_HomeController_Home) {
        this.log_HomeController_Home = log_HomeController_Home;
    }

    public String loadContentFirst() {
        //Log
        int times = 0;
        if (session.containsKey("times_home")) times = (int) session.get("times_home");
        times++;
        if (times == 1) {
            session.put("times_home", times);
            session.put("log_HomeController_Home",log_HomeController_Home);
        }
        return "success";
    }

    public String loadContributorList(){
        try {
            //Init
            HttpServletRequest request = ServletActionContext.getRequest();
            UserModel dataController = new UserModel();
            DatabaseDAO db = new DatabaseDAO();
            //Validation

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                request.setAttribute("Contributor1",dataController.selectById(3));
                request.setAttribute("Contributor2",dataController.selectById(16));
                request.setAttribute("Contributor3",dataController.selectById(38));
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }
            //View
        } catch (Exception e) {
            session.put("log_HomeController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
}
