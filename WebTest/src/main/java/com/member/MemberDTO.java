package com.member;

public class MemberDTO {

    private String name;
    private String id;
    private String password;
    private String phone;
    private String email;
    private String memberStatus;
    private String memberRole;
    
    public MemberDTO(String name, String id, String password, String phone, String email, String memberStatus, String memberRole) {
        this.name = name;
        this.id = id;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.memberStatus = memberStatus;
        this.memberRole = memberRole;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMemberStatus() {
        return memberStatus;
    }

    public void setMemberStatus(String memberStatus) {
        this.memberStatus = memberStatus;
    }

    public String getMemberRole() {
        return memberRole;
    }

    public void setMemberRole(String memberRole) {
        this.memberRole = memberRole;
    }
}
