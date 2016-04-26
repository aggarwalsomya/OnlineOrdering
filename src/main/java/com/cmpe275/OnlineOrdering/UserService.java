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
	public List<MenuItem> getMenuItems(String category) {
		Query  q = em.createQuery("Select m from MenuItem m where m.category=:arg1");
		q.setParameter("arg1", category);
		List<MenuItem> ret = new ArrayList<MenuItem>();

		try {
			List<MenuItem> resultList = q.getResultList();
			MenuItem mi = new MenuItem();

			for(int i = 0; i < resultList.size(); i++) {
				mi.setName(resultList.get(i).getName());
				mi.setCategory(resultList.get(i).getCategory());
				mi.setCalories(resultList.get(i).getCalories());
				mi.setUnitprice(resultList.get(i).getUnitprice());
				mi.setPicture(resultList.get(i).getPicture());
				ret.add(mi);
			}			
		} catch (NoResultException e) {
			ret = null;
		}
		return ret;
	}
}
