package org.project_manager.controller;

import org.project_manager.domain.ProjectDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/project/backlog")
public class BacklogController {
	@RequestMapping(value = "")
	public String backlogList(@RequestParam("project_id") Integer project_id){
		ProjectDTO projectDTO = new ProjectDTO();
		projectDTO.setProject_id(project_id);
		return "/project/backlog";
	}

}
