package org.project_manager.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("")
public class HomeController {
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping("")
	public String home(Model model) {
		LOGGER.info(" info.. HomeController");
		model.addAttribute("greeting", "hello world");
		return "/dashboard";
	}

}