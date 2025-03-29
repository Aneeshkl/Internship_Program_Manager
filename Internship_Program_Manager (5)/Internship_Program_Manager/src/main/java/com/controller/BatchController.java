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
import com.bean.Trainer;
import com.service.BatchService;
import com.service.InternService;
import com.service.TrainerService;
import com.service.UserService;

@Controller
public class BatchController {
	@Autowired
    private TrainerService trainerService;
    @Autowired
    private BatchService batchService;
    @Autowired
	public UserService userRegisteration;
    @Autowired
    private InternService internService;
    @Autowired
    private UserService userService;
	 @GetMapping("/Batch")
	 public String viewBatch(Model model) {

		 return "Batch_display";
	 }
	@GetMapping("/CreateBatch")
    public String addBatch(Model model) {
        model.addAttribute("batch", new Batch());
        List<Trainer> TrainersList = batchService.getAllTrainerWithoutBatchID();
        model.addAttribute("TrainersList",TrainersList);
        return "create_batch";
    }
	
	
	@PostMapping("/createBatchPost")
    public String addNewBatchPost(@Valid @ModelAttribute Batch batch,BindingResult br, Model model) {
		
		 if (br.hasErrors()) {
             
             return "create_batch";
          }
		batchService.addBatch(batch);
		return "redirect:/ListOfBatches";
	}
	  @GetMapping("ListOfBatches")
	    public String listBatches(Model model) {
	        List<Batch> batches = batchService.getAllBatches();
	        model.addAttribute("batches", batches);
	        return "batchList";
	  }
	
	 @GetMapping("/viewBatch")
	    public String viewBatch(Model model, HttpServletRequest Req) {
	        int id=Integer.parseInt(Req.getParameter("batchID"));
	        Batch batch = batchService.getBatchById(id); 
	        model.addAttribute("batch", batch);
	        return "batchDetails";
	        }
	 @PostMapping("/ViewBatchByName")
	    public String ViewBatchByName(Model model, HttpServletRequest Req) {
		     String name=Req.getParameter("batchName");
	        List<Intern> intern = batchService.getBatchByName(name); 
	        model.addAttribute("batch", intern);
	        return "BatchByName";
	 }
	 
	 @GetMapping("/EnterBatchByName")
	 public String EnterBatchByName(Model model)
	 {
		 List<Batch> batches = batchService.getAllBatches();
	     model.addAttribute("batches", batches);
		 return "EnterBatchByName";
	 }

	 
	 @GetMapping("/editBatch")
	    public String editBatch(@RequestParam("batchID") int batchID, Model model) {
	        Batch batch = batchService.getBatchById(batchID);
	        model.addAttribute("batch",batch);
	        return "editBatchForm"; 
	    }
	    
	    @PostMapping("/updateBatch")
	    public String updateBatch(@ModelAttribute("batch") Batch batch) {
	    	batchService.updateBatch(batch);
	        return "redirect:/ListOfBatches"; 
	    }
	    @GetMapping("/deleteBatch")
	    public String deleteBatch(@RequestParam("batchID") int batchID,Model model,RedirectAttributes redirectAttributes) {
	    	Batch batch = batchService.getBatchById(batchID);
	    	List<Intern> listintersbybatchid = internService.getAllInternsByBatchId(batch.getBatchID());
	    	if(listintersbybatchid.size()<=0) {
	    		batchService.deleteBatchByBatchID(batchID);
	    	}
	    	else {
	    		for(Intern n : listintersbybatchid )
	        	{
	        		internService.deletePerformanceByInternName(n.getName());
	        	}
	    		internService.deleteInternByBatchName(batch.getBatchName());
//	    		for(Intern n : listintersbybatchid )
//	        	{
//	        		internService.deleteUserByName(n.getName());
//	        	}
	    		batchService.deleteBatchByBatchID(batchID);
	    	}
	    	
	        return "redirect:/ListOfBatches"; 
	    
	    }
	    @GetMapping("/GoBackLD")
	    public String back(HttpSession session, Model m) {
	        String name = (String) session.getAttribute("L&DName");
	        if (name != null) {
	            m.addAttribute("name", name);
	            return "WelcomeL&D";
	        } else {
	            return "redirect:/login"; 
	        }
	    }

}