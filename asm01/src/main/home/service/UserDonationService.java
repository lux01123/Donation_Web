package main.home.service;

import java.util.List;

import main.entity.Userdonation;

public interface UserDonationService {
	public void saveUserDonation(Userdonation theUserdonation);
	
	public List<Userdonation> getUserDonation(int theId);
}
