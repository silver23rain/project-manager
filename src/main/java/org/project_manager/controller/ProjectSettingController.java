package org.project_manager.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.project_manager.domain.UserDTO;
import org.project_manager.service.AuthorityService;
import org.project_manager.service.ProjectService;
import org.project_manager.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/project/setting")
public class ProjectSettingController {
	@Inject
	UserService userService;
	@Inject
	ProjectService projectService;
	@Inject
	AuthorityService authorityService;

	private static ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping("")
	public String getSetting(Model model, HttpServletRequest request, @RequestParam("project_id") Integer project_id) throws JsonProcessingException {
		UserDTO userDTO = authorityService.getUser(request);
		List<HashMap<String, Object>> projectList = projectService.getProjectList(userDTO.getUser_id());
		List<HashMap<String, Object>> userList = userService.getProjectUsers(project_id);

		model.addAttribute("userList", objectMapper.writeValueAsString(userList));
		model.addAttribute("projectList", objectMapper.writeValueAsString(projectList));
		model.addAttribute("selectedProjectId", project_id);
		return "/project/setting";
	}
}
