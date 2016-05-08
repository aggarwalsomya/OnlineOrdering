package com.cmpe275.OnlineOrdering;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LoginService {

	@PersistenceContext
	private EntityManager em;

	// adds temperory user and code data to table.
	@Transactional
	public void addTuser(TempUser t) {
		em.merge(t);
	}
	
	//delete temperory user 
	@Transactional
	public void delTuser(TempUser t) {
		System.out.println(t.getId());
		em.remove(em.contains(t) ? t : em.merge(t));
	}
	
	//adds user details to table
	@Transactional
	public void adduser(UserCredentials u) {
		em.merge(u);
	}

	/**
	 * will check if the temp user with the Id exists?
	 * 
	 * @param Id
	 *            of the temp user
	 * @return true if it exists else false
	 */
	public boolean existsByIdTuser(int id) {
		TempUser te = new TempUser();
		te.setId(id);
		return em.find(TempUser.class, id) != null;
	}

	/**
	 * will check if the user with the Id exists?
	 * 
	 * @param Id
	 *            of the  user
	 * @return true if it exists else false
	 */
	public boolean existsById(int id) {
		UserCredentials uc = new UserCredentials();
		uc.setId(id);
		return em.find(UserCredentials.class, id) != null;
	}
	
	

	// update record of temp user with new code.
	@Transactional
	public void updateTuser(TempUser t) {
		em.merge(t);
	}
	
	//get specific temp user by searching by email.
	@Transactional
	public TempUser getTuser(String email) {
		TempUser t;
		Query q = em
				.createQuery("Select t from TempUser t where t.email=:arg1");
		q.setParameter("arg1", email);
		try {
			t = (TempUser) q.getSingleResult();
			
		} catch (NoResultException e) {
			t = null;
			
		}
		return t;
	}

}
