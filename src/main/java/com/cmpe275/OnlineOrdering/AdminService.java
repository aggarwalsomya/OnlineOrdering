package com.cmpe275.OnlineOrdering;

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
	 * 
	 * @param name of the menu item which is to be looked for
	 * @return Menu item details to the admin are returned
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
	 * This method is used to add a new menu item in the database.
	 * @param MenuItem contains the details of the menu item which needs to be added
	 */
	@Transactional
	public void add(MenuItem m) {
		em.merge(m);
	}
	
	/**
	 * will check if the menu item with the name exists?
	 * @param name of the menu item
	 * @return yes if it exists else no
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
	 */
	public boolean existsById(int id) {
		MenuItem mi = new MenuItem();
		mi.setId(id);
		return em.find(MenuItem.class, id) != null;
	}

	/**
	 * deletes the menu item with the specified name
	 * @param name of the menu item
	 */
	@Transactional
	public void delete(String name) {
		MenuItem entity = new MenuItem();
		entity.setName(name);
		System.out.println("AdminService::Delete called for menu item name:" +name);
		em.remove(em.contains(entity) ? entity : em.merge(entity));
	}
}
