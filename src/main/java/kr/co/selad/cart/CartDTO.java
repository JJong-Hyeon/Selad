package kr.co.selad.cart;


public class CartDTO {

	private int pno; 
	private String userid;
	private String totpcode;  
	private int totprice; 
	private String mpic;
	private String mname;
	private String totpname;
	private double totkcal; 
	
	
	public CartDTO() {}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTotpcode() {
		return totpcode;
	}

	public void setTotpcode(String totpcode) {
		this.totpcode = totpcode;
	}

	public int getTotprice() {
		return totprice;
	}

	public void setTotprice(int totprice) {
		this.totprice = totprice;
	}

	public String getMpic() {
		return mpic;
	}

	public void setMpic(String mpic) {
		this.mpic = mpic;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getTotpname() {
		return totpname;
	}

	public void setTotpname(String totpname) {
		this.totpname = totpname;
	}

	public double getTotkcal() {
		return totkcal;
	}

	public void setTotkcal(double totkcal) {
		this.totkcal = totkcal;
	}

	@Override
	public String toString() {
		return "CartDTO [pno=" + pno + ", userid=" + userid + ", totpcode=" + totpcode + ", totprice=" + totprice
				+ ", mpic=" + mpic + ", mname=" + mname + ", totpname=" + totpname + ", totkcal=" + totkcal + "]";
	}




	


	

	
	

}//class end



