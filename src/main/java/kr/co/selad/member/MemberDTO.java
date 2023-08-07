package kr.co.selad.member;

public class MemberDTO {

	private String userid;
	private String upw;				
   	private String uname;
   	private String ujumin1;		
   	private String ujumin2;	
   	private String ugender;	
   	private String uphone1;	
  	private String uphone2;	
  	private String uphone3;	
   	private String uemail	;	
   	private String uzcode;		
   	private String ugrade;		
   	private String udate;			
   	private String uaddr1;		
  	private String uaddr2;		
  	
  	public MemberDTO() {}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getUjumin1() {
		return ujumin1;
	}

	public void setUjumin1(String ujumin1) {
		this.ujumin1 = ujumin1;
	}

	public String getUjumin2() {
		return ujumin2;
	}

	public void setUjumin2(String ujumin2) {
		this.ujumin2 = ujumin2;
	}

	public String getUgender() {
		return ugender;
	}

	public void setUgender(String ugender) {
		this.ugender = ugender;
	}

	public String getUphone1() {
		return uphone1;
	}

	public void setUphone1(String uphone1) {
		this.uphone1 = uphone1;
	}

	public String getUphone2() {
		return uphone2;
	}

	public void setUphone2(String uphone2) {
		this.uphone2 = uphone2;
	}

	public String getUphone3() {
		return uphone3;
	}

	public void setUphone3(String uphone3) {
		this.uphone3 = uphone3;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUzcode() {
		return uzcode;
	}

	public void setUzcode(String uzcode) {
		this.uzcode = uzcode;
	}

	public String getUgrade() {
		return ugrade;
	}

	public void setUgrade(String ugrade) {
		this.ugrade = ugrade;
	}

	public String getUdate() {
		return udate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}

	public String getUaddr1() {
		return uaddr1;
	}

	public void setUaddr1(String uaddr1) {
		this.uaddr1 = uaddr1;
	}

	public String getUaddr2() {
		return uaddr2;
	}

	public void setUaddr2(String uaddr2) {
		this.uaddr2 = uaddr2;
	}

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", upw=" + upw + ", uname=" + uname + ", ujumin1=" + ujumin1
				+ ", ujumin2=" + ujumin2 + ", ugender=" + ugender + ", uphone1=" + uphone1 + ", uphone2=" + uphone2
				+ ", uphone3=" + uphone3 + ", uemail=" + uemail + ", uzcode=" + uzcode + ", ugrade=" + ugrade
				+ ", udate=" + udate + ", uaddr1=" + uaddr1 + ", uaddr2=" + uaddr2 + "]";
	}
  	
  	
}
