package main.java.Controllers;
//Author: Doan Duc Tin

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import main.java.Database.DatabaseDAO;
import com.opensymphony.xwork2.ActionSupport;
import main.java.Database.UserModel.User;
import main.java.Database.UserModel.UserModel;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

import java.sql.SQLException;
import java.util.Collections;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;

public class UserController extends ActionSupport implements SessionAware {

    public Map<String, Object> session;

    //FRONT-END
    private String username;//form
    private String password;//form
    private String digitalName;//email
    private String email;//email
    private String image;//email
    private String token;//email
    private String thisdate;//email
    private String userId_view;//view user profile

    public String getUserId_view() {
        return userId_view;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getThisdate() {
        return thisdate;
    }

    public void setThisdate(String thisdate) {
        this.thisdate = thisdate;
    }

    public void setUserId_view(String userId_view) {
        this.userId_view = userId_view;
    }

    public String getDigitalName() {
        return digitalName;
    }

    public void setDigitalName(String digitalName) {
        this.digitalName = digitalName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Action(value="profile/{userId_view}")
    public String viewUser() {
        try {
            //Init
            UserModel dataController = new UserModel();
            DatabaseDAO db = new DatabaseDAO();

            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                User s = dataController.selectByUsername(userId_view);
                if (s == null) {
                    throw new Exception("User not found");
                }
                session.put("user_selected", s);
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }
        } catch (Exception e) {
            return "failure";
        }
        return SUCCESS;
    }

    public String editUser1() {
        try {
            //Init
            UserModel dataController = new UserModel();
            DatabaseDAO db = new DatabaseDAO();
            HttpServletRequest request = ServletActionContext.getRequest();
            String uPass_edit = request.getParameter("uPass_edit");
            String uName_edit = request.getParameter("uName_edit");
            String uPhone_edit = request.getParameter("uPhone_edit");
            String uDob_edit = request.getParameter("uDob_edit");
            String uLocation_edit = request.getParameter("uLocation_edit");
            String uTitle_edit = request.getParameter("uTitle_edit");
            String uDescrip_edit = request.getParameter("uDescrip_edit");
            String uS1 = request.getParameter("uS1_edit");
            String uS2 = request.getParameter("uS2_edit");
            String uS3 = request.getParameter("uS3_edit");
            String uS4 = request.getParameter("uS4_edit");
            String uS5 = request.getParameter("uS5_edit");
            String date=request.getParameter("thisdate");
            //Validation
            if (session.get("user")==null) throw new Exception("Chưa đăng nhập");
            int id1=((User)session.get("user")).getId();
            if (id1==4) throw new Exception("Không thể chỉnh sửa tài khoản khách");
            int id2=((User)session.get("user_selected")).getId();
            if (id1!=id2) throw new Exception("Bạn không được chỉnh profile của người khác");
            Validation.validateString(uName_edit);
            Validation.validateString(uLocation_edit);
            Validation.validateString(uPass_edit);
            Validation.validateString(uDescrip_edit);
            Validation.validateString(uTitle_edit);
            Validation.validatePhone(uPhone_edit);
            Validation.validateNumber(uS1,0,100);
            Validation.validateNumber(uS2,0,100);
            Validation.validateNumber(uS3,0,100);
            Validation.validateNumber(uS4,0,100);
            Validation.validateNumber(uS5,0,100);
            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                User temp = (User) session.get("user_selected");
                temp.setuDigitalName(uName_edit);
                temp.setuPass(uPass_edit);
                temp.setuCmt_descrip(uDescrip_edit);
                temp.setuCmt_title(uTitle_edit);
                temp.setuPhone(uPhone_edit);
                temp.setuLocation(uLocation_edit);
                temp.setuDob(uDob_edit);
                temp.setuStrength_backend(Integer.parseInt(uS1));
                temp.setuStrength_frontend(Integer.parseInt(uS2));
                temp.setuStrength_alogrythm(Integer.parseInt(uS3));
                temp.setuStrength_designer(Integer.parseInt(uS4));
                temp.setuStrength_creation(Integer.parseInt(uS5));
                temp.setuDateupdate(date);
                dataController.update(temp);
                session.replace("user_selected", temp);
                db.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                db.closeConnection();
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.put("log_UserController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    public String editUser0() {
        try {
            //Init
            UserModel dataController = new UserModel();
            DatabaseDAO db = new DatabaseDAO();
            HttpServletRequest request = ServletActionContext.getRequest();
            String uPass_edit = request.getParameter("uPass_edit");
            String uName_edit = request.getParameter("uName_edit");
            String uPhone_edit = request.getParameter("uPhone_edit");
            String uDob_edit = request.getParameter("uDob_edit");
            String uLocation_edit = request.getParameter("uLocation_edit");
            String uTitle_edit = request.getParameter("uTitle_edit");
            String uDescrip_edit = request.getParameter("uDescrip_edit");
            String uS1 = request.getParameter("uS1_edit");
            String uS2 = request.getParameter("uS2_edit");
            String uS3 = request.getParameter("uS3_edit");
            String uS4 = request.getParameter("uS4_edit");
            String uS5 = request.getParameter("uS5_edit");
            String date=request.getParameter("thisdate");

            //Validation
            if (session.get("user")==null) throw new Exception("Chưa đăng nhập");
            if (((User)session.get("user")).getuRole()!=0) throw new Exception("Bạn không thể chỉnh profile dưới quyền admin");
            Validation.validateString(uName_edit);
            Validation.validateString(uPass_edit);
            Validation.validateString(uLocation_edit);
            Validation.validateString(uDescrip_edit);
            Validation.validateString(uTitle_edit);
            Validation.validatePhone(uPhone_edit);
            Validation.validateNumber(uS1,0,100);
            Validation.validateNumber(uS2,0,100);
            Validation.validateNumber(uS3,0,100);
            Validation.validateNumber(uS4,0,100);
            Validation.validateNumber(uS5,0,100);
            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                User temp = (User) session.get("user_selected");
                temp.setuPass(uPass_edit);
                temp.setuDigitalName(uName_edit);
                temp.setuCmt_descrip(uDescrip_edit);
                temp.setuCmt_title(uTitle_edit);
                temp.setuPhone(uPhone_edit);
                temp.setuLocation(uLocation_edit);
                temp.setuDob(uDob_edit);
                temp.setuStrength_backend(Integer.parseInt(uS1));
                temp.setuStrength_frontend(Integer.parseInt(uS2));
                temp.setuStrength_alogrythm(Integer.parseInt(uS3));
                temp.setuStrength_designer(Integer.parseInt(uS4));
                temp.setuStrength_creation(Integer.parseInt(uS5));
                temp.setuDateupdate(date);
                dataController.update(temp);
                session.replace("user_selected", temp);
                db.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                db.closeConnection();
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.put("log_UserController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    public String updateUserImage() {
        try {
            //Init
            UserModel dataController = new UserModel();
            DatabaseDAO db = new DatabaseDAO();
            HttpServletRequest request = ServletActionContext.getRequest();
            String image = request.getParameter("imgBase64");

            //Validation
            if (session.get("user")==null) throw new Exception("Chưa đăng nhập");
            int id1=((User)session.get("user")).getId();
            if (id1==4) throw new Exception("Không thể chỉnh sửa tài khoản khách");
            int id2=((User)session.get("user_selected")).getId();
            if (id1!=id2) throw new Exception("Bạn không được chỉnh profile của người khác");
            Validation.validateString(image);
            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                User temp = (User) session.get("user_selected");
                temp.setuImage(image);
                dataController.update(temp);
                session.replace("user_selected", temp);
                db.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                db.closeConnection();
            }
        } catch (Exception e) {
            session.put("log_UserController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    public String login() {
        try {
            //Init
            UserModel dataController = new UserModel();
            DatabaseDAO db = new DatabaseDAO();
            //Excute
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                User s = dataController.findUserByNameAndPass(username, password);
                if (s == null) {
                    throw new Exception("User/Pass in correct or not found");
                }
                session.put("user", s);
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }
        } catch (Exception e) {
            session.put("log_UserController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    public String logout() {
        session.clear();
        return "success";
    }

    public void validationEmailToken(String clientEmail, String clientToken) throws Exception {
        HttpTransport transport = new NetHttpTransport();
        JsonFactory jsonFactory = new JacksonFactory();
        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
                .setAudience(Collections.singletonList("888567468389-5h2gfmlvp5blgria6dnauldlbniloaio.apps.googleusercontent.com"))
                .build();

        // (Receive idTokenString by HTTPS POST)
        GoogleIdToken idToken = verifier.verify(clientToken);
        if (idToken == null) {
            throw new Exception("Nếu nghĩ đơn giản như vậy thì còn lâu mới hack được :)))");
        } else {
            Payload payload = idToken.getPayload();
            String email = payload.getEmail();
            if (!email.equals(clientEmail)) {
                throw new Exception("Biết hack token luôn :)), mà còn non lắm");
            }
        }
    }

    public String randomPass() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        return RandomStringUtils.random(10, characters);
    }

    public String loginEmail() {
        try {
            //Validation
            if (email.isEmpty()) {
                throw new Exception("Empty");
            }
            if (!email.contains("@fpt.edu.vn")) {
                throw new Exception("Bạn chỉ có thể đăng nhập bằng email FPT");
            }
            validationEmailToken(email, token);
            if (image==null|| image.equals("")) image="https://freesvg.org/img/1538346433.png";
            //Init
            UserModel dataController = new UserModel();
            DatabaseDAO db = new DatabaseDAO();
            //Excute
            username = email.replaceAll("@fpt.edu.vn", "");
            try {
                db.openConnection();
                dataController.setConnection(db.getConnection());
                //Create new account
                if (dataController.findUserByEmail(email) == null) {
                    dataController.add(new User(0,username, randomPass(), 2, digitalName,image, 1500, "0123456789", "2000-01-01", email, "Not Update", "Not update", "Not update", 0, 0, 0, 0, 0,thisdate,thisdate,""));
                }
                User s = dataController.findUserByEmail(email);
                session.put("user", s);
                db.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                db.closeConnection();
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.put("log_UserController", e.toString().replaceAll("java.lang.Exception: ", ""));
            return "failure";
        }
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
}
