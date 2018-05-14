package org.project_manager.domain;

import java.sql.Timestamp;

public class FeedDTO {
	private Integer feed_no;
	private String target_user;
	private Timestamp regdate;
	private String comment;
	private Integer bl_no;
	private  Integer sprint_year;
	private Integer sprint_no;
	private int project_id;

	public Integer getFeed_no() {
		return feed_no;
	}

	public void setFeed_no(Integer feed_no) {
		this.feed_no = feed_no;
	}

	public String getTarget_user() {
		return target_user;
	}

	public void setTarget_user(String target_user) {
		this.target_user = target_user;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getBl_no() {
		return bl_no;
	}

	public void setBl_no(Integer bl_no) {
		this.bl_no = bl_no;
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

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
}
