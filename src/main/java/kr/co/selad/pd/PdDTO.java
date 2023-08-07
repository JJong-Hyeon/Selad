package kr.co.selad.pd;

public class PdDTO {
	
		private String	pcode;
		private String	cate; 
		private String	pname; 
		private int		price;
		private String	pic; 
		private String	wei; 
		private String	kcal; 
		
		public PdDTO() {}

		public String getPcode() {
			return pcode;
		}

		public void setPcode(String pcode) {
			this.pcode = pcode;
		}

		public String getCate() {
			return cate;
		}

		public void setCate(String cate) {
			this.cate = cate;
		}

		public String getPname() {
			return pname;
		}

		public void setPname(String pname) {
			this.pname = pname;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public String getPic() {
			return pic;
		}

		public void setPic(String pic) {
			this.pic = pic;
		}

		public String getWei() {
			return wei;
		}

		public void setWei(String wei) {
			this.wei = wei;
		}

		public String getKcal() {
			return kcal;
		}

		public void setKcal(String kcal) {
			this.kcal = kcal;
		}

		@Override
		public String toString() {
			return "PdDTO [pcode=" + pcode + ", cate=" + cate + ", pname=" + pname + ", price=" + price + ", pic=" + pic
					+ ", wei=" + wei + ", kcal=" + kcal + "]";
		}
		
		
		
		
}//class end
