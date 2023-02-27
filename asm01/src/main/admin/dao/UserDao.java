package main.admin.dao;

import java.util.List;

import main.entity.User;

public interface UserDao {
	
//	public List<User> getUsers();
	
//	public long getNumberUsers();
	
//	public List<User> getPageUsers(Integer offset, Integer maxResult);
	
//	public List<User> getPagesUser(Integer page);
	
	// not use
	//====================================================================
	// use
	
	public void saveUser(User theUser);
	
	public List<User> getFindUser(String kw, Integer page);
	
	public long countFindUser(String kw);
	
	public User getUser(int theId);
	
	public void deleteUser(int theId);
	
	public void changeStatusUser(int theId);
	
	public void saveUpdateUser(User theUser);
	
}
