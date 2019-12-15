package service.impl;

import javax.inject.Inject;

import dao.IUserDAO;
import model.UserModel;
import service.IUserService;

public class UserService implements IUserService {

	@Inject
	private IUserDAO userDAO;
	
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		return userDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
	}
	
}
