package com.service;

import java.util.List;
import java.util.Map;

import com.bean.Question;
import com.bean.Test;

public interface TestService {

	int addTest(Test test);

	Test getTestById(int testId);

	void addQuestion(Question question);

	List<Test> getAllTests();

	List<Question> getQuestionsByTestId(int testId);

	Map<String, String> getCorrectAnswersByTestId(int testId);

	int calculateAndStoreScore(Map<String, String> correctAnswers, Map<String, String[]> finalAnswers);

}
