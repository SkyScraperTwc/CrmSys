package com.scut.crm.entity;

import lombok.*;

import java.util.Date;
import java.util.Set;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 编号
	 */
	private String serialNumber;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 邮政编码
	 */
	private String zipcode;
	/**
	 * 手机号码
	 */
	private String phone;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 客户级别
	 */
	private String level;//1,普通客户 2,VIP客户
	/**
	 * 客户来源
	 */
	private String source;//1，电话营销 2，网络营销 3.
	/**
	 * 客户行业
	 */
	private String industry;//1，教育培训 2，电子商务 3，对外贸易 4，酒店旅游 5，互联网
	/**
	 * 年营业额
	 */
	private String annualTurnover;// 1，1-50万 2，50-200万 3，200-500万 4，500-1000万 5，1000万以上
	/**
	 * 公司性质
	 */
	private String nature;//1，民企 2，合资 3，国企
	/**
	 * 商机状态
	 */
	private String opportunity;//1,意向客户 2,初步沟通 3,深度沟通 4,签订合同
	/**
	 * 合同列表
	 */
	private Set<Contract> contractSet;
	/**
	 * 用户ID
	 */
	private User user;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 修改时间
	 */
	private Date editTime;

	public Customer(Integer id){
		this.id = id;
	}

	@Override
	public String toString() {
		return "Customer{" +
				"id=" + id +
				", name='" + name + '\'' +
				", zipcode='" + zipcode + '\'' +
				", phone='" + phone + '\'' +
				", address='" + address + '\'' +
				", level='" + level + '\'' +
				", source='" + source + '\'' +
				", industry='" + industry + '\'' +
				", annualTurnover='" + annualTurnover + '\'' +
				", nature='" + nature + '\'' +
				", opportunity='" + opportunity + '\'' +
				", userId=" + user.getId() +
				", createTime=" + createTime +
				", editTime=" + editTime +
				'}';
	}
}
