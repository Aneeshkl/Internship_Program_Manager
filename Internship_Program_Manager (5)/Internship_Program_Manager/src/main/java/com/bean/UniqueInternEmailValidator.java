package com.bean;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.InternDAO;
import com.dao.UserDao;

public class UniqueInternEmailValidator implements ConstraintValidator<UniqueInternEmail, String> {

    @Autowired
    private InternDAO internDAO;

    @Override
    public void initialize(UniqueInternEmail constraintAnnotation) {
    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        return email != null && !internDAO.isEmailExists(email) && email.endsWith("@gmail.com");
    }
}

