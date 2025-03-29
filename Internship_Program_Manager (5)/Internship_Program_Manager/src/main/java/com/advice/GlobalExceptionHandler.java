package com.advice;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

public class GlobalExceptionHandler {
	 @ExceptionHandler(IncompleteTestException.class)
	    public ModelAndView handleIncompleteTestException(IncompleteTestException ex ,Model model) {
	        ModelAndView modelAndView = new ModelAndView("error");
	        modelAndView.addObject("errorMessage", ex.getMessage());
	        return modelAndView;
	    }
	 
	 @ExceptionHandler(DuplicateQuestionException.class)
	    public ModelAndView handleDuplicateQuestionException(DuplicateQuestionException ex,Model model) {
	        ModelAndView modelAndView = new ModelAndView("error");
	        modelAndView.addObject("errorMessage", ex.getMessage());
	        return modelAndView;
	    }
}
