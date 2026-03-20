package com.jeonju.movie.user.vo;

public class UserVO {
	private String uno;
	private String uname;
	private String uid;
	private String upw;
	private String ubirth;
	private String uaddr;
	private String ugender;
	private String uphone;
	private String umail;
	private String uprofile;
	private String uinsertdate;
	private String uupdatedate;
	private String udeleteyn;
	private String urole;

	public UserVO() {
		super();
	}
	public UserVO(String uno, String uname, String uid, String upw
			, String ubirth, String uaddr, String ugender, String uphone, String umail
			, String uporfile, String uinsertdate, String uupdatedate, String udeleteyn, String urole) {
		super();
		this.uno = uno;
		this.uname = uname;
		this.uid = uid;
		this.upw = upw;
		this.ubirth = ubirth;
		this.uaddr = uaddr;
		this.ugender = ugender;
		this.uphone = uphone;
		this.umail = umail;
		this.uprofile = uprofile;
		this.uinsertdate = uinsertdate;
		this.uupdatedate = uupdatedate;
		this.udeleteyn = udeleteyn;
		this.urole = urole;
	}
	
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	
	public String getUbirth() {
		return ubirth;
	}
	public void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}
	
	public String getUaddr() {
		return uaddr;
	}
	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}
	
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	
	public String getUmail() {
		return umail;
	}
	public void setUmail(String umail) {
		this.umail = umail;
	}
	
	public String getUprofile() {
		return uprofile;
	}
	public void setUprofile(String uprofile) {
		this.uprofile = uprofile;
	}
	
	public String getUinsertdate() {
		return uinsertdate;
	}
	public void setUinsertdate(String uinsertdate) {
		this.uinsertdate = uinsertdate;
	}
	
	public String getUupdatedate() {
		return uupdatedate;
	}
	public void setUupdatedate(String uupdatedate) {
		this.uupdatedate = uupdatedate;
	}
	
	public String getUdeleteyn() {
		return udeleteyn;
	}
	public void setUdeleteyn(String udeleteyn) {
		this.udeleteyn = udeleteyn;
	}
	
	public String getUrole() {
		return urole;
	}
	public void setUrole(String urole) {
		this.urole = urole;
	}
}
