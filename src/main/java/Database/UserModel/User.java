package main.java.Database.UserModel;
//Author: Doan Duc Tin

import java.io.Serializable;

public class User implements Serializable {

    private static final long serialVersionUID = -6500665823330706018L;
    private int id;
    private String uName;
    private String uPass;
    private int uRole;
    private String uDigitalName;
    private String uImage;
    private int uStone;
    private String uPhone;
    private String uEmail;
    private String uDob;
    private String uLocation;
    private String uCmt_title;
    private String uCmt_descrip;
    private int uStrength_backend;
    private int uStrength_frontend;
    private int uStrength_alogrythm;
    private int uStrength_designer;
    private int uStrength_creation;
    private String uDatecreated;
    private String uDateupdate;

    //VIEW-Role
    private String role;

    public User() {
    }

    public User(int id, String uName, String uPass, int uRole, String uDigitalName, String uImage, int uStone, String uPhone, String uEmail, String uDob, String uLocation, String uCmt_title, String uCmt_descrip, int uStrength_backend, int uStrength_frontend, int uStrength_alogrythm, int uStrength_designer, int uStrength_creation, String uDatecreated, String uDateupdate, String role) {
        this.id = id;
        this.uName = uName;
        this.uPass = uPass;
        this.uRole = uRole;
        this.uDigitalName = uDigitalName;
        this.uImage = uImage;
        this.uStone = uStone;
        this.uPhone = uPhone;
        this.uEmail = uEmail;
        this.uDob = uDob;
        this.uLocation = uLocation;
        this.uCmt_title = uCmt_title;
        this.uCmt_descrip = uCmt_descrip;
        this.uStrength_backend = uStrength_backend;
        this.uStrength_frontend = uStrength_frontend;
        this.uStrength_alogrythm = uStrength_alogrythm;
        this.uStrength_designer = uStrength_designer;
        this.uStrength_creation = uStrength_creation;
        this.uDatecreated = uDatecreated;
        this.uDateupdate = uDateupdate;
        switch (uRole) {
            case 0:
                this.role = "ADMIN";
                break;
            case 1:
                this.role = "MOD";
                break;
            case 2:
                this.role = "USER";
                break;
            default:
                this.role = "GUEST";
                break;
        }
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getuImage() {
        return uImage;
    }

    public void setuImage(String uImage) {
        this.uImage = uImage;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setuNo(int id) {
        this.id = id;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPass() {
        return uPass;
    }

    public void setuPass(String uPass) {
        this.uPass = uPass;
    }

    public int getuRole() {
        return uRole;
    }

    public void setuRole(int uRole) {
        this.uRole = uRole;
    }

    public String getuDigitalName() {
        return uDigitalName;
    }

    public void setuDigitalName(String uDigitalName) {
        this.uDigitalName = uDigitalName;
    }

    public int getuStone() {
        return uStone;
    }

    public void setuStone(int uStone) {
        this.uStone = uStone;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getuDob() {
        return uDob;
    }

    public void setuDob(String uDob) {
        this.uDob = uDob;
    }

    public String getuLocation() {
        return uLocation;
    }

    public void setuLocation(String uLocation) {
        this.uLocation = uLocation;
    }

    public String getuCmt_title() {
        return uCmt_title;
    }

    public void setuCmt_title(String uCmt_title) {
        this.uCmt_title = uCmt_title;
    }

    public String getuCmt_descrip() {
        return uCmt_descrip;
    }

    public void setuCmt_descrip(String uCmt_descrip) {
        this.uCmt_descrip = uCmt_descrip;
    }

    public int getuStrength_backend() {
        return uStrength_backend;
    }

    public void setuStrength_backend(int uStrength_backend) {
        this.uStrength_backend = uStrength_backend;
    }

    public int getuStrength_frontend() {
        return uStrength_frontend;
    }

    public void setuStrength_frontend(int uStrength_frontend) {
        this.uStrength_frontend = uStrength_frontend;
    }

    public int getuStrength_alogrythm() {
        return uStrength_alogrythm;
    }

    public void setuStrength_alogrythm(int uStrength_alogrythm) {
        this.uStrength_alogrythm = uStrength_alogrythm;
    }

    public int getuStrength_designer() {
        return uStrength_designer;
    }

    public void setuStrength_designer(int uStrength_designer) {
        this.uStrength_designer = uStrength_designer;
    }

    public int getuStrength_creation() {
        return uStrength_creation;
    }

    public void setuStrength_creation(int uStrength_creation) {
        this.uStrength_creation = uStrength_creation;
    }

    public String getuDatecreated() {
        return uDatecreated;
    }

    public void setuDatecreated(String uDatecreated) {
        this.uDatecreated = uDatecreated;
    }

    public String getuDateupdate() {
        return uDateupdate;
    }

    public void setuDateupdate(String uDateupdate) {
        this.uDateupdate = uDateupdate;
    }

}
