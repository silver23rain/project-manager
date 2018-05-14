package org.project_manager.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.project_manager.domain.*;
import org.project_manager.persistence.UserDAO;
import org.project_manager.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/project/board")
public class BoardController {
	@Inject
	AuthorityService authorityService;

	@Inject
	ProjectService projectService;

	@Inject
	SprintService sprintService;

	@Inject
	BacklogService backlogService;

	@Inject
	FeedService feedService;
	private static ObjectMapper objectMapper = new ObjectMapper();

	@Inject
	private UserDAO userService;

	@RequestMapping("")
	public String showBoard(Model model, @RequestParam("project_id") Integer project_id, HttpServletRequest request) throws JsonProcessingException {
		UserDTO userDTO = authorityService.getUser(request);
		List<HashMap<String, Object>> projectList = projectService.getProjectList(userDTO.getUser_id());
		List<HashMap<String, Object>> includeSprint = backlogService.includeSprintBacklogList(project_id);
		List<HashMap<Integer, String>> backlogStatus = backlogService.getBacklogStatus();
		HashMap<String, Object> sprintData = sprintService.getOpenedSprintData(project_id);
		List<ProjectUserDTO> userList = userService.getProjectUsers(project_id);

		model.addAttribute("projectList", objectMapper.writeValueAsString(projectList));
		model.addAttribute("selectedProjectId", project_id);

		if(sprintData == null) {
			model.addAttribute("blockCase", "NONE_OPENED_SPRINT");
			return "/project/block";
		}
		model.addAttribute("userList", objectMapper.writeValueAsString(userList));
		model.addAttribute("includeSprint", objectMapper.writeValueAsString(includeSprint));
		model.addAttribute("getBacklogStatus", objectMapper.writeValueAsString(backlogStatus));
		model.addAttribute("sprintData", objectMapper.writeValueAsString(sprintData));
		return "/project/board";
	}

	@RequestMapping("/insertFeed")
	@ResponseBody
	public String insertFeed(FeedDTO feedDTO) {
		try {
			feedService.insertFeed(feedDTO);
		} catch(Exception e) {
			e.printStackTrace();
			return ResultCode.INSERT_ERROR.toJSON();
		}
		return ResultCode.SUCCESS.toJSON();
	}

}
