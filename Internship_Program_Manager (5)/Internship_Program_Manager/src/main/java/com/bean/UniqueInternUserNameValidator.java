package com.bean;



import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.InternDAO;

public class UniqueInternUserNameValidator implements ConstraintValidator<UniqueInternUserName, String> {

    @Autowired
    private InternDAO internDAO; 

    @Override
    public void initialize(UniqueInternUserName constraintAnnotation) {
    }

    @Override
    public boolean isValid(String userName, ConstraintValidatorContext context) {
    	
        return userName != null && !internDAO.isInternUserNameExists(userName);
    }
}
