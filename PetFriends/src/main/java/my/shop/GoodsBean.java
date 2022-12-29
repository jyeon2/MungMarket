package my.shop;

public class GoodsBean {
	private int gnum;
	private String gname;
	private String gcategory_fk;
	private String gimage;
	private String gviewimage;
	private int gqty;
	private int price;
	private String gspec;
	private String gcontents;
	private int point;
	
	private int totalPrice;
	private int totalPoint;
	
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGcategory_fk() {
		return gcategory_fk;
	}
	public void setGcategory_fk(String gcategory_fk) {
		this.gcategory_fk = gcategory_fk;
	}
	public String getGimage() {
		return gimage;
	}
	public void setGimage(String gimage) {
		this.gimage = gimage;
	}
	public String getGviewimage() {
		return gviewimage;
	}
	public void setGviewimage(String gviewimage) {
		this.gviewimage = gviewimage;
	}
	public int getGqty() {
		return gqty;
	}
	public void setGqty(int gqty) {
		this.gqty = gqty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGspec() {
		return gspec;
	}
	public void setGspec(String gspec) {
		this.gspec = gspec;
	}
	public String getGcontents() {
		return gcontents;
	}
	public void setGcontents(String gcontents) {
		this.gcontents = gcontents;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

}
