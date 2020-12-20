package main.java.Controllers;

import main.java.Database.DatabaseDAO;
import main.java.Database.ProductModel.Product;
import main.java.Database.ProductModel.ProductModel;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class ProductController extends ActionSupport implements SessionAware {

    public Map<String, Object> session;
    private String log_HomeController_JAVACODE = "true";
    private String log_HomeController_APPGAME = "true";
    public static ArrayList<Product> productList = new ArrayList<>();

    public static ArrayList<Product> productList_Game = new ArrayList<>();
    public static ArrayList<Product> productList_App = new ArrayList<>();
    public static ArrayList<Product> productList_Web = new ArrayList<>();

    public String getLog_HomeController_JAVACODE() {
        return log_HomeController_JAVACODE;
    }

    public void setLog_HomeController_JAVACODE(String log_HomeController_JAVACODE) {
        this.log_HomeController_JAVACODE = log_HomeController_JAVACODE;
    }

    public String getLog_HomeController_APPGAME() {
        return log_HomeController_APPGAME;
    }

    public void setLog_HomeController_APPGAME(String log_HomeController_APPGAME) {
        this.log_HomeController_APPGAME = log_HomeController_APPGAME;
    }

    public String loadContentFirst() {
        //Log
        int times = 0;
        if (session.containsKey("times_product")) times = (int) session.get("times_product");
        times++;
        if (times == 1) {
            session.put("times_product", times);
            session.put("log_HomeController_JAVACODE",log_HomeController_JAVACODE);
            session.put("log_HomeController_APPGAME",log_HomeController_APPGAME);
        }

        //Get Products Lists
        if (productList==null||productList.isEmpty()) getProductList();

        return "success";
    }

    public String getProductList() {
        try {
            //Init
            ProductModel dataController = new ProductModel();
            DatabaseDAO db = new DatabaseDAO();
            //Validation

            //Excute
            try {
                //Init
                db.openConnection();
                dataController.setConnection(db.getConnection());
                productList = dataController.selectAll();

                //Update
                productList_Game.clear();
                productList_App.clear();
                productList_Web.clear();
                for (Product i : productList) {
                    if (i.getpType().equals("GAME")) productList_Game.add(i);
                    if (i.getpType().equals("APP")) productList_App.add(i);
                    if (i.getpType().equals("WEB")) productList_Web.add(i);
                }
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
        session = map;
    }
}
