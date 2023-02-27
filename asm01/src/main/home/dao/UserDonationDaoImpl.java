package main.home.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.entity.Userdonation;

@Repository
public class UserDonationDaoImpl implements UserDonationDao{
	
	// Status display
	private int SUCCESS_STATUS = 1;
	
	@Autowired
	private SessionFactory sessionFactory;

	// Save a new new user donation
	@Override
	public void saveUserDonation(Userdonation theUserdonation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theUserdonation);
	}

	// Get success user donation
	@Override
	public List<Userdonation> getUserDonation(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		int status = SUCCESS_STATUS;
		Query<Userdonation> theQuery =
				currentSession.createQuery("from Userdonation where donationId =:theId"
						+ " and status =:status", Userdonation.class);
		theQuery.setParameter("theId", theId);
		theQuery.setParameter("status", status);
		List<Userdonation> theList = theQuery.list();
		return theList;
	}

}
