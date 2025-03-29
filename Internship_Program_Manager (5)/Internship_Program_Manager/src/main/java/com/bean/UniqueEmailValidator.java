package com.bean;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.TrainerDAO;


public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

    @Autowired
    private TrainerDAO trainerDAO; 
   
    @Override
    public void initialize(UniqueEmail constraintAnnotation) {
    }

    @Override
    public boolean isValid(String Email, ConstraintValidatorContext context) {
        return Email != null && !trainerDAO.isEmailExists(Email)  && Email.endsWith("@gmail.com");
    }
}
