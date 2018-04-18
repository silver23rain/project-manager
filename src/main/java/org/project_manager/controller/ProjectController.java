package org.project_manager.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/project")
public class ProjectController {
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("")
	public String showProjectList(Model model) {
		LOGGER.info("ProjectController....");
		return "/projectlist";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createProject(){
		return "/project/create";
	}
}
