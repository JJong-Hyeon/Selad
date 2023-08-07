package kr.co.selad.pay;

public class PayDTO {
	
	private String ono;
	private String userid;
	private String gacode;
	private String ccode;
	private String oaddr;
	private String req;
	private int tot;
	private String ps;
	private String pcode;
	private String osort;
	private int bno;
    private String pmdate;
    
    
    
    public  PayDTO() {}



	public String getOno() {
		return ono;
	}



	public void setOno(String ono) {
		this.ono = ono;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getGacode() {
		return gacode;
	}



	public void setGacode(String gacode) {
		this.gacode = gacode;
	}



	public String getCcode() {
		return ccode;
	}



	public void setCcode(String ccode) {
		this.ccode = ccode;
	}



	public String getOaddr() {
		return oaddr;
	}



	public void setOaddr(String oaddr) {
		this.oaddr = oaddr;
	}



	public String getReq() {
		return req;
	}



	public void setReq(String req) {
		this.req = req;
	}



	public int getTot() {
		return tot;
	}



	public void setTot(int tot) {
		this.tot = tot;
	}



	public String getPs() {
		return ps;
	}



	public void setPs(String ps) {
		this.ps = ps;
	}



	public String getPcode() {
		return pcode;
	}



	public void setPcode(String pcode) {
		this.pcode = pcode;
	}



	public String getOsort() {
		return osort;
	}



	public void setOsort(String osort) {
		this.osort = osort;
	}



	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	public String getPmdate() {
		return pmdate;
	}



	public void setPmdate(String pmdate) {
		this.pmdate = pmdate;
	}



	@Override
	public String toString() {
		return "OrderDTO [ono=" + ono + ", userid=" + userid + ", gacode=" + gacode + ", ccode=" + ccode + ", oaddr="
				+ oaddr + ", req=" + req + ", tot=" + tot + ", ps=" + ps + ", pcode=" + pcode + ", osort=" + osort
				+ ", bno=" + bno + ", pmdate=" + pmdate + "]";
	}
    
    
    
    
}
