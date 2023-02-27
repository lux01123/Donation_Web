package main.admin.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.admin.dao.UserDao;
import main.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	@Transactional
	public void saveUser(User theUser) {
		userDao.saveUser(theUser);
	}

	@Override
	@Transactional
	public List<User> getFindUser(String kw, Integer page) {
		return userDao.getFindUser(kw, page);
	}

	@Override
	@Transactional
	public long countFindUser(String kw) {
		return userDao.countFindUser(kw);
	}

	@Override
	@Transactional
	public User getUser(int theId) {
		return userDao.getUser(theId);
	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		userDao.deleteUser(theId);
	}

	@Override
	@Transactional
	public void changeStatusUser(int theId) {
		userDao.changeStatusUser(theId);
	}

	@Override
	@Transactional
	public void saveUpdateUser(User theUser) {
		userDao.saveUpdateUser(theUser);		
	}

}
