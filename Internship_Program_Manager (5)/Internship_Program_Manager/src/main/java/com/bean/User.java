package com.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


public class User {
  

	private int userID;
    
 
	@UniqueUserEmail
	@NotBlank(message = "Email is required")
    @Email(message = "Invalid email format")
	private String email;
	 @NotBlank(message = "User Name is required")
	 @Pattern(regexp = "^[a-zA-Z0-9\\p{Punct}]*$", message = "Username can contain numbers and special characters, but should not contain spaces.")
	 @NotBlank(message = "User name cannot be blank")
    private String username;
    
    @NotBlank(message = "The Password you have entered is Empty")
    @Size(min = 8, max = 20, message = "Password must have between 8 and 20 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*#?&])[\\w@#$!%*?&]{8,20}$", message = "Password must be at least 8 characters long, contain one lowercase letter, one uppercase letter, one digit, and one special character.")
    private String password;
   
     
    public User() 
    {
       
    }

    public User(int userID, String username, String password, String email) {
        this.userID = userID;
        this.username = username;
        this.password = password;
    
        this.email=email;
       
    }
    

    // Getters and setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}

