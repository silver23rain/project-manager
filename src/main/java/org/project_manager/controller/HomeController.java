package org.project_manager.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.project_manager.domain.UserDTO;
import org.project_manager.service.AuthorityService;
import org.project_manager.service.BacklogService;
import org.project_manager.service.FeedService;
import org.project_manager.service.ProjectService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("")
public class HomeController {
	@Inject
	ProjectService projectService;
	@Inject
	AuthorityService authorityService;
	@Inject
	BacklogService backlogService;
	@Inject
	FeedService feedService;

	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	private static ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping("")
	public String home(Model model, HttpServletRequest request) throws JsonProcessingException {
		LOGGER.info("");
		UserDTO userDTO = authorityService.getUser(request);
		List<HashMap<String, Object>> backlogList = backlogService.getBackLogList(userDTO.getUser_id(),null);
		List<HashMap<String, Object>> feedList = feedService.getFeedList(userDTO.getUser_id());
		model.addAttribute("backLogList", objectMapper.writeValueAsString(backlogList));
		model.addAttribute("feedList", objectMapper.writeValueAsString(feedList));
		return "/dashboard";
	}

	@RequestMapping("/block")
	public String goBlock(Model model, HttpServletRequest request, @RequestParam("project_id") Integer project_id ,
	                      @RequestParam("block_case") String blockCase) throws JsonProcessingException {
		UserDTO userDTO = authorityService.getUser(request);
		List<HashMap<String, Object>> projectList = projectService.getProjectList(userDTO.getUser_id());
		model.addAttribute("projectList", objectMapper.writeValueAsString(projectList));
		model.addAttribute("selectedProjectId", project_id);
		model.addAttribute("blockCase" , blockCase);
		return "/project/block";
	}

}