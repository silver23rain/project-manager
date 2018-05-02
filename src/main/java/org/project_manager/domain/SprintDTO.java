package org.project_manager.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class SprintDTO {
	private String sprint_year;
	private Integer sprint_no;
	private Timestamp start_date;
	private Timestamp end_date;
	private String sprint_status;
	private  String sprint_goal;
	private int project_id;

	public String getSprint_goal() {
		return sprint_goal;
	}

	public void setSprint_goal(String sprint_goal) {
		this.sprint_goal = sprint_goal;
	}

	public String getSprint_year() {
		return sprint_year;
	}

	public void setSprint_year(String sprint_year) {
		this.sprint_year = sprint_year;
	}

	public Integer getSprint_no() {
		return sprint_no;
	}

	public void setSprint_no(Integer sprint_no) {
		this.sprint_no = sprint_no;
	}

	public Timestamp getStart_date() {
		return start_date;
	}

	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}

	public Timestamp getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}

	public String getSprint_status() {
		return sprint_status;
	}

	public void setSprint_status(String sprint_status) {
		this.sprint_status = sprint_status;
	}

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}

	@Override
	public String toString() {
		return "SprintDTO{" +
				"sprint_year='" + sprint_year + '\'' +
				", sprint_no=" + sprint_no +
				", start_date=" + start_date +
				", end_date=" + end_date +
				", sprint_status='" + sprint_status + '\'' +
				", sprint_goal='" + sprint_goal + '\'' +
				", project_id=" + project_id +
				'}';
	}
}
