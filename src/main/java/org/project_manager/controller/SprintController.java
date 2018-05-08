package org.project_manager.controller;

import org.project_manager.domain.BacklogDTO;
import org.project_manager.domain.ResultCode;
import org.project_manager.domain.SprintDTO;
import org.project_manager.service.BacklogService;
import org.project_manager.service.SprintService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;

@Controller
@RequestMapping(value = "/project/sprint")
public class SprintController {
	@Inject
	SprintService sprintService;

	@Inject
	BacklogService backlogService;


	@RequestMapping(value = "/info")
	@ResponseBody
	public ResponseEntity<HashMap<String,Object>> getSprintName (@RequestParam("project_id") Integer project_id){
		return new ResponseEntity<>(sprintService.getNewSprintTitle(project_id), HttpStatus.OK);
	}

	@RequestMapping(value = "/create")
	@ResponseBody
	public String createSprint(SprintDTO sprintDTO){
		try {
			sprintService.createSprint(sprintDTO);
		} catch(Exception e) {
			e.printStackTrace();
			return ResultCode.INSERT_ERROR.toJSON();
		}
		return  ResultCode.SUCCESS.toJSON();
	}

	@RequestMapping(value= "/update")
	@ResponseBody
	public void updateSprint(SprintDTO sprintDTO){

		sprintService.openSprint(sprintDTO);

		BacklogDTO backlogDTO = new BacklogDTO();
		backlogDTO.setProject_id(sprintDTO.getProject_id());
		backlogDTO.setSprint_year(sprintDTO.getSprint_year());
		backlogDTO.setSprint_no(sprintDTO.getSprint_no());
		backlogService.updateStatus(backlogDTO);
	}
}
