package main.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.entity.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	// Number result display
	private int RESULT_PAGE = 5;
	
	@Autowired
	private SessionFactory sessionFactory;

	// Save a new user
	@Override
	public void saveUser(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theUser);
	}

	// Find user by kw and pagination
	@Override
	public List<User> getFindUser(String kw, Integer page) {
		Session currentSession = sessionFactory.getCurrentSession();			
		List<User> users = new ArrayList<>();	
		if(kw != null) {
			Query<User> theQuery = currentSession.createQuery(
					"from User where phoneNumber like :keyword or email like :keyword", User.class);
				theQuery.setParameter("keyword", kw + "%");
				
				int max = RESULT_PAGE;
				theQuery.setFirstResult((page-1)*RESULT_PAGE);
				theQuery.setMaxResults(max);
				users = theQuery.list();
		} else {		
			Query<User> theQuery = 
					currentSession.createQuery("from User" , User.class);
			int max = RESULT_PAGE;
			theQuery.setFirstResult((page-1)*RESULT_PAGE);
			theQuery.setMaxResults(max);
			users = theQuery.list();
		} 
		return users;
	}

	// Count number of user found
	@Override
	public long countFindUser(String kw) {
		Session currentSession = sessionFactory.getCurrentSession();
		List<User> users = new ArrayList<>();
		if(kw != null) {
			Query<User> theQuery = currentSession.createQuery(
					"from User where phoneNumber like :keyword or email like :keyword", User.class);
				theQuery.setParameter("keyword", kw + "%");
				users = theQuery.list();
		} else {
			Query<User> theQuery = 
					currentSession.createQuery("from User" , User.class);
			users = theQuery.list();
		}
		long count = users.size();
		return count;
	}

	// Get user by id
	@Override
	public User getUser(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();		
		User theUser = currentSession.get(User.class, theId);
		return theUser;
	}

	// Delete use by id
	@Override
	public void deleteUser(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();				
		Query theQuery = currentSession.createQuery("delete from User where id=:userId");
		theQuery.setParameter("userId", theId);
		theQuery.executeUpdate();	
	}

	// Change status of user
	@Override
	public void changeStatusUser(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = currentSession.get(User.class, theId);
		int newStatus = theUser.getStatus() + 1;
		theUser.setStatus(newStatus);
		currentSession.saveOrUpdate(theUser);
	}

	// Update information from form for user
	@Override
	public void saveUpdateUser(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		int idUser = theUser.getId();
		User updateUser = currentSession.get(User.class, idUser);
		updateUser.setFullName(theUser.getFullName());
		updateUser.setPhoneNumber(theUser.getPhoneNumber());
		updateUser.setAddress(theUser.getAddress());
		updateUser.setRole(theUser.getRole());
		currentSession.saveOrUpdate(updateUser);
	}
	
}
