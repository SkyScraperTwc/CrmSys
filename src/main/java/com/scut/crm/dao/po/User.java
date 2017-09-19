package com.scut.crm.dao.po;

import lombok.*;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class User {
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 姓名
	 */
	private String username;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 性别
	 */
	private String sex;
	/**
	 * 手机
	 */
	private String phone;
	/**
	 * 客户列表
	 */
	private Set<Customer> customerSet;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 修改时间
	 */
	private Date editTime;

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", sex='" + sex + '\'' +
				", phone='" + phone + '\'' +
				", createTime=" + createTime +
				", editTime=" + editTime +
				'}';
	}
}