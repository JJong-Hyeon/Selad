package kr.co.selad.jumun;

public class JumunDTO {
private int	ono;
private String	userid;
private String	naddr; 
private String	gacode; 
private String	req; 
private String	tot; 
private String	ps; 
private String	pcode; 
private String	osort; 
private String	ccode; 
private String	pmdate; 
	


public JumunDTO() {}



public int getOno() {
	return ono;
}



public void setOno(int ono) {
	this.ono = ono;
}



public String getUserid() {
	return userid;
}



public void setUserid(String userid) {
	this.userid = userid;
}



public String getNaddr() {
	return naddr;
}



public void setNaddr(String naddr) {
	this.naddr = naddr;
}



public String getGacode() {
	return gacode;
}



public void setGacode(String gacode) {
	this.gacode = gacode;
}



public String getReq() {
	return req;
}



public void setReq(String req) {
	this.req = req;
}



public String getTot() {
	return tot;
}



public void setTot(String tot) {
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



public String getCcode() {
	return ccode;
}



public void setCcode(String ccode) {
	this.ccode = ccode;
}



public String getPmdate() {
	return pmdate;
}



public void setPmdate(String pmdate) {
	this.pmdate = pmdate;
}



@Override
public String toString() {
	return "JumunDTO [ono=" + ono + ", userid=" + userid + ", naddr=" + naddr + ", gacode=" + gacode + ", req=" + req
			+ ", tot=" + tot + ", ps=" + ps + ", pcode=" + pcode + ", osort=" + osort + ", ccode=" + ccode + ", pmdate="
			+ pmdate + "]";
}




}//class end
