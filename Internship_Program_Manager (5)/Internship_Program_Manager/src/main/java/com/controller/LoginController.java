package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Intern;
import com.bean.Trainer;
import com.bean.User;
import com.service.InternService;
import com.service.TrainerService;
import com.service.UserService;

@Controller
public class LoginController {
	@Autowired
	public UserService userService;
	
	@Autowired
	public InternService internService;
	
	@Autowired
	public TrainerService trainerService;
	
	@RequestMapping("/loginIntern")
	public String loginIntern(Model m) {
		Intern intern = new Intern();
		m.addAttribute("loginIntern", intern);
		return "InternLogin";
	}
	
	@PostMapping("/internLoginPost")
	public String internLoginPost(@ModelAttribute("loginIntern") Intern loginIntern, Model m,HttpServletRequest req) {
		boolean validate = internService.isValidate(loginIntern.getUserName(),loginIntern.getEmail(),loginIntern.getPassword());
		if(validate) {
			HttpSession session = req.getSession(true);
			session.setAttribute("internMail", loginIntern.getEmail());
			Intern intern = internService.getInternByInternMail(loginIntern.getEmail());
			session.setAttribute("internName",intern.getName());
			m.addAttribute("name",intern.getName());
			return "WelcomeIntern";
		}
		else {
			m.addAttribute("message","Invalid credentials, please try again.");
			return "InternLogin";
		}
	}
	
	@RequestMapping("/loginTrainer")
	public String loginTrainer(Model m) {
		Trainer trainer = new Trainer();
		m.addAttribute("loginTrainer", trainer);
		return "trainerLogin";
	}
	@PostMapping("/trainerLoginPost")
	public String trainerLoginPost(@ModelAttribute("loginTrainer") Trainer loginTrainer,Model m,HttpServletRequest req) {
		boolean validate = trainerService.isValidate(loginTrainer.getUserName(),loginTrainer.getEmail(),loginTrainer.getPassword());
		if(validate) {
			HttpSession session = req.getSession(true);
			session.setAttribute("trainerName", loginTrainer.getTrainerName());
			Trainer trainer = trainerService.getTrainerByEmail(loginTrainer.getEmail());
			m.addAttribute("name",trainer.getTrainerName());
			return "WelcomeTrainer";
		}
		else {
			m.addAttribute("message","Invalid credentials, please try again.");
			return "trainerLogin";
		}
		
	}

	 @RequestMapping("/l&Dlogin")
	    public String login(Model model, HttpServletResponse response) {
	        User loginUser = new User();
	        model.addAttribute("loginUser", loginUser);
	        return "LoginForm";
	    }

	    @PostMapping("/l&DloginPost")
	    public String loginPost(@ModelAttribute("loginUser") User loginUser, Model m,
	            HttpServletRequest req) {
	        User userPost = userService.authenticate(loginUser.getUsername(), loginUser.getPassword(),
	                loginUser.getEmail());
	        if (userPost != null) {
	            HttpSession session = req.getSession(false);
	            session.setAttribute("L&DName", loginUser.getUsername());
	            m.addAttribute("name", loginUser.getUsername());
	            return "WelcomeL&D"; 
	        } else {
	            m.addAttribute("message", "Login Failed !!!!");
	            return "LoginForm";
	        }
	    }
    @GetMapping("/logout")
    public String  logout(HttpServletRequest request) {
       
        HttpSession session = request.getSession(false);
        session.invalidate();
      
        return "Welcome";
    }
}

		
			


