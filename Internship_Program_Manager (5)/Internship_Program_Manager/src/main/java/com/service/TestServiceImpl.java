package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Question;
import com.bean.Test;
import com.dao.TestDAO;

@Service("testService")
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDAO testDAO;

    @Override
    public List<Test> getAllTests() {
        List<Test> tlist = testDAO.getAllTests();
        return tlist;
    }
    
    @Override
    public int addTest(Test test) {
        return testDAO.addTest(test);
    }


    @Override
    public Test getTestById(int testId) {
        return testDAO.getTestById(testId);
    }
    
    @Override
    public void addQuestion(Question question) {
        testDAO.addQuestion(question);
    }
    
    @Override
    public List<Question> getQuestionsByTestId(int testId) {
        List<Question> lst = testDAO.getQuestionsByTestId(testId);
        return lst;
    }
    
    @Override
    public Map<String, String> getCorrectAnswersByTestId(int testId) {
        return testDAO.getCorrectAnswersByTestId(testId);
    }

	@Override
	public int calculateAndStoreScore(Map<String, String> correctAnswers, Map<String, String[]> finalAnswers) {
		return testDAO.calculateAndStoreScore(correctAnswers, finalAnswers);
	}

}