package jdbc;

public class UserDTO {
	
	private String uid;
	private String upw;
	private String uname;
	private String uphone;
	private String uemail;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public UserDTO(String uid, String upw, String uname, String uphone, String uemail) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.uphone = uphone;
		this.uemail = uemail;
	}

}
