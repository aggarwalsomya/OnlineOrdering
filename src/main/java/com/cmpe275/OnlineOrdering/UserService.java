package com.cmpe275.OnlineOrdering;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

	@PersistenceContext
	private EntityManager em;


	/** This method is used to get the details of a all menu items for a category.
	 * 
	 * @param category of the menu item which is to be looked for
	 * @return Menu item details to the user view are returned
	 */
	@Transactional
	public MenuItem[] getMenuItems(String category) {
		MenuItem[] mi = null;
		Query  q = em.createQuery("Select m from MenuItem m where m.category=:arg1");
		q.setParameter("arg1", category);
		try {
			List<Object> resultList = q.getResultList();
			for (Object result : resultList) {
			    Object[] r = (Object[]) result;
			    for (Object r1: r) {
			        System.out.println(r1.toString());
			    }
			 
			}
		} catch (NoResultException e) {
			mi = null;
		}
		return mi;
	}
}
