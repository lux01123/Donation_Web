package main.home.dao;

import java.util.List;

import main.entity.Userdonation;

public interface UserDonationDao {
	public void saveUserDonation(Userdonation theUserdonation);
	
	public List<Userdonation> getUserDonation(int theId);
}
