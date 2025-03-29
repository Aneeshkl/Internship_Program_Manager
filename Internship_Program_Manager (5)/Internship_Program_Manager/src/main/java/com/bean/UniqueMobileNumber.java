package com.bean;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UniqueMobileNumberValidator.class)
public @interface UniqueMobileNumber {

    String message() default "Mobile number already exists";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}

