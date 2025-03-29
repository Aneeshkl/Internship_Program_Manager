package com.bean;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.TrainerDAO;

public class UniqueTrainerNameValidator implements ConstraintValidator<UniqueTrainerName, String> {

    @Autowired
    private TrainerDAO trainerDAO; 

    @Override
    public void initialize(UniqueTrainerName constraintAnnotation) {
    }

    @Override
    public boolean isValid(String trainerName, ConstraintValidatorContext context) {
        return trainerName != null && !trainerDAO.isTrainerNameExists(trainerName);
    }
}
