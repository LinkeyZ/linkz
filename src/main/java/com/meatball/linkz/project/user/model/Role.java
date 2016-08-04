package com.meatball.linkz.project.user.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name="sys_role")
public class Role implements Serializable {
	
	private static final long serialVersionUID = -5722804987837829393L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="role_id")
	private String roleId;
	
	private String name;
	
	@ManyToMany(fetch=FetchType.EAGER,cascade = CascadeType.PERSIST)
	@JoinTable(name="sys_user_role",joinColumns={@JoinColumn(name = "user_id")},inverseJoinColumns={@JoinColumn(name = "role_id")})
	private Set<User> UserSet = new HashSet<User>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<User> getUserSet() {
		return UserSet;
	}

	public void setUserSet(Set<User> userSet) {
		UserSet = userSet;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	

}
