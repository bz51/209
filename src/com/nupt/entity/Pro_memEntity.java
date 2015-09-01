package com.nupt.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pro_mem")
public class Pro_memEntity {
	private long id;
	private long pro_id;
	private long mem_id;
	private String module;
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getPro_id() {
		return pro_id;
	}
	public void setPro_id(long pro_id) {
		this.pro_id = pro_id;
	}
	public long getMem_id() {
		return mem_id;
	}
	public void setMem_id(long mem_id) {
		this.mem_id = mem_id;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	
	
}
