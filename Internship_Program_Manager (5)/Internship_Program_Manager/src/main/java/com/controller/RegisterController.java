package com.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Trainer;
import com.bean.User;
import com.service.TrainerService;
import com.service.UserService;

@Controller
public class RegisterController {
    @Autowired
    public UserService userRegisteration;
    

    @RequestMapping("/register")
    public String register(Model m) {
        User registerUser = new User();
        m.addAttribute("registerUser", registerUser);
        return "Register";
    }

    @PostMapping("/registerPost")
    public String registerPost(@Valid @ModelAttribute("registerUser") User registerUser,BindingResult br, Model m) {
        
        if (br.hasErrors()) {
           
            return "Register";
        }
        else {
           
                User userPost = userRegisteration.registration(registerUser.getUsername(), registerUser.getPassword(), registerUser.getEmail());
                return "redirect:/l&Dlogin";

            }

    }
}
