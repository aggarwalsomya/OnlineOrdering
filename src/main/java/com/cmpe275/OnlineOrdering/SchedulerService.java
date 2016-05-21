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

	/**
	 * get the order details of the order with the particular id.
	 * @param orderid
	 * @author Meera
	 */
	@Transactional
	public OrderDetails getOrder(int orderid) {

		Query q = em
				.createQuery("Select o from OrderDetails o where o.orderid=:arg1");
		q.setParameter("arg1", orderid);
		OrderDetails ob;
		try {
			ob = (OrderDetails) q.getSingleResult();
		} catch (NoResultException e) {
			ob = null;
		}
		return ob;
	}

	/**
	 * update the status of the order
	 * @param order details
	 * @author Meera
	 */
	@Transactional
	public void updateStatus(OrderDetails ord) {
		
		em.merge(ord);

	}

	/**
	 * deletes the order from chef's schedule
	 * @param order id
	 * @author Meera
	 */
	@Transactional
	public void deleteSchedule(int id) {
		
		Query q = em
				.createQuery("Delete from Schedule s where s.orderid=:arg1");
		q.setParameter("arg1", id);
		q.executeUpdate();

	}

}
