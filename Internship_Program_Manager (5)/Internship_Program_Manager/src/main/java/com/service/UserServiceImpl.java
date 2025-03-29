package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.User;
import com.dao.UserDao;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao dao; 
	@Override
	public User authenticate(String username, String password,String email) {
		// TODO Auto-generated method stub
		if (null!=dao.authenticate(username, password, email)) {
			return dao.authenticate(username,password,email) ;
		} else {
			return null;
		}

	}

	public void createUser(int userID, String username, String password, String email) {
		dao.createUser(userID, username, password,email);
	}

	@Override
	public User registration(String username, String password, String email) {
		// TODO Auto-generated method stub\
		User usReg= dao.registration(username,password,email);
		if(null!= usReg)
		{
			System.out.println("You are Registered Successfully !!!");
			return usReg;
		}
		else {
			System.out.println("Please register Correct format");
			return null;
		}
		
	}

	@Override
	public void deleteUserByTrainerName(String trainerName) {
		try {
			dao.deleteUserByTrainerName(trainerName);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
