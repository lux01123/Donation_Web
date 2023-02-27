package main.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import main.admin.service.DonationService;
import main.entity.Donation;
import main.entity.Userdonation;

@Controller
@RequestMapping(value = "/donation")
public class DonationController {
	
	// Number result display
	private int RESULT_PAGE = 5;
	
	private String keyClass = null;
	
	@Autowired
	private DonationService donationService;
	
	// Display, pagination and search donation
	@RequestMapping(value = "/listFind", method = {RequestMethod.POST
			,RequestMethod.GET})
	public String listPagesFind(Model theModel, @RequestParam(required = false) Map<String, String>params) {
		// Get parameters
		String kw = params.getOrDefault("kw", null);
		int page = Integer.parseInt(params.getOrDefault("page", "1"));
		// Get pages user
		if(kw != null) {
			keyClass = kw;
		}
		List <Donation> donations = donationService.getFindDonation(keyClass, page);
		//Count sum of donation
		for(int i = 0; i<donations.size(); i++) {
			int sum = donationService.countSumDonation(donations.get(i).getId());
			donations.get(i).setMoney(sum);
		}
		theModel.addAttribute("donations", donations);
		// pagination
		int max = RESULT_PAGE;
		long pages = donationService.countFindDonation(keyClass)/max + 1;
		if (donationService.countFindDonation(keyClass)%max == 0) {
			pages -= 1;
		}
		theModel.addAttribute("counter", pages);
		// number result found
		long total = donationService.countFindDonation(keyClass);
		theModel.addAttribute("total", total);
		return "admin/donation/pages-dona-find";
	}
	
	// Show form add donation
	@GetMapping(value = "/formAddDona")
	public String showFormAdd (Model theModel) {
		Donation theDonation = new Donation();
		theModel.addAttribute("donation", theDonation);
		return "admin/donation/dona-form";
	}
	
	// Save donation
	@PostMapping(value = "/saveDonation")
	public String saveDonation(@ModelAttribute("donation") Donation theDonation) {
		donationService.saveDonation(theDonation);
		return "admin/donation/add-dona-success";
	}
	
	// Change status donation
	@GetMapping(value = "/changeStatus")
	public String changeStatus(@RequestParam("donaId") int theId) {
		donationService.changeStatusDonation(theId);
		return "redirect:/donation/listFind";
	}
	
	// Delete donation
	@GetMapping("/delete")
	public String deleteDonation(@RequestParam("donaId")int theId) {
		donationService.deleteDonation(theId);
		return "redirect:/donation/listFind";
	}
	
	//Show info donation
	@GetMapping("/showInfo")
	public String showInfo(@RequestParam("donaId")int theId, Model theModel) {
		// info donation
		Donation theDonation = donationService.getDonation(theId);
		int sum = donationService.countSumDonation(theId);
		theDonation.setMoney(sum);
		theModel.addAttribute("donation", theDonation);
		// info user donation
		List<Userdonation> theList = donationService.getUserDonation(theId);
		theModel.addAttribute("theList", theList);
		return "admin/donation/dona-info";
	}
	
	//Confirm donation of user success
	@GetMapping("/confirmS")
	public String confirmSucces (@RequestParam("theId") int theId) {
		donationService.confirmDonationSuccess(theId);
		return "redirect:/donation/listFind";
	}
	
	//Confirm donation of user fail
	@GetMapping("/confirmF")
	public String confirmFail(@RequestParam("theId") int theId) {
		donationService.confirmDonationFall(theId);
		return "redirect:/donation/listFind";
	}
}


























