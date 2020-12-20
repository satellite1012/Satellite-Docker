package main.java.Database.QAModel;
//Author: Doan Duc Tin

import main.java.Database.UserModel.User;

import java.io.Serializable;

public class Discuss implements Serializable {

    private static final long serialVersionUID = -6500665823330706018L;
    private int id;
    private String name;
    private String comment;
    private int validate;
    private int qa;
    private int user;
    private String datecreated;

    //Relation
    private QA relation_qa;
    private User relation_user;

    public Discuss() {
    }

    public Discuss(int id, String name, String comment, int validate, int qa, int user, String datecreated, QA relation_qa, User relation_user) {
        this.id = id;
        this.name = name;
        this.comment = comment;
        this.validate = validate;
        this.qa = qa;
        this.user = user;
        this.datecreated = datecreated;
        this.relation_qa = relation_qa;
        this.relation_user = relation_user;
    }

    public User getRelation_user() {
        return relation_user;
    }

    public void setRelation_user(User relation_user) {
        this.relation_user = relation_user;
    }

    public QA getRelation_qa() {
        return relation_qa;
    }

    public void setRelation_qa(QA relation_qa) {
        this.relation_qa = relation_qa;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getQa() {
        return qa;
    }

    public void setQa(int qa) {
        this.qa = qa;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
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
