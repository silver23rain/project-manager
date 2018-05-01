package org.project_manager.domain;

public enum ResultCode {
	SUCCESS,
	SAVE_ERROR,
	DUPLICATED_NAME,
	INSERT_ERROR;

	public String toJSON(){
		return String.format("{\"code\" : \"%s\"}" , this.toString());
	}
}
