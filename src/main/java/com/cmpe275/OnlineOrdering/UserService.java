package com.cmpe275.OnlineOrdering;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

	@PersistenceContext
	private EntityManager em;

	/**
	 * This method is used to get the details of a all menu items for a
	 * category.
	 * 
	 * @param category
	 *            of the menu item which is to be looked for
	 * @return Menu item details to the user view are returned
	 * @author Somya
	 * @throws UnsupportedEncodingException 
	 */
	@Transactional
	public List<MenuItem> getMenuItems(String category) throws UnsupportedEncodingException {
		Query q = em.createQuery("Select m from MenuItem m where m.category=:arg1");
		q.setParameter("arg1", category);
		List<MenuItem> ret = new ArrayList<MenuItem>();

		try {
			@SuppressWarnings("unchecked")
			List<MenuItem> resultList = q.getResultList();

			for (int i = 0; i < resultList.size(); i++) {
				MenuItem mi = new MenuItem();
				mi.setName(resultList.get(i).getName());
				mi.setCategory(resultList.get(i).getCategory());
				mi.setCalories(resultList.get(i).getCalories());
				mi.setUnitprice(resultList.get(i).getUnitprice());

				byte[] binaryData;
				binaryData = resultList.get(i).getPicture();
				byte[] encodeBase64 = Base64.encodeBase64(binaryData);
				String base64Encoded = new String(encodeBase64, "UTF-8");
				mi.setpicpath(base64Encoded);
				ret.add(mi);
			}
		} catch (NoResultException e) {
			ret = null;
		}
		return ret;
	}
	
	/**
	 * It will add the order to the chef's schedule
	 * @param chefid
	 * @param orderid
	 * @param busyFrom
	 * @param busyTo
	 * @param date
	 */
	@Transactional
	public void addOrderToChefSchedule(Schedule sch) {
		em.merge(sch);
	}
	
	@Transactional
	public boolean orderExists(int user_id, int order_id) {
		OrderDetailsId or = new OrderDetailsId();
		or.userid = user_id;
		or.orderid = order_id;
		return em.find(OrderDetails.class, or) != null;
	}
	
	/**
	 * Update the database rows for the order id with the status confirmed (placed order)
	 * @param orderid
	 * @param status
	 * @param string 
	 * @param earlytime 
	 */
	@Transactional
	public void placeOrder(int userid, 
			int orderid, 
			String menu_items, 
			String status,
			String earlydate, 
			String earlytime) {
		
		OrderDetails od = new OrderDetails();
		od.setUserid(userid);
		od.setOrderid(orderid);
		od.setStatus(status);
		od.setMenu_items(menu_items);
		od.setpickup_date(earlydate);
		od.setpickup_time(earlytime);
	
		em.merge(od);
	}
	
	/**
	 * 
	 * @param chefid
	 * @param date
	 * @author Somya
	 * @return 
	 */
	@Transactional
	public Map<Integer, Integer> getScheduleForChef(int chefid, String date) {
		Query  q = em.createQuery("Select s from Schedule s where s.chefid=:arg1 and s.date=:arg2");
		q.setParameter("arg1", chefid);
		q.setParameter("arg2", date);
		
		Map<Integer, Integer>time = new TreeMap<Integer, Integer>();		
		try {
			@SuppressWarnings("unchecked")
			List<Schedule> resultList = q.getResultList();     
			for(int i = 0; i < resultList.size(); i++) {
				time.put(resultList.get(i).getBusystarttime(),resultList.get(i).getBusyendtime());
			}		
		} catch (NoResultException e) {
			time = null;
		}
		return time;

	}

	@Transactional
	public void cancelOrderUnplaced(int orderid, int userid) {
		Query q = em.createQuery("Delete from OrderDetails where orderid=:arg1 and userid=:arg2");
		q.setParameter("arg1", orderid);
		q.setParameter("arg2", userid);
		q.executeUpdate();
	}

	@Transactional
	public String getMenuDetailsForOrder(int orderid, int userid) {
		Query q = em.createQuery("Select od from OrderDetails od where od.orderid=:arg1 and od.userid=:arg2");
		q.setParameter("arg1", orderid);
		q.setParameter("arg2", userid);
		OrderDetails od = new OrderDetails();
		od = (OrderDetails) q.getSingleResult();
		
		System.out.println(od.getMenu_items());
		return od.getMenu_items();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<OrderDetails> getUserOrders(int user_id, String status) {
		System.out.println("user_id is:"+user_id+" status:"+status);
		Query q = em.createQuery("SELECT od FROM OrderDetails od WHERE od.userid = :arg1 and od.status=:arg2");
		q.setParameter("arg1", user_id);
		q.setParameter("arg2", status);
		List<OrderDetails> orderlist = q.getResultList();
		System.out.println(orderlist);
		return orderlist;		
	}
	
}
