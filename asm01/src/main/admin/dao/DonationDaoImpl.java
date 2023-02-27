package main.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.entity.Donation;
import main.entity.Userdonation;

@Repository
public class DonationDaoImpl implements DonationDao {
	
	// Number result display
	private int RESULT_PAGE = 5;
	
	// Status for donation
	private int NEW_STATUS = 0;
	private int ACTIVE_STATUS = 1;
	private int END_STATUS = 2;
	private int CLOSE_STATUS = 3;
	
	// Status for user donation
	private int SUCCESS_STATUS = 1;
	private int FAIL_STATUS = 2;
	
	@Autowired
	private SessionFactory sessionFactory;

	// Find donation by kw and pagination by page
	@Override
	public List<Donation> getFindDonation(String kw, Integer page) {
		Session currentSession = sessionFactory.getCurrentSession();
		List<Donation> donations = new ArrayList<>();
		int status = -1;
		if(kw != null) {
			if("Mới tạo".contains(kw)) {
				status = NEW_STATUS;
			} else if ("Đang quyên góp".contains(kw)) {
				status = ACTIVE_STATUS;
			} else if ("Kết thúc".contains(kw)){
				status = END_STATUS;
			} else if ("Đóng".contains(kw)){
				status = CLOSE_STATUS;
			}
			Query<Donation> theQuery = currentSession.createQuery(
					"from Donation where"
					+ " phoneNumber like :keyword"
					+ " or organizationName like :keyword"
					+ " or code like :keyword"
					+ " or status =:status", Donation.class);
			theQuery.setParameter("keyword", kw + "%");
			theQuery.setParameter("status", status);
			int max = RESULT_PAGE;
			theQuery.setFirstResult((page-1)*RESULT_PAGE);
			theQuery.setMaxResults(max);
			donations = theQuery.list();
		} else {
			Query<Donation> theQuery = 
					currentSession.createQuery("from Donation", Donation.class);
			int max = RESULT_PAGE;
			theQuery.setFirstResult((page-1)*RESULT_PAGE);
			theQuery.setMaxResults(max);
			donations = theQuery.list();
		}
		return donations;
	}

	// Save a new donation
	@Override
	public void saveDonation(Donation theDonation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theDonation);
	}

	// Get number of donation found
	@Override
	public long countFindDonation(String kw) {
		Session currentSession = sessionFactory.getCurrentSession();
		List<Donation> donations = new ArrayList<>();
		int status = -1;
		if(kw != null) {
			if("Mới tạo".contains(kw)) {
				status = NEW_STATUS;
			} else if ("Đang quyên góp".contains(kw)) {
				status = ACTIVE_STATUS;
			} else if ("Kết thúc".contains(kw)){
				status = END_STATUS;
			} else if ("Đóng".contains(kw)){
				status = CLOSE_STATUS;
			}
			Query<Donation> theQuery = currentSession.createQuery(
					"from Donation where"
					+ " phoneNumber like :keyword"
					+ " or organizationName like :keyword"
					+ " or code like :keyword"
					+ " or status =:status", Donation.class);
			theQuery.setParameter("keyword", kw + "%");
			theQuery.setParameter("status", status);
			donations = theQuery.list();
		} else {
			Query<Donation> theQuery = 
					currentSession.createQuery("from Donation", Donation.class);
			donations = theQuery.list();
		}
		long count = donations.size();
		return count;
	}

	// Get donation by id
	@Override
	public Donation getDonation(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Donation theDonation = currentSession.get(Donation.class, theId);
		return theDonation;
	}

	// Delete donation by id
	@Override
	public void deleteDonation(int theId) {
		Session currentSession =  sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Donation where id=:theId");
		theQuery.setParameter("theId", theId);
		theQuery.executeUpdate();
	}

	// Change status donation by id
	@Override
	public void changeStatusDonation(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Donation theDonation = currentSession.get(Donation.class, theId);
		int newStatus = theDonation.getStatus() + 1;
		theDonation.setStatus(newStatus);
		currentSession.saveOrUpdate(theDonation);	
	}

	// Update information of donation
	@Override
	public void saveUpdateDonation(Donation theDonation) {
		Session currentSession = sessionFactory.getCurrentSession();
		int idDonation = theDonation.getId();
		Donation updateDonation = currentSession.get(Donation.class, idDonation);
		updateDonation.setCode(theDonation.getCode());
		updateDonation.setName(theDonation.getName());
		updateDonation.setStartDate(theDonation.getStartDate());
		updateDonation.setEndDate(theDonation.getEndDate());
		updateDonation.setOrganizationName(theDonation.getOrganizationName());
		updateDonation.setPhoneNumber(theDonation.getPhoneNumber());
		updateDonation.setDescription(theDonation.getDescription());
		currentSession.saveOrUpdate(updateDonation);
	}

	// Count sum of money from donation
	@Override
	public int countSumDonation(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Userdonation> theQuery = 
				currentSession.createQuery("from Userdonation where donationId =:theId", Userdonation.class);
		theQuery.setParameter("theId", theId);
		List<Userdonation> theList = theQuery.list();
		int sum = 0;
		for(int i = 0; i < theList.size(); i++) {
			if(theList.get(i).getStatus() == SUCCESS_STATUS) {
				sum += theList.get(i).getMoney();
			}
		}
		return sum;
	}

	// Get list user donation by id
	@Override
	public List<Userdonation> getUserDonation(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Userdonation> theQuery =
				currentSession.createQuery("from Userdonation where donationId =:theId", Userdonation.class);
		theQuery.setParameter("theId", theId);
		List<Userdonation> theList = theQuery.list();
;		return theList;
	}

	// 
	@Override
	public void confirmDonationSuccess(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Userdonation theUserdonation = currentSession.get(Userdonation.class, theId);
		theUserdonation.setStatus(SUCCESS_STATUS);	
	}

	@Override
	public void confirmDonationFall(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Userdonation theUserdonation = currentSession.get(Userdonation.class, theId);
		theUserdonation.setStatus(FAIL_STATUS);
	}
}
