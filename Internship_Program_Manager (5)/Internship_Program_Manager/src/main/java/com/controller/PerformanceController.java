package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.InputStream;
import java.io.FileInputStream;
import java.io.OutputStream;
import org.apache.commons.io.IOUtils;

import com.bean.Intern;
import com.bean.Performance;
import com.bean.Question;
import com.bean.Test;
import com.bean.TestAssign;
import com.service.InternService;
import com.service.PerformanceService;
import com.service.TestAssignService;
import com.service.TestService;
@Controller
public class PerformanceController {

	@Autowired
	private InternService internService;
	
	@Autowired
	private TestAssignService testAssignService;
	
	@Autowired
	private PerformanceService performanceService;
	
	@Autowired
	private TestService testService;
	
    @GetMapping("/showGoogleForm")
    public String showGoogleForm(Model model) {
    	String googleFormUrl="https://forms.gle/FwiEKfYnnXRSSnh66";
        model.addAttribute("googleFormUrl", googleFormUrl);
        return "googleForm";
    }
    
    @GetMapping("/AttendTest")
    public String AttendTest(HttpServletRequest req,Model model)
    {
    	HttpSession session =req.getSession(true);
      	String Email = (String)session.getAttribute("internMail");
      	Intern intern = internService.getInternByInternMail(Email);
      	List<TestAssign> testAssign = testAssignService.getTestAssignByBatchId(intern.getBatchID());
      	List<Test> test = new ArrayList<>(); 
      	for(TestAssign t : testAssign) {
      		Test testcheck = testService.getTestById(t.getTestID());
      		if(!performanceService.scoreexist(Email,testcheck.getTag())) {
      			test.add(testcheck);
      		}
      	}
      	session.setAttribute("name", intern.getName());
      	model.addAttribute("test",test);
      	return "TestList";
    }
    
    @GetMapping("/takeTest")
    public String takeTest(@RequestParam("id") int testId,HttpSession session, Model model) {
        Test test = testService.getTestById(testId);
        List<Question> questions = testService.getQuestionsByTestId(testId); 
        session.setAttribute("testId", testId);
        model.addAttribute("questions", questions);
        model.addAttribute("tag",test.getTag());
        return "AttendTest"; 
    }
    
    @RequestMapping(value = "/submitTest", method = RequestMethod.POST)
    public String submitTest(@RequestParam Map<String, String> scalarParams,
                             @RequestParam MultiValueMap<String, String> multiParams,HttpSession session,Model model) {
    	int testId = (int)session.getAttribute("testId");
    	String email = (String)session.getAttribute("internMail");
    	Test test = testService.getTestById(testId);
    	Intern intern = internService.getInternByInternMail(email);
        Map<String, String> correctAnswers = testService.getCorrectAnswersByTestId(testId);

        Map<String, String[]> finalAnswers = new HashMap<>(scalarParams.size());
        for (Map.Entry<String, String> entry : scalarParams.entrySet()) {
            finalAnswers.put(entry.getKey(), new String[]{entry.getValue()});
        }

        for (Map.Entry<String, List<String>> entry : multiParams.entrySet()) {
            finalAnswers.put(entry.getKey(), entry.getValue().toArray(new String[0]));
        }
        
        int score = testService.calculateAndStoreScore(correctAnswers, finalAnswers);
        String sc = score+"/"+test.getNumOfQuestions();
        String rank = null;
        double percentage = (score * 100.0 / test.getNumOfQuestions());
        if(percentage >= 50.0)
        	rank = "Pass";
        else
        	rank = "Fail";
        
        performanceService.savePerformance(sc,rank,intern.getName(),intern.getEmail(),test.getTag());
        model.addAttribute("score",sc);
        model.addAttribute("rank",rank);
        model.addAttribute("name",intern.getName());
        return "Success";
    }

    @GetMapping("/ReassignTest")
    public String ReassignTest(@RequestParam("id") int testId,HttpSession session, Model model) {
    	int internID = (int)session.getAttribute("internID");
    	Intern intern = internService.getInternById(internID);
    	Test test = testService.getTestById(testId);
    	performanceService.deletePerformancebytestid(intern.getEmail(),test.getTag());
    	return "redirect:/Reassign?internID=" + internID;
    }
    
    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public void downloadPdf(@RequestParam("id") int testId, HttpServletResponse response) {
        // Fetch performance data
    	Test test = testService.getTestById(testId);
        List<Performance> performances = performanceService.getPerformanceByTag(test.getTag());

        // Generate PDF
        String pdfFilePath = "C:/Users/user/Downloads/report.pdf";
        performanceService.generatePdf(performances, pdfFilePath);

        // Set the response headers
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=report.pdf");

        // Copy the generated PDF to the response output stream
        try (InputStream inputStream = new FileInputStream(pdfFilePath);
             OutputStream outputStream = response.getOutputStream()) {
            IOUtils.copy(inputStream, outputStream);
            outputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
}
