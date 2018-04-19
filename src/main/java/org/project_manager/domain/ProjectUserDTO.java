package org.project_manager.domain;

public class ProjectUserDTO {
	private int project_id;
	private String user_id;
	private String project_position;
	private String authority;

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProject_position() {
		return project_position;
	}

	public void setProject_position(String project_position) {
		this.project_position = project_position;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "ProjectUserDTO{" +
				"project_id=" + project_id +
				", user_id='" + user_id + '\'' +
				", project_position='" + project_position + '\'' +
				", authority='" + authority + '\'' +
				'}';
	}
}
