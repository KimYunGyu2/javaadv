package jdbc;

public class AdminDTO {

	private String aid;
	private String apw;
	private String aname;
	private String aphone;
	private String aemail;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getApw() {
		return apw;
	}
	public void setApw(String apw) {
		this.apw = apw;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAphone() {
		return aphone;
	}
	public void setAphone(String aphone) {
		this.aphone = aphone;
	}
	public String getAemail() {
		return aemail;
	}
	public void setAemail(String aemail) {
		this.aemail = aemail;
	}
	public AdminDTO(String aid, String apw, String aname, String aphone, String aemail) {
		super();
		this.aid = aid;
		this.apw = apw;
		this.aname = aname;
		this.aphone = aphone;
		this.aemail = aemail;
	}
	
	
	
}
