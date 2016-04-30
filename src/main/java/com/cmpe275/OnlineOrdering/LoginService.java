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

	/**
	 * will check if the temp user with the Id exists?
	 * 
	 * @param Id
	 *            of the temp user
	 * @return true if it exists else false
	 */
	public boolean existsById(int id) {
		TempUser te = new TempUser();
		te.setId(id);
		return em.find(TempUser.class, id) != null;
	}

	// check if email and code for temp user already exists.
	@Transactional
	public boolean tuserExists(String email) {
		TempUser t;
		Query q = em
				.createQuery("Select t from TempUser t where t.email=:arg1");
		q.setParameter("arg1", email);
		try {
			t = (TempUser) q.getSingleResult();
			return true;
		} catch (NoResultException e) {
			t = null;
			return false;
		}

	}

	// update record of temp user with new code.
	@Transactional
	public void updateTuser(TempUser t) {
		em.merge(t);
	}

}
