package com.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.advice.DuplicateQuestionException;
import com.bean.Batch;
import com.bean.Intern;
import com.bean.Question;
import com.bean.Test;
import com.bean.TestAssign;
import com.service.BatchService;
import com.service.InternService;
import com.service.TestAssignService;
import com.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private BatchService batchService;
	
	@Autowired
	private InternService internService;
	
	@Autowired
	private TestAssignService testAssignService;
	
	@GetMapping("/AddTest")
    public String showAddTestForm(Model model) {
        model.addAttribute("test", new Test());
        return "AddTest"; 
    }
	
	@PostMapping("/saveTest")
	public String addTest(@ModelAttribute("test") Test test,Model model,HttpSession session) {
	    int testID = testService.addTest(test);
	    session.setAttribute("testID", testID);
	    session.setAttribute("numOfQuestions", test.getNumOfQuestions());
	    return "redirect:/ShowQuestion";
       
	}
	
	@GetMapping("/ShowQuestion")
    public String showAddQuestionForm(ModelMap model,HttpSession session) {
        int testID = (int)session.getAttribute("testID");
        int numOfQuestions = (int)session.getAttribute("numOfQuestions");
        model.addAttribute("testId", testID);
        model.addAttribute("numOfQuestions", numOfQuestions);
        model.addAttribute("questions", new ArrayList<Question>());
        return "questions"; 
    }

    @PostMapping("/saveQuestion")
    public String addQuestion( HttpServletRequest request,Model model,HttpSession session) {
    	int testID = (int) session.getAttribute("testID");
        int numOfQuestions = Integer.parseInt(request.getParameter("numOfQuestions"));
        Set<String> questionTexts = new HashSet<>();
        List<Question> questionsToAdd = new ArrayList<>();
        for (int i = 1; i <= numOfQuestions; i++) {
            String questionText = request.getParameter("question" + i);
            Question question = new Question();
            question.setTestID(testID);
            question.setQuestion(questionText);
            question.setOption1(request.getParameter("option1" + i));
            question.setOption2(request.getParameter("option2" + i));
            question.setOption3(request.getParameter("option3" + i));
            question.setOption4(request.getParameter("option4" + i));
            question.setCorrectAnswer(request.getParameter("correctAnswer" + i));
            questionsToAdd.add(question);
        }
        try {
            for (Question question : questionsToAdd) {
                String questionText = question.getQuestion().trim();
                if (questionTexts.contains(questionText) ) {
                    throw new DuplicateQuestionException("Duplicate question found: " + questionText);
                } else {
                    questionTexts.add(questionText);
                }
            }
            for (Question question : questionsToAdd) {
                testService.addQuestion(question);
            }
            return "redirect:/Batch";
        }catch(DuplicateQuestionException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            model.addAttribute("testID",testID);
            model.addAttribute("numOfQuestions",numOfQuestions);
            model.addAttribute("questionsToAdd", questionsToAdd);
            return "questions";
        }
    }
    
    @GetMapping("/assignTest")
    public String showAssignTestForm(@RequestParam("batchID") int batchID, Model model) {
        Batch batch = batchService.getBatchById(batchID);
        List<Test> availableTests = testService.getAllTests(); // Retrieve all available tests
        model.addAttribute("batch", batch);
        model.addAttribute("availableTests", availableTests);
        return "assign-test";
    }
    
    @PostMapping("/assignTest")
    public String assignTestToBatch(@RequestParam("batchID") int batchID, @RequestParam("testIDs") List<Integer> testIDs) {
        for (Integer testID : testIDs) {
            TestAssign testAssign = new TestAssign();
            testAssign.setBatchID(batchID);
            testAssign.setTestID(testID);
            testAssignService.assignTestToBatch(testAssign);
        }
        return "redirect:/ListOfBatches";
    }
    
    @GetMapping("/assigned")
    public String getAssignedTests(@RequestParam("batchID") int batchID, Model model,HttpSession session) {
    	List<TestAssign> testassign = testAssignService.getTestAssignByBatchId(batchID);
        List<Test> tests = new ArrayList<>();
        for(TestAssign t:testassign) {
        	tests.add(testService.getTestById(t.getTestID()));
        }
        session.setAttribute("batchId", batchID);
        model.addAttribute("tests", tests);
        return "AssignedTestDetails"; 
    }
    
    @GetMapping("/viewQuestion")
    public String viewQuestion(@RequestParam("id") int testId,HttpSession session, Model model) {
        // Retrieve questions for this test by testId
        List<Question> questions = testService.getQuestionsByTestId(testId);
        int batchID = (int)session.getAttribute("batchId");
        model.addAttribute("batchId",batchID);
        model.addAttribute("testId",testId);
        model.addAttribute("questions", questions);
        return "viewQuestion";
    }
    
    @GetMapping("/Reassign")
    public String Reassign(@RequestParam("internID") int internID, Model model,HttpSession session) {
    	Intern intern = internService.getInternById(internID);
    	List<TestAssign> testassign = testAssignService.getTestAssignByBatchId(intern.getBatchID());
        List<Test> tests = new ArrayList<>();
        for(TestAssign t:testassign) {
        	tests.add(testService.getTestById(t.getTestID()));
        }
        session.setAttribute("internID", internID);
        model.addAttribute("batchId",intern.getBatchID());
        model.addAttribute("tests", tests);
        return "ReassignTest"; 
    }
}
