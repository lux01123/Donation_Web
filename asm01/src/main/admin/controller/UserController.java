package main.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;

import main.admin.service.UserService;
import main.entity.User;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	// Number result display
	private int RESULT_PAGE = 5;
	
	private String keyClass = null;
	
	@Autowired
	private UserService userService;
	
	// Show form add user
	@GetMapping(value = "/formAddUser")
	public String showFormAdd (Model theModel) {
		User theUser = new User();
		theModel.addAttribute("user", theUser);	
		return "admin/user/user-form";
	}
	
	// Save user
	@PostMapping(value = "/saveUser")
	public String saveUser(@ModelAttribute("user") User theUser) {
		userService.saveUser(theUser);
		return "admin/user/add-user-success";
	}
	
	// Find user and pagination
	@RequestMapping(value = "/listFind") 
	public String listPagesFind(Model theModel, @RequestParam(required = false) Map<String, String>params) {
		// Get parameters
		String kw = params.getOrDefault("kw", null);
		int page = Integer.parseInt(params.getOrDefault("page", "1"));
		// get pages user
		if (kw != null) {
			keyClass = kw;
		}
		List <User>users = userService.getFindUser(keyClass, page);
		theModel.addAttribute("users", users);
		// pagination
		int max = RESULT_PAGE;
		long pages = userService.countFindUser(keyClass)/max + 1;
		if(userService.countFindUser(keyClass)%max == 0) {
			pages -= 1;
		}
		theModel.addAttribute("counter", pages);
		// number result
		long total = userService.countFindUser(keyClass);
		theModel.addAttribute("total", total);
		return "admin/user/pages-user-find";
	}
	
	// Update info user
	@GetMapping("/showFormForUpdate")
	public String showFormForUpate(@RequestParam("userId") int theId, Model theModel) {
		User theUser = userService.getUser(theId);
		theModel.addAttribute("user", theUser);
		return "admin/user/user-update-form";
	}
	
	// Save update user
	@PostMapping(value = "/saveUpdateUser")
	public String saveUpdateUser(@ModelAttribute("user") User theUser) {
		userService.saveUpdateUser(theUser);
		return "admin/user/add-user-success";
	}
	
	// Delete user
	@GetMapping("/delete")
	public String deleteUser(@RequestParam("userId") int theId) {
		userService.deleteUser(theId);
		return "redirect:/user/listFind";
	}
	
	// Show info user
	@GetMapping("/showInfo")
	public String showInfo(@RequestParam("userId") int theId, Model theModel) {
		User theUser = userService.getUser(theId);
		theModel.addAttribute("user", theUser);
		return "admin/user/user-info";	
	}
	
	// Change status user
	@GetMapping("/changeStatus")
	public String changeStatusUser(@RequestParam("userId") int theId) {
		userService.changeStatusUser(theId);
		return "redirect:/user/listFind";
	}

}















