package com.service;

import com.bean.User;

public interface UserService {
	public User authenticate(String username, String password,String email);

	public void createUser(int userID, String name, String password,String email);
	
	public User registration(String username, String password,String email);

	public void deleteUserByTrainerName(String trainerName);
}
