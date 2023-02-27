package main.home.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.entity.Userdonation;
import main.home.dao.UserDonationDao;

@Service
public class UserDonationServiceImpl implements UserDonationService{
	
	@Autowired
	private UserDonationDao userDonationDao;

	@Override
	@Transactional
	public void saveUserDonation(Userdonation theUserdonation) {
		userDonationDao.saveUserDonation(theUserdonation);
	}

	@Override
	@Transactional
	public List<Userdonation> getUserDonation(int theId) {
		return userDonationDao.getUserDonation(theId);
	}	
}
