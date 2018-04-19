package org.project_manager.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.project_manager.domain.ResultCode;
import org.project_manager.domain.UserDTO;
import org.project_manager.service.ProjectService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
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
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProjectController {
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	private static ObjectMapper objectMapper = new ObjectMapper();

	@Inject
	ProjectService projectService;

	@RequestMapping("")
	public String showProjectList(Model model,  HttpServletRequest request) throws JsonProcessingException {
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("loginUser");

		List<HashMap<String, Object>> projectList = projectService.getProjectList(userDTO.getUser_id());
		model.addAttribute("projectList", objectMapper.writeValueAsString(projectList));
		return "/projectlist";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createProject(){
		return "/project/project_create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public String createProject(@RequestParam("project_name") String project_name, HttpServletRequest request){
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("loginUser");

		try {
			ResultCode createProjectResult =projectService.createProject(project_name,userDTO);
			if(createProjectResult.equals(ResultCode.DUPLICATED_NAME)){
				return ResultCode.DUPLICATED_NAME.toJSON();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResultCode.SAVE_ERROR.toJSON();

		}
		return ResultCode.SUCCESS.toJSON();

	}
}
