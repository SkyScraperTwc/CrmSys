package com.scut.crm.dao.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
	/**
	 * id
	 */
	private Integer id;
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
	private List<Contract> contractList;
	/**
	 * 用户ID
	 */
	private String userId;
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
}
