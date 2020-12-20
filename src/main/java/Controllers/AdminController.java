package main.java.Controllers;

import com.opensymphony.xwork2.ActionSupport;
import main.java.Database.DatabaseDAO;
import main.java.Database.ProductModel.ProductModel;
import main.java.Database.QAModel.DiscussModel;
import main.java.Database.QAModel.QAModel;
import main.java.Database.ToolModel.ToolModel;
import main.java.Database.UserModel.User;
import org.apache.struts2.interceptor.SessionAware;

import java.sql.SQLException;
import java.util.Map;

public class AdminController extends ActionSupport implements SessionAware {

    public Map<String, Object> session;

    public String reloadQAFPTList() {
        try {
            //Init
            QAModel dataController = new QAModel();
            DatabaseDAO db = new DatabaseDAO();

            //Validation
            if (session.get("user")==null) throw new Exception("Chưa đăng nhập");
            User temp=(User)session.get("user");
            if (temp.getuRole()!=0) throw new Exception("Role not accepted");

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());

                QAController.qaListFPT.clear();

                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }

            //View
        } catch (Exception e) {
            session.put("log_AJAX", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }
    public String reloadToolList() {
        try {
            //Init
            ToolModel dataController = new ToolModel();
            DatabaseDAO db = new DatabaseDAO();

            //Validation
            if (session.get("user")==null) throw new Exception("Chưa đăng nhập");
            User temp=(User)session.get("user");
            if (temp.getuRole()!=0) throw new Exception("Role not accepted");

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());

                ToolController.toolList.clear();

                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }

            //View
        } catch (Exception e) {
            session.put("log_AJAX", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    public String reloadProductList() {
        try {
            //Init
            ProductModel dataController = new ProductModel();
            DatabaseDAO db = new DatabaseDAO();

            //Validation
            if (session.get("user")==null) throw new Exception("Chưa đăng nhập");
            User temp=(User)session.get("user");
            if (temp.getuRole()!=0) throw new Exception("Role not accepted");

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());

                ProductController.productList.clear();

                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }

            //View
        } catch (Exception e) {
            session.put("log_AJAX", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    public String reloadCmtList() {
        try {
            //Init
            DiscussModel dataController = new DiscussModel();
            DatabaseDAO db = new DatabaseDAO();

            //Validation
            if (session.get("user")==null) throw new Exception("Chưa đăng nhập");
            User temp=(User)session.get("user");
            if (temp.getuRole()!=0) throw new Exception("Role not accepted");

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());

                QAController.cmtList.clear();

                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }

            //View
        } catch (Exception e) {
            session.put("log_AJAX", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }
}
