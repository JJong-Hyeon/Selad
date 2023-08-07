package kr.co.selad.gameng;

public class GamengDTO {
	private String gacode;
	private String gname;
	private long gapno;
	private String gaaddr;
	private double lat;
	private double lng;
	
	public GamengDTO() {}

	public String getGacode() {
		return gacode;
	}

	public void setGacode(String gacode) {
		this.gacode = gacode;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public long getGapno() {
		return gapno;
	}

	public void setGapno(long gapno) {
		this.gapno = gapno;
	}

	public String getGaaddr() {
		return gaaddr;
	}

	public void setGaaddr(String gaaddr) {
		this.gaaddr = gaaddr;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "GamengDTO [gacode=" + gacode + ", gname=" + gname + ", gapno=" + gapno + ", gaaddr=" + gaaddr + ", lat="
				+ lat + ", lng=" + lng + "]";
	}

	
}
	
	
