package org.project_manager.domain;

public class UserDTO {
	private  String user_id;
	private  String user_name;
	private  String user_password;
	private String user_img;


	public UserDTO() {
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	@Override
	public String toString() {
		return "UserDTO{" +
				"user_id='" + user_id + '\'' +
				", user_name='" + user_name + '\'' +
				", user_password='" + user_password + '\'' +
				'}';
	}
}
