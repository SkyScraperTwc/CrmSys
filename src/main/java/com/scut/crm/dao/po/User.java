package com.scut.crm.dao.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
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
	private List<Customer> customerList;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 修改时间
	 */
	private Date editTime;

}