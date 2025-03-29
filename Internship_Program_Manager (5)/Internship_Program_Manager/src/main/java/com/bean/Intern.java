package com.bean;

import java.time.LocalDate;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

public class Intern {
    private int internID;
    
    private String name;
    
    
    @NotBlank(message = "User Name is required")
    @Pattern(regexp = "^[a-zA-Z0-9\\p{Punct}]*$", message = "Username can contain numbers and special characters, but should not contain spaces.")
    @NotBlank(message = "User name cannot be blank")
    @UniqueInternUserName(message = "User name already Exits !!!")
    private String userName;
    
    
    @UniqueInternEmail
	@NotBlank(message = "Email is required")
    @Email(message = "Invalid email format")
    private String email;
    @NotNull(message="User College is required")
    @Pattern(regexp = "^[a-zA-Z\\s.]+$", message = "Please Enter valid CollegeName (You cannot use numbers.)")
    @NotBlank(message="College Name is required")
    private String college;
    
    @NotNull(message="User course is required")
    @Pattern(regexp = "^[a-zA-Z\\s.]+$", message = "Please Enter valid course (You cannot use numbers.)")
    @NotBlank(message="User course is required")
    private String course;
    
    
    @NotNull(message = "Date of birth cannot be null")
    @Past(message = "Date of birth must be in the past")
    private LocalDate dob;
    
    
    private String gender;
    private String address;
    
    @UniqueMobileNumber
    @Pattern(regexp = "^[0-9]{10}$", message = "Phone number must be 10 digits")

    private String phoneNumber;
    
    private String shortDescription;
    
    private int batchID;
    private String batchName;
    
    @NotBlank(message = "The Password you have entered is Empty")
    @Size(min = 8, max = 20, message = "Password must have between 8 and 20 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*#?&])[\\w@#$!%*?&]{8,20}$", message = "Password must be at least 8 characters long, contain one lowercase letter, one uppercase letter, one digit, and one special character.")
    private String password;
    
    private String internDuration;
    public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getBatchID() {
		return batchID;
	}

	public void setBatchID(int batchID) {
		this.batchID = batchID;
	}

	public Intern() {
        // Default constructor
    }

    public Intern(int internID, String name, String college, String course, LocalDate dob,
                  String gender, String address, String phoneNumber, String shortDescription,
                  String internDurtion,String batchName,int batchID,String userName) {
        this.internID = internID;
        this.name = name;
        this.college = college;
        this.course = course;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.shortDescription = shortDescription;
        this.internDuration=internDuration;
        this.batchID=batchID;
        this.batchName=batchName;
        this.userName=userName;
    }

    // Getters and setters

    

    public String getName() {
        return name;
    }

    public int getInternID() {
        return internID;
    }
    

    public void setInternID(int internID) {
        this.internID = internID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getInternDuration() {
        return internDuration;
    }

    public void setInternDuration(String internDuration) {
        this.internDuration = internDuration;
    }

	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

   

   
}

