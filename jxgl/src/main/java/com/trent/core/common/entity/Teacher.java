package com.trent.core.common.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.trent.core.common.entity.base.BaseEntity;

/**
 * Teacher entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "teacher")
public class Teacher extends BaseEntity {

	// Fields
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String name;
	private String sex;
	private String positional;

	// Constructors

	/** default constructor */
	public Teacher() {
	}

	/** minimal constructor */
	public Teacher(String name, String sex) {
		this.name = name;
		this.sex = sex;
	}

	/** full constructor */
	public Teacher(String name, String sex, String positional) {
		this.name = name;
		this.sex = sex;
		this.positional = positional;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sex", nullable = false, length = 2)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "positional", length = 20)
	public String getPositional() {
		return this.positional;
	}

	public void setPositional(String positional) {
		this.positional = positional;
	}
}