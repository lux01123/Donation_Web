package main.home.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import main.admin.service.DonationService;
import main.entity.Donation;
import main.entity.Userdonation;
import main.home.service.UserDonationService;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
	
	// Number result display
	private int RESULT_PAGE = 5;
	
	private String keyClass = null;
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;
	
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
		return "home/pages-home";
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
		List<Userdonation> theList = userDonationService.getUserDonation(theId);
		theModel.addAttribute("theList", theList);
		return "home/dona-info";
	}
}
