package com.bean;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.BatchDAO;

public class UniqueBatchNameValidator implements ConstraintValidator<UniqueBatchName, String> {

    @Autowired
    private BatchDAO batchDAO; 

    @Override
    public void initialize(UniqueBatchName constraintAnnotation) {
    }

    @Override
    public boolean isValid(String batchName, ConstraintValidatorContext context) {
        return batchName != null && !batchDAO.isBatchNameExists(batchName);
    }
}
