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
public class SchedulerService {
	
	
	@PersistenceContext
	private EntityManager em;
 
	
	//get orders for specific date
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> getOrders(String date) {
	
		System.out.println("entered");
		List<Schedule> resultList = new ArrayList<Schedule>();
		
		Query  q = em.createQuery("Select s from Schedule s where s.date=:arg1");
		q.setParameter("arg1", date);
		
		try {
			
			resultList = q.getResultList();  
					
		} catch (NoResultException e) {
			resultList = null;
			System.out.println("got in no result " + resultList);
		}
		return resultList;
		
	}


	@Transactional
	public int getPickuptime(int orderid) {
		// TODO Auto-generated method stub
		Query q = em.createQuery("Select o from OrderDetails o where o.orderid=:arg1");
		q.setParameter("arg1", orderid);
		OrderDetails ob;
		try {
		 ob = (OrderDetails)q.getSingleResult();
		} catch(NoResultException e) {
			ob = null;
			return 0;
		}
		return  Utils.getTimeinMins(ob.getpickup_time());
	}


	@Transactional
	public OrderDetails getOrder(int orderid) {
		// TODO Auto-generated method stub
		
		Query q = em.createQuery("Select o from OrderDetails o where o.orderid=:arg1");
		q.setParameter("arg1", orderid);
		OrderDetails ob;
		try {
		 ob = (OrderDetails)q.getSingleResult();
		} catch(NoResultException e) {
			ob = null;
		}
		return ob;
	}

    @Transactional
	public void updateStatus(OrderDetails ord) {
		// TODO Auto-generated method stub
    	em.merge(ord);
		
	}
	
	
}
