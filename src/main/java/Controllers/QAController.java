package main.java.Controllers;

import com.opensymphony.xwork2.ActionSupport;
import main.java.Database.DatabaseDAO;
import main.java.Database.QAModel.Discuss;
import main.java.Database.QAModel.DiscussModel;
import main.java.Database.QAModel.QA;
import main.java.Database.QAModel.QAModel;
import main.java.Database.UserModel.User;
import main.java.Database.UserModel.UserModel;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class QAController extends ActionSupport implements SessionAware, ServletRequestAware {

    public Map<String, Object> session;
    public static ArrayList<QA> qaListFPT = new ArrayList<>();
    //public static ArrayList<QA> qaListSAT = new ArrayList<>();
    public static ArrayList<Discuss> cmtList = new ArrayList<>();

    public String getQAListFPT() {
        try {
            //Init
            QAModel dataController1 = new QAModel();
            DiscussModel dataController2 = new DiscussModel();
            DatabaseDAO db = new DatabaseDAO();

            //Validation

            //Excute
            try {
                db.openConnection();
                dataController1.setConnection(db.getConnection());
                dataController2.setConnection(db.getConnection());

                //Get list qa fpt
                if (qaListFPT==null||qaListFPT.isEmpty()) {
                    ArrayList<QA> qaList = dataController1.selectAll();
                    for (QA i : qaList) {
                        if (i.getType().equals("FPT")) {
                            qaListFPT.add(i);
                        }
                    }
                }

                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }

            //View
        } catch (Exception e) {
            session.put("log_QAFPTController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    public String getQAFPT() {
        try {
            //Init
            HttpServletRequest request = ServletActionContext.getRequest();
            QAModel qaModel = new QAModel();
            DiscussModel discussModel=new DiscussModel();
            UserModel userModel=new UserModel();
            DatabaseDAO db = new DatabaseDAO();

            //Get F_E
            int id=Integer.parseInt(request.getParameter("id"));

            //Validation

            //Excute
            try {
                db.openConnection();
                qaModel.setConnection(db.getConnection());
                discussModel.setConnection(db.getConnection());
                userModel.setConnection(db.getConnection());

                //SQL
                QA qa=qaModel.selectById(id);
                if(qa==null) return "failure";
                request.setAttribute("QASelected",qa);
                request.setAttribute("CmtList",discussModel.selectByQA(id));

                db.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                db.closeConnection();
            }

            //View
        } catch (Exception e) {
            e.printStackTrace();
            session.put("log_QAController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    public String addQaFPT() {
        try {
            //Init
            HttpServletRequest request = ServletActionContext.getRequest();
            QAModel dataController = new QAModel();
            UserModel userModel=new UserModel();
            DatabaseDAO db = new DatabaseDAO();

            //Get F_E
            String data = request.getParameter("data");
            String[] listData = data.split("bug->bug");
            String title = listData[0];
            String des = listData[1];
            String image = listData[2];
            int user = Integer.parseInt(listData[3]);
            String date= (new SimpleDateFormat("yyyy/MM/dd HH:mm:ss")).format(new Date());

            //Validation
            if (session.get("user") == null) user = 4;
            else if (user != ((User) session.get("user")).getId()) throw new Exception("Role not match, not accepted!");
            Validation.validateString(title);
            Validation.validateString(des);
            Validation.validateString(image);
            Validation.validateToken(request.getHeader("Referer"));

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                userModel.setConnection(db.getConnection());

                //SQL
                QA temp=new QA(0, user, title, image, des, 0, date, 0, "FPT", userModel.selectById(user));
                dataController.add(temp);

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

    public String addCmt() {
        try {
            //Init
            HttpServletRequest request = ServletActionContext.getRequest();
            DiscussModel dataController1 = new DiscussModel();
            QAModel dataController2 = new QAModel();
            UserModel userModel=new UserModel();
            DatabaseDAO db = new DatabaseDAO();

            //Get F_E
            String data = request.getParameter("data");
            String[] listData = data.split("bug->bug");
            String comment = listData[0];
            int qa = Integer.parseInt(listData[1]);
            int user = Integer.parseInt(listData[2]);
            String date= (new SimpleDateFormat("yyyy/MM/dd HH:mm:ss")).format(new Date());

            //Validation
            if (session.get("user") == null) user = 4;
            else if (user != ((User) session.get("user")).getId()) throw new Exception("Role not match, not accepted!");
            Validation.validateEmpty(comment);
            Validation.validateToken(request.getHeader("Referer"));

            //Excute
            try {
                db.openConnection();
                dataController1.setConnection(db.getConnection());
                dataController2.setConnection(db.getConnection());
                userModel.setConnection(db.getConnection());

                //SQL
                Discuss temp=new Discuss(0, "", comment, 0, qa, user, date, dataController2.selectById(qa), userModel.selectById(user));
                dataController1.add(temp);
                dataController2.updateAnswerCount(dataController2.selectById(qa), 1);
                QA sltQa=dataController2.selectById(qa);
                if(sltQa==null) return "failure";
                request.setAttribute("CmtList",dataController1.selectByQA(qa));

                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }

            //View
        } catch (Exception e) {
            e.printStackTrace();
            session.put("log_AJAX", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }

        return "success";
    }

    public String likeCmt() {
        try {
            //Init
            HttpServletRequest request = ServletActionContext.getRequest();
            DiscussModel dataController = new DiscussModel();
            DatabaseDAO db = new DatabaseDAO();

            //Get F_E
            int id=Integer.parseInt(request.getParameter("data"));

            //Validation
            Validation.validateToken(request.getHeader("Referer"));

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());

                //SQL
                Discuss temp = dataController.selectById(id);
                if (!session.containsKey("cmt_liked_of_" + id)) {
                    dataController.updateLiked(temp, 1);
                    session.put("cmt_liked_of_" + id, "session_had_liked");
                } else throw new Exception("This session had liked this comment, try again later!");

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

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {

    }
}
