package org.project_manager.domain;

public class ProjectDTO {
	private int project_id;


	private String project_name;
	private String project_key;
	private String project_content;

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProject_key() {
		return project_key;
	}

	public void setProject_key(String project_key) {
		this.project_key = project_key;
	}

	public String getProject_content() {
		return project_content;
	}

	public void setProject_content(String project_content) {
		this.project_content = project_content;
	}

	@Override
	public String toString() {
		return "ProjectDTO{" +
				"project_id=" + project_id +
				", project_name='" + project_name + '\'' +
				", project_key='" + project_key + '\'' +
				", project_content='" + project_content + '\'' +
				'}';
	}
}
