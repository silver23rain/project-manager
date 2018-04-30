package org.project_manager.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.project_manager.domain.BacklogDTO;
import org.project_manager.domain.ProjectDTO;
import org.project_manager.domain.UserDTO;
import org.project_manager.service.ProjectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/project/backlog")
public class BacklogController {
	@Inject
	ProjectService projectService;
	private static ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping(value = "")
	public String backlogList(Model model, HttpServletRequest request, @RequestParam("project_id") Integer project_id) throws JsonProcessingException {
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("loginUser");

		List<HashMap<String, Object>> projectList = projectService.getProjectList(userDTO.getUser_id());
		ProjectDTO projectDTO = new ProjectDTO();
		projectDTO.setProject_id(project_id);

		model.addAttribute("projectList", objectMapper.writeValueAsString(projectList));
		model.addAttribute("selectedProjectId", project_id);
		return "/project/backlog";
	}

	@RequestMapping(value = "/create" , method = RequestMethod.POST)
	@ResponseBody
	public void createBacklog (HttpServletRequest request, BacklogDTO  backlogDTO){
		//TODO
	}
}
