package com.cmpe275.OnlineOrdering;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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
				mi.setPicture(resultList.get(i).getPicture());
				mi.setPreptime(resultList.get(i).getPreptime());
				ret.add(mi);
			}			
		} catch (NoResultException e) {
			ret = null;
		}
		return ret;
	}
}
