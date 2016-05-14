package com.cmpe275.OnlineOrdering;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

public class SchedulerService {
	
	
	@PersistenceContext
	private EntityManager em;
 
	@Transactional
	public List<Integer> getOrders(String name) {
	
		List<Integer> list = new ArrayList<Integer>();
		Query  q = em.createQuery("Select o from OrderDetails m");
		List<MenuItem> resultList = new ArrayList<MenuItem>();
		return list;
		
	}
}
