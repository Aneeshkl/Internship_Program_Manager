package com.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Trainer {
    private int trainerID;
//   @NotNull(message="Name is required")
//   @Pattern(regexp = "^[a-zA-Z\\s.]+$", message = "Please Enter valid Name (You cannot use numbers.)")
//   @NotBlank(message="Name is required")
   
   
   
    @NotBlank(message = "User Name is required")
    @Pattern(regexp = "^[a-zA-Z0-9\\p{Punct}]*$", message = "Username can contain numbers and special characters, but should not contain spaces.")
    @NotBlank(message = "User name cannot be blank")
    @UniqueUserName(message = "User name already Exits !!!")
    private String userName;
   
    private String trainerName;
    
    
    @UniqueEmail
	@NotBlank(message = "Email is required")
    @Email(message = "Invalid email format")
    private String Email;
    
    @NotBlank(message = "The Password you have entered is Empty")
    @Size(min = 8, max = 20, message = "Password must have between 8 and 20 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*#?&])[\\w@#$!%*?&]{8,20}$", message = "Password must be at least 8 characters long, contain one lowercase letter, one uppercase letter, one digit, and one special character.")
    private String password;
    private String courseEnrolled;
    private int batchID;
    private String batchName;
    public int getBatchID() {
		return batchID;
	}
	public void setBatchID(int batchID) {
		this.batchID = batchID;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBatchName() {
		return batchName;
	}
	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}
	public Trainer() {
        
    }
    public Trainer(int trainerID, String trainerName,String Email,String password,String courseEnrolled, int batchID, String batchName,String userName) {
		super();
		this.userName=userName;
		this.trainerID = trainerID;
		this.Email=Email;
		this.password=password;
		this.trainerName = trainerName;
		this.courseEnrolled = courseEnrolled;
		this.batchID = batchID;
		this.batchName = batchName;
	}
	public Trainer(int trainerID, String trainerName,String Email,String password) {
        super();
        this.userName=userName;
        this.trainerID = trainerID;
        this.trainerName = trainerName;
        this.Email = Email;
        this.password=password;
        
    }
    public int getTrainerID() {
        return trainerID;
    }
    public void setTrainerID(int trainerID) {
        this.trainerID = trainerID;
    }
    
  
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		this.Email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCourseEnrolled() {
		return courseEnrolled;
	}
	public void setCourseEnrolled(String courseEnrolled) {
		this.courseEnrolled = courseEnrolled;
	}
	public String getTrainerName() {
        return trainerName;
    }
    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }
    

}
