package kr.co.selad.coupon;

public class CouponDTO {

	private String ccode;
	private String userid;
	private String csd;
	private String cname;
	private String cstr; 
	private String cend; 
	private String ccon; 
	private String csta; 
	
	public CouponDTO() {}

	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCsd() {
		return csd;
	}

	public void setCsd(String csd) {
		this.csd = csd;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCstr() {
		return cstr;
	}

	public void setCstr(String cstr) {
		this.cstr = cstr;
	}

	public String getCend() {
		return cend;
	}

	public void setCend(String cend) {
		this.cend = cend;
	}

	public String getCcon() {
		return ccon;
	}

	public void setCcon(String ccon) {
		this.ccon = ccon;
	}

	public String getCsta() {
		return csta;
	}

	public void setCsta(String csta) {
		this.csta = csta;
	}

	@Override
	public String toString() {
		return "CouponDTO [ccode=" + ccode + ", userid=" + userid + ", csd=" + csd + ", cname=" + cname + ", cstr="
				+ cstr + ", cend=" + cend + ", ccon=" + ccon + ", csta=" + csta + "]";
	}
	
	
}