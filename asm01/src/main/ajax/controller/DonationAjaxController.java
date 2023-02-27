package main.ajax.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import main.admin.service.DonationService;
import main.entity.Donation;
import main.entity.Userdonation;
import main.home.service.UserDonationService;

@RestController
@RequestMapping(value = "/ajax")
public class DonationAjaxController {
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;
	
	// Get donation
	@RequestMapping(value = "/donation/{theId}",
			method = RequestMethod.GET,
			produces = { MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Donation getDonation(@PathVariable("theId") int theId) {
		return donationService.getDonation(theId);
	}
	
	
	// Save donation
	@RequestMapping(value = "/savedonation", //
	        method = RequestMethod.POST, //
            produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }
	) 
	@ResponseBody
	public String updateEmployee(@RequestBody Donation theDonation
            ) {
		donationService.saveUpdateDonation(theDonation);
		return "admin/donation/pages-dona-find";
	}
	
	// Save user donation
	@RequestMapping(value = "/saveuserdonation",
		method = RequestMethod.POST, //
		produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }
	) 
	@ResponseBody
	public void saveUserDonation(@RequestBody Userdonation theUserdonation) {
		userDonationService.saveUserDonation(theUserdonation);
	}
}
