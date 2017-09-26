package com.scut.crm.action;

import com.alibaba.fastjson.JSON;
import com.scut.crm.constant.PageReturnConst;
import com.scut.crm.entity.Customer;
import com.scut.crm.entity.Pagination;
import com.scut.crm.entity.User;
import com.scut.crm.service.impl.CustomerServiceImpl;
import com.scut.crm.utils.convert.CustomerConvertUtils;
import com.scut.crm.utils.ScopeUtils;
import com.scut.crm.web.vo.CustomerQueryRequest;
import com.scut.crm.web.vo.save.CustomerSaveRequest;
import com.scut.crm.web.vo.CustomerUpdateRequest;
import lombok.Data;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@Data
@Scope("prototype")
@Controller
@Log4j
public class CustomerAction {

	private String customerId;

	private String detailJson;

	private String deleteJson;

	private String updateJson;

	private CustomerQueryRequest queryRequest;

	private CustomerSaveRequest saveRequest;

	private CustomerUpdateRequest updateRequest;

	@Autowired
	private CustomerServiceImpl customerService;

	/**
	 * 客户列表
	 * @return
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	public String list() throws InvocationTargetException, IllegalAccessException {
		/**queryRequest转换成customer*/
		Map<String,Object> map = CustomerConvertUtils.fromQueryRequest2Customer(queryRequest);
		Pagination<Customer> pagination = customerService.listByPage(map);
		ScopeUtils.getRequestMap().put("pagination",pagination);
		return PageReturnConst.CUST_INDEX;
	}

	/**
	 * 客户添加
	 * @return
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	public String add() throws InvocationTargetException, IllegalAccessException {
		String serialNumber = customerService.getIdentifier(Customer.class);
		User user = (User) ScopeUtils.getSessionMap().get("user");
		/**saveRequest转换成customer*/
		Customer customer = CustomerConvertUtils.fromSaveRequest2Customer(saveRequest, serialNumber, user);
		customerService.save(customer);
		return PageReturnConst.ADD_SUCCESS;
	}

	/**
	 * 客户删除
	 * @return
	 */
	public String delete(){
		customerService.remove(new Customer(Integer.valueOf(customerId)));
		deleteJson = PageReturnConst.DELETE_SUCCESS;
		return deleteJson;
	}

	/**
	 * 客户更新
	 * @return
	 */
	public String update() throws InvocationTargetException, IllegalAccessException {
		User user = (User) ScopeUtils.getSessionMap().get("user");
		Customer customer = CustomerConvertUtils.fromUpdateRequest2Customer(updateRequest, user);
		customerService.update(customer);
		updateJson = PageReturnConst.UPDATE_SUCCESS;
		return updateJson;
	}

	/**
	 * 客户详细信息
	 * @return
	 */
	public String detail() throws InvocationTargetException, IllegalAccessException {
		Customer customer = customerService.getById(Integer.valueOf(customerId));
		CustomerUpdateRequest updateRequest = CustomerConvertUtils.fromCustomer2UpdateRequest(customer);
		/**转换为json格式*/
		detailJson = JSON.toJSONString(updateRequest);
		return PageReturnConst.DETAIL_SUCCESS;
	}
}
