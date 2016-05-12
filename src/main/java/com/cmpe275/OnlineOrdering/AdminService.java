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
public class AdminService {

	@PersistenceContext
	private EntityManager em;

	/** This method is used to get the details of a specific menu item with the name as passed.
	 * @param name of the menu item which is to be looked for
	 * @return Menu item details to the admin are returned
	 * @author Somya
	 */
	@Transactional
	public MenuItem getMenuItem(String name) {
		
		MenuItem m;
		Query q = em.createQuery("Select m from MenuItem m where m.name=:arg1");
		q.setParameter("arg1", name);
		try {
			m = (MenuItem) q.getSingleResult();
		} catch (NoResultException e) {
			m = null;
		}
		return m;
	}
	
	/**
	 * It will get the total prepTime for all the items ordered in a menu
	 * @return
	 */
	public int getTotalPrepTimeForMenuItem(String menuitem_name) {
		MenuItem mi;
		Query q = em.createQuery("Select mi from MenuItem mi where mi.name=:arg1");
		q.setParameter("arg1", menuitem_name);
		try {
			mi = (MenuItem) q.getSingleResult();
			if (mi != null) {
				return mi.getPreptime();
			}
		} catch (NoResultException e) {
			mi = null;
		}
		return 0;	
	}
	
	public float getPriceForMenuItem(String menuitem_name) {
		MenuItem mi;
		Query q = em.createQuery("Select mi from MenuItem mi where mi.name=:arg1");
		q.setParameter("arg1", menuitem_name);
		try {
			mi = (MenuItem) q.getSingleResult();
			if (mi != null) {
				return mi.getUnitprice();
			}
		} catch (NoResultException e) {
			mi = null;
		}
		return 0;	
	}


	/**
	 * This method is used to add a new menu item in the database.
	 * @param MenuItem contains the details of the menu item which needs to be added
	 * @author Somya
	 */
	@Transactional
	public void add(MenuItem m) {
		em.merge(m);
	}
	
	/**
	 * will check if the menu item with the name exists?
	 * @param name of the menu item
	 * @return yes if it exists else no
	 * @author Somya
	 */
	public boolean exists(String name) {
		MenuItem mi = new MenuItem();
		mi.setName(name);
		return em.find(MenuItem.class, name) != null;
	}
	
	/**
	 * will check if the menu item with the Id exists?
	 * @param Id of the menu item
	 * @return yes if it exists else no
	 * @author Somya
	 */
	public boolean existsById(int id) {
		MenuItem mi = new MenuItem();
		mi.setId(id);
		return em.find(MenuItem.class, id) != null;
	}

	/**
	 * deletes the menu item with the specified name
	 * @param name of the menu item
	 * @author Somya
	 */
	@Transactional
	public void delete(String name) {
		Query q = em.createQuery("Delete from MenuItem m where m.name=:arg1");
		q.setParameter("arg1", name);
		q.executeUpdate();
	}
	
	/**
	 * deletes the order with the specified order id
	 * @param orderid
	 * @author Somya
	 */
	@Transactional
	public void deleteOrder(int orderid) {
		Query q = em.createQuery("Delete from OrderDetails od where od.orderid=:arg1");
		q.setParameter("arg1", orderid);
		q.executeUpdate();
	}
	
	
	
	/**
	 * This function will reset the orders, clean up any existing orders.
	 */
	@Transactional
	public void systemreset() {
		Query q = em.createQuery("Delete from Schedule sch");
		q.executeUpdate();
		
		q = em.createQuery("Delete from OrderDetails od");
		q.executeUpdate();
	}
	
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<MenuItem> getAllMenuItems() {
		
		Query  q = em.createQuery("Select m from MenuItem m");
		List<MenuItem> resultList = new ArrayList<MenuItem>();
		List<MenuItem> ret = new ArrayList<MenuItem>();
		try {
			resultList = q.getResultList();
			for(int i = 0; i < resultList.size(); i++) {
				MenuItem mi = new MenuItem();
				mi.setName(resultList.get(i).getName());
				mi.setCategory(resultList.get(i).getCategory());
				mi.setCalories(resultList.get(i).getCalories());
				mi.setUnitprice(resultList.get(i).getUnitprice());
				
				byte[] binaryData;
				binaryData = resultList.get(i).getPicture();
				byte[] encodeBase64 = Base64.encodeBase64(binaryData);
				String base64Encoded;
				try {
					base64Encoded = new String(encodeBase64, "UTF-8");
					mi.setpicpath(base64Encoded);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				
				mi.setPreptime(resultList.get(i).getPreptime());
				ret.add(mi);
			}			
		} catch (NoResultException e) {
			ret = null;
		}
		return ret;
	}

	public List<Order> getAllOrders() {		
		Query q = em.createQuery("SELECT d.orderid, "
				+ "c.fullname,"
				+ "c.email,"
				+ "d.menu_items,"
				+ "d.status,"
				+ "d.pickup_date,"
				+ "d.pickup_time,"
				+ "d.price,"
				+ "s.busystarttime,"
				+ "s.busyendtime"
				+ " FROM UserCredentials c, OrderDetails d, Schedule s WHERE c.id = d.userid and d.orderid = s.orderid");
		
		@SuppressWarnings("unchecked")
		List<Object[]> resultList = q.getResultList();
		List<Order> result = new ArrayList<Order>(resultList.size());
		for (Object[] row : resultList) {
			String busystarttime = convertToTime((Integer)row[8]);
			String busyendtime = convertToTime((Integer)row[9]);
			
		    result.add(new Order((Integer) row[0],
		                            (String) row[1],
		                            (String) row[2],
		                            (String) row[3],
		                            (String) row[4],
		                            (String) row[5],
		                            (String) row[6],
		                            (Float)  row[7],
		                            busystarttime,
		                            busyendtime
		    		));
		}
		
		for(int i = 0; i < result.size(); i++) {
			String menuItems = result.get(i).getMenu_items();
			Map<String, Integer> m = deserializeMenuItems(menuItems);
			result.get(i).setMenumap(m);
			System.out.println(result.get(i).getpickup_time());
			System.out.println(result.get(i).getpickup_time());
		}

		return result;
	}
	
	private String convertToTime(Integer time) {
		String startTime = "00:00";
		int h = time / 60 + Integer.parseInt(startTime.substring(0, 2));
		int m = time % 60 + Integer.parseInt(startTime.substring(3, 5));
		String hr = String.valueOf(h);
		String min = String.valueOf(m);
		
		if(h <= 9)
			hr = "0"+h;
		if(m <= 9)
			min = "0"+m;
		
		return hr + ":" + min;
	}

	private Map<String, Integer> deserializeMenuItems(String mi) {
		String[] items = mi.split(";;");
		Map<String, Integer> menu_items = new TreeMap<String, Integer>();
		for (String item : items) {
			String[] parts = item.split("::");
			menu_items.put(parts[0], Integer.parseInt(parts[1]));
		}
		return menu_items;
	}
}
