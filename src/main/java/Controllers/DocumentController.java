package main.java.Controllers;
//Author: Doan Duc Tin

import com.opensymphony.xwork2.ActionSupport;
import main.java.Database.DatabaseDAO;
import main.java.Database.DocumentModel.Document;
import main.java.Database.DocumentModel.DocumentModel;
import main.java.Database.Upload.Upload;
import main.java.Database.Upload.UploadModel;
import main.java.Database.UserModel.User;
import main.java.Database.UserModel.UserModel;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

public class DocumentController extends ActionSupport implements SessionAware {

    public Map<String, Object> session;
    private String log_DocumentController;
    private String log_HomeController_DocumentRole = "true";
    //FRONT-END;
    private String documentID;//view normal document
    private String hash;//view remote document
    private String name;//upload
    private String link;//upload

    public String getLog_DocumentController() {
        return log_DocumentController;
    }

    public void setLog_DocumentController(String log_DocumentController) {
        this.log_DocumentController = log_DocumentController;
    }

    public String getLog_HomeController_DocumentRole() {
        return log_HomeController_DocumentRole;
    }

    public void setLog_HomeController_DocumentRole(String log_HomeController_DocumentRole) {
        this.log_HomeController_DocumentRole = log_HomeController_DocumentRole;
    }

    public String getDocumentID() {
        return documentID;
    }

    public void setDocumentID(String documentID) {
        this.documentID = documentID;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String loadContentFirst() {
        //Log
        int times = 0;
        if (session.containsKey("times_document")) times = (int) session.get("times_document");
        times++;
        if (times == 1) {
            session.put("times_document", times);
            session.put("log_HomeController_DocumentRole", log_HomeController_DocumentRole);
        }

        return "success";
    }
    public void paid(User user, int stone, UserModel userController) throws Exception {
        int stoneRemain = user.getuStone() - stone;
        if (user.getuRole() >= 2) {
            if (stoneRemain < 0) {
                throw new Exception("Do not have enough stone!");
            }
            userController.setStone(user.getId(), stoneRemain);
            user.setuStone(stoneRemain);
            session.replace("user",user);
        }
    }

    //In Develop
    public String downRemoteDocument(){
        try {
            //Init
            UploadModel dataController = new UploadModel();
            DatabaseDAO db = new DatabaseDAO();
            HttpServletRequest request = ServletActionContext.getRequest();
            String hashtodown=request.getParameter("hashtodown");
            String fileurl=null;
            boolean notfound=true;

            //Validation
            Validation.validateString(hashtodown);

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                ArrayList<Upload> a = dataController.selectAll();
                for (Upload i : a) {
                    if (i.getdHash().equals(hashtodown)) {
                        fileurl=i.getdLink();
                        notfound=false;
                        break;
                    }
                }
                db.closeConnection();

                //View
                System.out.println(fileurl);
                try (BufferedInputStream in = new BufferedInputStream(new URL(fileurl).openStream());
                     FileOutputStream fileOutputStream = new FileOutputStream("testapi")) {
                    byte dataBuffer[] = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = in.read(dataBuffer, 0, 1024)) != -1) {
                        System.out.println("cc");
                        fileOutputStream.write(dataBuffer, 0, bytesRead);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if (notfound) throw new Exception("Not found");
            } catch (SQLException e) {
                db.closeConnection();
            }
            //View
        } catch (Exception e) {
            session.put("log_DocumentController",e.toString().replaceAll("java.lang.Exception: ",""));
            return "failure";
        }
        return "success";
    }

    public String viewRemoteDocument() {
        try {
            //Init
            UploadModel dataController = new UploadModel();
            DatabaseDAO db = new DatabaseDAO();
            String header = null;
            String date = null;
            String link=null;
            boolean notfound=true;

            //Validation
            Validation.validateString(hash);

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                ArrayList<Upload> a = dataController.selectAll();
                for (Upload i : a) {
                    if (i.getdHash().equals(hash)) {
                        header = i.getdName();
                        date = i.getdDatecreated();
                        link=i.getdLink();
                        notfound=false;
                        break;
                    }
                }
                if (notfound) throw new Exception("Not found");
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }
            //View
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("header", header);
            request.setAttribute("hashtodown", hash);
            request.setAttribute("link",link);
            request.setAttribute("date", date);
        } catch (Exception e) {
            session.put("log_DocumentController",e.toString().replaceAll("java.lang.Exception: ",""));
            return "failure";
        }
        return "success";
    }

    public String viewNormalDocument() {
        try {
            //Init
            DocumentModel dataController = new DocumentModel();
            UserModel userController = new UserModel();
            DatabaseDAO db = new DatabaseDAO();
            ArrayList<Document> a = null;
            User s = (User) session.get("user");

            //Validation
            if (s==null) throw new Exception("Not login yet");
            if (s.getuRole()==3) throw new Exception("The guest account no longer can access this section");

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                userController.setConnection(db.getConnection());
                a = dataController.selectByCourse(documentID);
                paid(s, a.get(0).getdStoneReq(), userController);
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }
            //View
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("dm_list", a);

        } catch (Exception e) {
            session.put("log_DocumentController",e.toString().replaceAll("java.lang.Exception: ",""));
            return "failure";
        }
        return "success";
    }

    public String incViewDocument() {
        try {
            //Init
            DocumentModel dataController = new DocumentModel();
            DatabaseDAO db = new DatabaseDAO();
            HttpServletRequest request = ServletActionContext.getRequest();
            int id= Integer.parseInt(request.getParameter("id"));

            //Validation
            if (session.containsKey("document_had_view_"+id)) throw new Exception("Had view this document");

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                Document temp=dataController.selectById(id);
                dataController.updateView(temp,1);
                session.put("document_had_view_"+id,"true");
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }

        } catch (Exception e) {
            session.put("log_AJAX",e.toString().replaceAll("java.lang.Exception: ",""));
            return "failure";
        }
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }
}
