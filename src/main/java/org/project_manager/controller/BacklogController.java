package org.project_manager.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.project_manager.domain.BacklogDTO;
import org.project_manager.domain.ProjectUserDTO;
import org.project_manager.domain.ResultCode;
import org.project_manager.domain.UserDTO;
import org.project_manager.service.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.awt.ModalExclude;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/project/backlog")
public class BacklogController {
	@Inject
	ProjectService projectService;
	@Inject
	AuthorityService authorityService;
	@Inject
	BacklogService backlogService;
	@Inject
	SprintService sprintService;

	@Inject
	UserService userService;

	private static ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping(value = "")
	public String backlogList(Model model, HttpServletRequest request, @RequestParam("project_id") Integer project_id) throws JsonProcessingException {
		UserDTO userDTO = authorityService.getUser(request);

		List<HashMap<String, Object>> projectList = projectService.getProjectList(userDTO.getUser_id());
		List<HashMap<String, Object>> backlogList = backlogService.getBackLogList(userDTO.getUser_id(), project_id);
		List<HashMap<String, Object>> sprintList = sprintService.getSrintNameList(project_id);

		model.addAttribute("projectList", objectMapper.writeValueAsString(projectList));
		model.addAttribute("backLogList", objectMapper.writeValueAsString(backlogList));
		model.addAttribute("sprintNameList" , objectMapper.writeValueAsString(sprintList));

		model.addAttribute("selectedProjectId", project_id);

		return "/project/backlog";
	}

	@RequestMapping(value = "/create" , method = RequestMethod.POST)
	@ResponseBody
	public String createBacklog (HttpServletRequest request, BacklogDTO  backlogDTO){
		UserDTO userDTO = authorityService.getUser(request);
		backlogDTO.setBl_writer(userDTO.getUser_id());
		try {
			backlogService.createBacklog(backlogDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultCode.INSERT_ERROR.toJSON();

		}
		return ResultCode.SUCCESS.toJSON();
	}

	@RequestMapping(value = "/updateBacklog", method = RequestMethod.POST)
	@ResponseBody
	public String includeSprint (BacklogDTO backlogDTO){
		try {
			backlogService.updateBacklog(backlogDTO);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultCode.UPDATE_ERROR.toJSON();
		}
		return ResultCode.SUCCESS.toJSON();
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<HashMap<String,Object>> getBacklogDetail
			(@RequestParam("bl_no") Integer bl_no,
			 @RequestParam("project_id") Integer project_id){

		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("userList",  userService.getProjectUsers(project_id));
		hashMap.put("backlogData", backlogService.getBacklogDetail(project_id,bl_no));

		return new ResponseEntity<>(hashMap, HttpStatus.OK);
	}
}
