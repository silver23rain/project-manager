package org.project_manager.domain;

public class BacklogDTO {
	private int bl_no;
	private int project_id;
	private String bl_title;
	private String bl_content;
	private  String bl_writer;
	private  String assigned_user;
	private Integer story_point;
	private Integer status_id;
	private Integer sprint_year;
	private Integer sprint_no;

	public int getBl_no() {
		return bl_no;
	}

	public void setBl_no(int bl_no) {
		this.bl_no = bl_no;
	}

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}

	public String getBl_title() {
		return bl_title;
	}

	public void setBl_title(String bl_title) {
		this.bl_title = bl_title;
	}

	public String getBl_content() {
		return bl_content;
	}

	public void setBl_content(String bl_content) {
		this.bl_content = bl_content;
	}

	public String getBl_writer() {
		return bl_writer;
	}

	public void setBl_writer(String bl_writer) {
		this.bl_writer = bl_writer;
	}

	public String getAssigned_user() {
		return assigned_user;
	}

	public void setAssigned_user(String assigned_user) {
		this.assigned_user = assigned_user;
	}

	public Integer getStory_point() {
		return story_point;
	}

	public void setStory_point(Integer story_point) {
		this.story_point = story_point;
	}

	public Integer getStatus_id() {
		return status_id;
	}

	public void setStatus_id(Integer status_id) {
		this.status_id = status_id;
	}

	public Integer getSprint_year() {
		return sprint_year;
	}

	public void setSprint_year(Integer sprint_year) {
		this.sprint_year = sprint_year;
	}

	public Integer getSprint_no() {
		return sprint_no;
	}

	public void setSprint_no(Integer sprint_no) {
		this.sprint_no = sprint_no;
	}

	@Override
	public String toString() {
		return "BacklogDTO{" +
				"bl_no=" + bl_no +
				", project_id=" + project_id +
				", bl_title='" + bl_title + '\'' +
				", bl_content='" + bl_content + '\'' +
				", bl_writer='" + bl_writer + '\'' +
				", assigned_user='" + assigned_user + '\'' +
				", story_point=" + story_point +
				", status_id=" + status_id +
				", sprint_year=" + sprint_year +
				", sprint_no=" + sprint_no +
				'}';
	}
}
