package com.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Batch;
import com.bean.Intern;
import com.bean.Performance;
import com.bean.User;
import com.service.BatchService;
import com.service.InternService;
import com.service.PerformanceService;
import com.service.UserService;

@Controller

public class InternController {
    @Autowired
    private InternService internService;
    @Autowired
    private BatchService batchService;
    @Autowired
    private PerformanceService performanceService;
    @Autowired
	public UserService userRegisteration;
    
    @GetMapping("/ListInterns")
    public String listInterns(Model model) {
        List<Intern> interns = internService.getAllInterns();
        model.addAttribute("interns", interns);
        return "internList"; 
    }
    @GetMapping("/listAllInternByBatchId")
    public String listAllInternByBatchId(Model model,@RequestParam("id") int batchID) {
        List<Intern> interns = internService.getAllInternsByBatchId(batchID);
        if(interns.isEmpty()) {
        	model.addAttribute("message","There is no Interns");
        }
        model.addAttribute("interns", interns);
        return "ListallInterns"; 
    } 
    @GetMapping("/InternHome")
    public String InternHome(@RequestParam("name") String name,Model model) {
    	model.addAttribute("name",name);
        return "WelcomeIntern"; 
    }
    @GetMapping("/view")
    public String viewIntern(Model model, HttpServletRequest Req) {
        int id=Integer.parseInt(Req.getParameter("internID"));
        Intern intern = internService.getInternById(id); 
        
        model.addAttribute("intern", intern);
        return "internDetails"; 
    }
    
    @GetMapping("/AddNewInternLD")
    public String showAddInternFormLD(Model model,HttpServletRequest request) {
    	HttpSession session =request.getSession(true);
        String val=(String) session.getAttribute("L&DName");
       
        if(val!=null) {
        	 model.addAttribute("intern", new Intern());
             int batchID=Integer.parseInt(request.getParameter("id"));
             String batchName=request.getParameter("name");
             model.addAttribute("batchID",batchID);
             model.addAttribute("batchName",batchName);
             return "addInternL&D"; 	
        }
        else {
        	return "Welcome";
        }
       
    }
    
    @PostMapping("/AddNewInternPostLD")
    public String AddNewInternPostLD(@Valid @ModelAttribute("intern") Intern intern,BindingResult br) {
    	 if (br.hasErrors()) {
 	       
 	        return "addInternL&D";
    	 }
        internService.addIntern(intern);
        
        return "redirect:/ListOfBatches"; 
    }
//   
//    @GetMapping("/edit")
//    public String editIntern(@RequestParam("internID") int internID, Model model) {
//        Intern intern = internService.getInternById(internID);
//        model.addAttribute("intern",intern);
//        return "editInternForm"; 
//    }
   
//    @PostMapping("/update")
//    public String updateIntern(@ModelAttribute("intern") Intern intern) {
//        internService.updateIntern(intern);
//        return "redirect:/ListInterns"; 
//    }
    
    @GetMapping("/editParticularIntern")
    public String editParticularIntern( @RequestParam("internID") int internID,Model model) {
        System.out.println(internID);
        Intern interns = internService.getInternById(internID);
        model.addAttribute("intern",interns);
        
        return "editAllInterns"; 
    }
   
    @PostMapping("/updateParticularIntern")
    public String updateParticularIntern(@Valid @ModelAttribute("intern") Intern intern,BindingResult br,Model model) {
        System.out.println(intern.getName());
        System.out.println("internid"+intern.getInternID());
        internService.updateIntern(intern);
        return "redirect:/listAllInternByBatchId?id="+ intern.getBatchID(); 
    }
    @GetMapping("/delete")
    public String deleteIntern(@RequestParam("internID") int internID) {
    	Intern intern = internService.getInternById(internID);
    	internService.deletePerformanceByInternName(intern.getName());
        internService.deleteIntern(internID);
        internService.deleteUserByName(intern.getName());
        return "redirect:/ListOfBatches"; 
    }
    @GetMapping("/ViewProfile")
    public String ViewProfile(Model model,HttpServletRequest req) {
    	HttpSession session =req.getSession(true);
      	String name = (String) session.getAttribute("internName");
    	Intern intern = internService.getInternByName(name); 
	    model.addAttribute("intern", intern);
          return "getInternByName"; 
    }
    @GetMapping("/ViewAllProfile")
    public String ViewAllProfile(Model model,HttpServletRequest req) {
      	String name = req.getParameter("trainerName");
      	try {
      		Batch batch = batchService.getBatchByTrainerName(name); 
  	  List<Intern> interns = internService.getAllInternsByBatchId(batch.getBatchID());
        model.addAttribute("interns", interns);
          return "trainerProfile"; 
      	}catch (Exception e){
      		System.out.println(e.getMessage());
      		 model.addAttribute("message","Intern has not been assigned for your batch");
      		 return "trainerProfile";
      	}
    }
    @GetMapping("/ViewPerformance")
    public String ViewPerformance(Model model,HttpServletRequest req) {
    	HttpSession session =req.getSession(true);
      	String email = (String) session.getAttribute("internMail");
      	String name = (String) session.getAttribute("internName");
      	List<Performance> performance = performanceService.getPerformanceByEmail(email);
      	model.addAttribute("name",name);
      	if(performance==null) 
      		 model.addAttribute("message","Intern has not taken any test");
      	else 
      		model.addAttribute("performanceList",performance);
        return "PerformanceList"; 
    }
    
    @GetMapping("goBack")
    public String goBack()
    {
    	return "WelcomeIntern";
    }
    
   

}

