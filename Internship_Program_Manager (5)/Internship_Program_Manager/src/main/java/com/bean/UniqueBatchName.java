package com.bean;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UniqueBatchNameValidator.class)
public @interface UniqueBatchName {

    String message() default "BatchName Name already exists";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
