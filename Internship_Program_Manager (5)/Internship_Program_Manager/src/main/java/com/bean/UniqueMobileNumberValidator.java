package com.bean;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.InternDAO;

public class UniqueMobileNumberValidator implements ConstraintValidator<UniqueMobileNumber, String> {

    @Autowired
    private InternDAO internDao; 

    @Override
    public void initialize(UniqueMobileNumber constraintAnnotation) {
    }

    @Override
    public boolean isValid(String phoneNumber, ConstraintValidatorContext context) {
        return phoneNumber != null && !internDao.isMobileNumberExists(phoneNumber);
    }
}
