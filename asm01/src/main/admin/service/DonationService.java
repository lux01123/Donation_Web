package main.admin.service;

import java.util.List;

import main.entity.Donation;
import main.entity.Userdonation;

public interface DonationService {
	
	public List<Donation> getFindDonation(String kw, Integer page);
	
	public void saveDonation(Donation theDonation);
	
	public long countFindDonation(String kw);
	
	public Donation getDonation(int theId);
	
	public void deleteDonation(int theId);
	
	public void changeStatusDonation(int theId);
	
	public void saveUpdateDonation(Donation theDonation);
	
	public int countSumDonation(int theId);
	
	public List<Userdonation> getUserDonation(int theId);
	
	public void confirmDonationSuccess(int theId);
	
	public void confirmDonationFall(int theId);
}

