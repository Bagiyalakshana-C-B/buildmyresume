package com.bootrebu.resumebuilder.Controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bootrebu.resumebuilder.Model.Resume;
import com.bootrebu.resumebuilder.Model.User;
import com.bootrebu.resumebuilder.Repository.ResumeRepo;
import com.bootrebu.resumebuilder.Repository.UserRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResumeBuilderController {
	@Autowired
	UserRepo userrepo;
	@Autowired
	ResumeRepo resumerepo;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/login")
	public String login(@RequestParam(required=false) String action,@RequestParam(required=false) String msg,Model model) {
		if(!"signup".equalsIgnoreCase(action)) {
			action = "login";
		}
		model.addAttribute("action",action);
		model.addAttribute("msg",msg);
		return "login";
	}
	
	@PostMapping("/login")
	public String loginlogic(@RequestParam String email,@RequestParam String password,Model model,HttpSession session) {
		User user = userrepo.findByEmail(email);
		if(user!=null && user.getPassword().equals(password)) {
			 session.setAttribute("loggedInUser", user);
	         session.setAttribute("userRole", user.getRole()); 
			
			return "redirect:/resumebuilder";
		}
		else {
			return "redirect:/login?action=login&&msg=Invalid Email or Password";
		}
	}
	
	@PostMapping("/signup")
	public String signuplogic(@RequestParam String email,@RequestParam String password,@RequestParam String role,Model model) {
		if(userrepo.findByEmail(email)!=null) {
			return "redirect:/login?action=login&&msg=The Email Already Exist";
		}
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setRole(role);
		
		userrepo.save(user);
		
		return "redirect:/login?action=login&&msg= Signed Up Successfully!! . Please Login";
	}
	
	@GetMapping("/resumebuilder")
	public String resumebuilderPage(@RequestParam(required = false) String msg, Model model) {
	    model.addAttribute("msg", msg);
	    return "resumebuilder";
	}

	
	@GetMapping("/resume/preview")
	public String previewResume(HttpSession session, Model model) {
	    User user = (User) session.getAttribute("loggedInUser");
	    if (user != null) {
	        Resume resume = resumerepo.findByUserId(user.getId());
	        if (resume != null) {
	            model.addAttribute("resume", resume);
	            return "preview";
	        }
	    }
	    return "redirect:/resumebuilder";
	}
	
	@PostMapping("/resume/preview")
	public String handleResumeSubmission(@ModelAttribute Resume resume,
	                                     HttpSession session, Model model) {
	    User user = (User) session.getAttribute("loggedInUser");
	    if (user == null) return "redirect:/login";

	    resume.setUser(user); // link resume with user
	    resumerepo.save(resume); // JPA will handle saving the list fields
	    model.addAttribute("resume", resume);
	    return "preview";
	}





	
	@GetMapping("/resume/viewSaved")
	public String previewSavedResume(HttpSession session, Model model) {
	    User user = (User) session.getAttribute("loggedInUser");
	    if (user == null) {
	        return "redirect:/login?action=login&msg=Please login first";
	    }

	    Resume resume = resumerepo.findByUserId(user.getId());
	    if (resume == null) {
	        return "redirect:/resumebuilder?msg=No saved resume found";
	    }

	    model.addAttribute("resume", resume);
	    return "preview";
	}
	
	
	
}
