package main.admin.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.admin.dao.DonationDao;
import main.entity.Donation;
import main.entity.Userdonation;

@Service
public class DonationServiceImpl implements DonationService {
	
	@Autowired
	private DonationDao donationDao;

	@Override
	@Transactional
	public List<Donation> getFindDonation(String kw, Integer page) {
		return donationDao.getFindDonation(kw, page);
	}

	@Override
	@Transactional
	public void saveDonation(Donation theDonation) {
		donationDao.saveDonation(theDonation);
	}

	@Override
	@Transactional
	public long countFindDonation(String kw) {	
		return donationDao.countFindDonation(kw);
	}

	@Override
	@Transactional
	public Donation getDonation(int theId) {
		return donationDao.getDonation(theId);
	}

	@Override
	@Transactional
	public void deleteDonation(int theId) {
		donationDao.deleteDonation(theId);
	}

	@Override
	@Transactional
	public void changeStatusDonation(int theId) {
		donationDao.changeStatusDonation(theId);	
	}

	@Override
	@Transactional
	public void saveUpdateDonation(Donation theDonation) {
		donationDao.saveUpdateDonation(theDonation);
	}

	@Override
	@Transactional
	public int countSumDonation(int theId) {
		return donationDao.countSumDonation(theId);
	}

	@Override
	@Transactional
	public List<Userdonation> getUserDonation(int theId) {
		return donationDao.getUserDonation(theId);
	}

	@Override
	@Transactional
	public void confirmDonationSuccess(int theId) {
		donationDao.confirmDonationSuccess(theId);
	}

	@Override
	@Transactional
	public void confirmDonationFall(int theId) {
		donationDao.confirmDonationFall(theId);
	}
}
