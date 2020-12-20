package main.java.Database.QAModel;
//Author: Doan Duc Tin

import main.java.Database.UserModel.User;

import java.io.Serializable;

public class QA implements Serializable {

    private static final long serialVersionUID = -6500665823330706018L;
    private int id;
    private int user;
    private String title;
    private String image;
    private String content;
    private int answered;
    private String datecreated;
    private int validate;
    private String type;

    //Relation
    private User relation_user;

    public QA() {
    }

    public QA(int id, int user, String title, String image, String content, int answered, String datecreated, int validate, String type, User relation_user) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.image = image;
        this.content = content;
        this.answered = answered;
        this.datecreated = datecreated;
        this.validate = validate;
        this.type = type;
        this.relation_user = relation_user;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public User getRelation_user() {
        return relation_user;
    }

    public void setRelation_user(User relation_user) {
        this.relation_user = relation_user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAnswered() {
        return answered;
    }

    public void setAnswered(int answered) {
        this.answered = answered;
    }

    public String getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(String datecreated) {
        this.datecreated = datecreated;
    }

    public int getValidate() {
        return validate;
    }

    public void setValidate(int validate) {
        this.validate = validate;
    }
}
