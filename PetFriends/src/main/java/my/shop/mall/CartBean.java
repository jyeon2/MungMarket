package my.shop.mall;

import java.util.Vector;

import my.shop.GoodsBean;
import my.shop.GoodsDao;


public class CartBean {
	Vector<GoodsBean> lists;
	
	public CartBean(){ 
		lists = new Vector<GoodsBean>();
	}
	
	public void addGoods(String gnum, String oqty) {
		
		GoodsDao gdao = GoodsDao.getInstance();
		GoodsBean gb = gdao.selectByGnum(gnum); 
		
		for(int i=0;i<lists.size();i++) {
			
			int cGum = lists.get(i).getGnum();
			
			if(cGum == Integer.parseInt(gnum)) {
				int cGqty = lists.get(i).getGqty() + Integer.parseInt(oqty);
				lists.get(i).setGqty(cGqty);	
				lists.get(i).setTotalPrice(lists.get(i).getPrice() * cGqty);
				lists.get(i).setTotalPoint(lists.get(i).getPoint() * cGqty);
				return;
			}
			
		}
		
		gb.setGqty(Integer.parseInt(oqty)); 
		
		int totalPrice = gb.getPrice() * Integer.parseInt(oqty);
		int totalPoint = gb.getPoint() * Integer.parseInt(oqty);
		gb.setTotalPrice(totalPrice);
		gb.setTotalPoint(totalPoint);
		
		lists.add(gb);
		System.out.println("장바구니 개수:" + lists.size());
		
	}//addProduct
	
		public Vector<GoodsBean> getAllGoods() {
			
			return lists;
			
		}//getAllGoods
		

		public void setEdit(String gnum, String oqty) {
			
			for(GoodsBean gb : lists) { 
				
				if(gb.getGnum() == Integer.parseInt(gnum)) {
					gb.setGqty(Integer.parseInt(oqty));
					gb.setTotalPrice(gb.getPrice() * Integer.parseInt(oqty));
					gb.setTotalPoint(gb.getPoint() * Integer.parseInt(oqty));
					break;
				}
			}
		}
		
		
		public void removeGoods(String gnum) {
			
			for(GoodsBean gb : lists) {
				if(gb.getGnum() == Integer.parseInt(gnum)){
					lists.removeElement(gb);
					break;
				}
			}
		}//removeGoods
		
		public void removeAllGoods() {
			lists.removeAllElements();
		}
	}

