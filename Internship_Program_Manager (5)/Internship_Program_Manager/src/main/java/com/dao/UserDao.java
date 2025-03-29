package com.dao;

import com.bean.User;
public interface UserDao {

	public User authenticate(String username, String password,String email);
	
	public User registration(String username, String password,String email);

	public void createUser(int userID, String username, String password,String email);

		public void deleteUserByTrainerName(String trainerName);

		public boolean isEmailExists(String email);

		void deleteUserByInternName(String internName);

	
	    
	




}
