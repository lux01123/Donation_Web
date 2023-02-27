package main.admin.service;

import java.util.List;

import main.entity.User;

public interface UserService {

//	public List<User> getUsers();
	
//	public List<User> getPageUsers(Integer offset, Integer maxResult);
	
//	public List<User> getPagesUser(Integer page);
	
//	public long getNumberUsers();
	
	// not use
	//=======================================================
	// use
	
	public void saveUser(User theUser);
	
	public List<User> getFindUser(String kw, Integer page);
	
	public long countFindUser(String kw);
	
	public User getUser(int theId);
	
	public void deleteUser(int theId);
	
	public void changeStatusUser(int theId);
	
	public void saveUpdateUser(User theUser);
}
