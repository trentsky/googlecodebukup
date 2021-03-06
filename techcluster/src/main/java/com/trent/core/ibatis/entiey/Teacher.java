package com.trent.core.ibatis.entiey;

import com.trent.core.common.entity.base.BaseEntity;

public class Teacher extends BaseEntity {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private String sex;
	private String positional;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPositional() {
		return positional;
	}

	public void setPositional(String positional) {
		this.positional = positional;
	}

}