package com.nguyenvantien.entities;

public class User {
    private int id;
    private String username;
    private String password;
    private String fullname;
    private String email;
    private String role;

    // Constructors
    public User() {}

    public User(String username, String password) {
        this.username = username;
        this.password = password;
        this.role = "user"; // Mặc định là user
    }

    public User(String username, String password, String fullname, String email, String role) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.role = role;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}