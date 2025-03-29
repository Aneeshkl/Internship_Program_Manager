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
import com.bean.User;
import com.service.BatchService;
import com.service.InternService;
import com.service.TrainerService;
import com.service.UserService;

@Controller
public class TrainerController {
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
   
    @GetMapping("ListOfTrainers")
    public String listTrainers(Model model) {
        List<Trainer> trainers = trainerService.getAllTrainers();
        model.addAttribute("trainers", trainers);
        return "trainerList";
    }
    @GetMapping("/viewTrainer")
    public String viewIntern(Model model, HttpServletRequest Req) {
        int id=Integer.parseInt(Req.getParameter("trainerID"));
        Trainer trainer = trainerService.getTrainerById(id); 
        model.addAttribute("trainer", trainer);
        return "trainerDetails";
    }
        @GetMapping("/AddNewTrainerLD")
        public String showAddTrainerFormLD(Model model,HttpServletRequest request) {
            model.addAttribute("trainer", new Trainer());
            return "addTrainerL&D"; 
        }
  
        @PostMapping("/AddNewTrainerPostLD")
        public String AddNewInternPostLD(@Valid @ModelAttribute("trainer") Trainer trainer,BindingResult br){
        	 if (br.hasErrors()) {
     	       
     	        return "addTrainerL&D";
        	 }

        	trainerService.addTrainer(trainer);
            return "redirect:/ListOfTrainers"; 
        }
        @GetMapping("/editTrainer")
        public String showEditTrainerForm(@ModelAttribute("trainer") Trainer trainer,Model model,HttpServletRequest req) {
             HttpSession session = req.getSession(false);
             String ldusername =(String) session.getAttribute("L&DName");
             if(ldusername!=null) {
            Trainer trainers = trainerService.getTrainerById(trainer.getTrainerID());
            model.addAttribute("trainers", trainers);
            return "editTrainerForm";
        }else {
            return "redirect:/";            
        }
        }
       
        @PostMapping("/updateTrainer")
        public String updateTrainer(@Valid @ModelAttribute("trainers") Trainer trainers, BindingResult br,HttpServletRequest req) {
             HttpSession session = req.getSession(false);
             String ldusername =(String) session.getAttribute("L&DName");
             if(ldusername!=null) {
//            if(br.hasErrors())
//            {
//                return "editTrainerForm";
//            }
            trainerService.updateTrainer(trainers);
            return "redirect:/ListOfTrainers";
        }else {
            return "redirect:/";        }
        }


		@GetMapping("/deleteTrainer")
        public String deleteTrainer(@RequestParam ("trainerID") int trainerID,Model model) {
     
            Trainer trainer = trainerService.getTrainerById(trainerID);
        	List<Batch> objBatch1=batchService.getAllBatchByTrainerName(trainer.getTrainerName());
        	if(objBatch1==null){
        		 trainerService.deleteTrainer(trainerID);
                 internService.deleteUserByName(trainer.getTrainerName());
        	}
        	else {
        		for(Batch objBatch : objBatch1) {
        			List<Intern> listintersbybatchid = internService.getAllInternsByBatchId(objBatch.getBatchID());
        			if(listintersbybatchid.size()<=0) {
        				batchService.deleteBatchByBatchID(objBatch.getBatchID());
        			}
        			else {
        				for(Intern n : listintersbybatchid )
        				{
        					internService.deletePerformanceByInternName(n.getName());
        				}
        				internService.deleteInternByBatchName(objBatch.getBatchName());
        				batchService.deleteBatchByBatchID(objBatch.getBatchID());
        			}
        		}
	            trainerService.deleteTrainer(trainerID);
//	            internService.deleteUserByName(trainer.getTrainerName());
        	}
            return "redirect:/ListOfTrainers";
        }
        @GetMapping("goBackTrainer")
        public String goBackTrainer()
        {
        	return "WelcomeL&D";
        }
 

}
