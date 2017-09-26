package com.scut.crm.service.impl;

import com.scut.crm.constant.PaginationPropertyConst;
import com.scut.crm.dao.impl.BaseDaoImpl;
import com.scut.crm.entity.Contract;
import com.scut.crm.entity.Customer;
import com.scut.crm.entity.Pagination;
import com.scut.crm.entity.User;
import com.scut.crm.service.AbstractBaseService;
import com.scut.crm.utils.ScopeUtils;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Log4j
public class CustomerServiceImpl extends AbstractBaseService<Customer> {

	@Autowired
	private BaseDaoImpl baseDao;

	@Override
	public Pagination<Customer> listByPage(Map<String,Object> map) {
		String hql = "select customer from Customer customer where 1=1";
		StringBuffer joint = new StringBuffer("");
		List<Object> paramList = new ArrayList<>();

		Customer customer = null;
		String currentPage = "";
		String customerName = "";
		String customerIndustry = "";
		String customerSource = "";
		String customerLevel = "";
		if(null!=map && map.size()>0){
			customer = (Customer) map.get("customer");
			currentPage =  (String) map.get("currentPage");
			customerName = customer.getName();
			customerIndustry = customer.getIndustry();
			customerSource = customer.getSource();
			customerLevel = customer.getLevel();
		}

		User user = (User) ScopeUtils.getSessionMap().get("user");
		String userId = String.valueOf(user.getId());
		if(null!=userId && !userId.isEmpty()){
			joint.append(" and customer.user.id=?");
			paramList.add(Integer.valueOf(userId));
		}
		if(null==currentPage || currentPage.isEmpty()){
			/**currentPage=1*/
			currentPage = String.valueOf(PaginationPropertyConst.PAGE_CURRENT_ONE);
		}
		if(null!=customerName && !customerName.isEmpty()){
			joint.append(" and customer.name=?");
			paramList.add(customerName);
		}
		if(null!=customerIndustry && !customerIndustry.isEmpty()){
			joint.append(" and customer.industry=?");
			paramList.add(customerIndustry);
		}
		if(null!=customerSource && !customerSource.isEmpty()){
			joint.append(" and customer.source=?");
			paramList.add(customerSource);
		}
		if(null!=customerLevel && !customerLevel.isEmpty()){
			joint.append(" and customer.level=?");
			paramList.add(customerLevel);
		}
		hql = hql + joint.toString();

		/**获取totalRecords*/
		int totalRecords = this.getTotalRecords(joint.toString(), paramList.toArray());

		/**查询customerList*/
		List<Customer> customerList = baseDao.queryByPage(hql, paramList.toArray(), Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN);

		/**构建pagination*/
		Pagination<Customer> pagination = new Pagination<>(totalRecords, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN, customerList);
		log.info("Pagination<Customer>---hql----"+hql);
		log.info("Pagination<Customer>---paramList----"+paramList);
		log.info("Pagination<Customer>---pagination----"+pagination);
		return pagination;
	}

	/**
	 * 根据外键userId查询
	 * @param map
	 * @return
	 */
	@Override
	public Pagination<Customer> listByForeignKey(Map<String,Object> map) {
		String hql = "select customer from Customer customer where 1=1";
		List<Object> paramList = new ArrayList<>();
		StringBuffer joint = new StringBuffer("");

		String currentPage = (String) map.get("currentPage");
		String userId = (String) map.get("userId");
		if(null==currentPage || currentPage.isEmpty()){
			/**currentPage=1*/
			currentPage = String.valueOf(PaginationPropertyConst.PAGE_CURRENT_ONE);
		}
		if(null!=userId && !userId.isEmpty()){
			joint.append(" and customer.user.id=?");
			paramList.add(userId);
		}
		int totalRecords = this.getTotalRecords(joint.toString(), paramList.toArray());
		List<Customer> dataList = baseDao.queryByPage(hql, paramList.toArray(), Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN);
		Pagination<Customer> pagination = new Pagination<>(totalRecords, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN, dataList);
		return pagination;
	}


	@Override
	public int getTotalRecords(String joint, Object[] params) {
		String hql = "select count(*) from Customer customer where 1=1";
		hql = hql + joint;
		int totalRecords = baseDao.count(hql, params);
		log.info("getTotalRecords----hql---"+hql);
		log.info("getTotalRecords----totalRecords----"+totalRecords);
		return totalRecords;
	}

	@Override
	public Customer getById(Integer id) {
		return (Customer) baseDao.get(Customer.class, id);
	}

	@Override
	public Customer getBySerialNumber(String serialNumber) {
		String hql = "select customer from Customer customer where customer.serialNumber=?";
		List<Object> paramList = new ArrayList<>();
		paramList.add(serialNumber);
		Customer customer = (Customer) baseDao.queryOne(hql,paramList.toArray());
		return customer;
	}

}
