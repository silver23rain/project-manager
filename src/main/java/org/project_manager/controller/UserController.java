package org.project_manager.controller;

import org.project_manager.domain.UserDTO;
import org.project_manager.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	UserService userService;

	@RequestMapping(value = "/login" , method = RequestMethod.GET)
	public String  login(){
		return "/user/login";
	}

	@RequestMapping(value = "/signin" , method = RequestMethod.POST)
	public String signIn(UserDTO dto, HttpServletRequest request, Model model){
		UserDTO userDTO = userService.checkUser(dto);
		HttpSession session = request.getSession();
		if(userDTO == null){
			session.setAttribute("error","fail");
			return "redirect:/user/login";
		}

		session.setAttribute("loginUser", userDTO);

		Object dest = session.getAttribute("dest");
		session.removeAttribute("error");
		model.addAttribute("user", userDTO);

		return dest!= null ? "redirect:"+(String)dest : "redirect:/";
	}

	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout (HttpServletRequest request){
		HttpSession session = request.getSession();
		Object loginUser = request.getSession().getAttribute("loginUser");

		if(loginUser != null){
			session.removeAttribute("loginUser");
			session.invalidate();
		}

		return "redirect:/";
	}

	@RequestMapping("/search")
	@ResponseBody
	public ResponseEntity<List<UserDTO>> searchUser(@RequestParam("project_id") Integer project_id,
	                                                @RequestParam("searchData") String searchData){

		HashMap<String,Object> searchMap = new HashMap<>();
		searchMap.put("searchData", searchData);
		searchMap.put("project_id",project_id);

		List<UserDTO> searchResult = userService.searchUser(searchMap);

		return new ResponseEntity<>(searchResult, HttpStatus.OK);
	}
}
