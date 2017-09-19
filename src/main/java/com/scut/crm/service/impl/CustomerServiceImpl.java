package com.scut.crm.service.impl;

import com.scut.crm.constant.PaginationPropertyConst;
import com.scut.crm.dao.impl.BaseDaoImpl;
import com.scut.crm.dao.po.Contract;
import com.scut.crm.dao.po.Customer;
import com.scut.crm.entity.Pagination;
import com.scut.crm.dao.po.User;
import com.scut.crm.service.AbstractBaseService;
import com.scut.crm.utils.ScopeUtils;
import lombok.extern.log4j.Log4j;
import org.apache.log4j.Logger;
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

	@Override
	public List<Customer> listByForeignKey(String id) {
		String hql = "select customer from Customer customer where customer.user.id=?";
		List<Object> paramList = new ArrayList<>();
		paramList.add(id);
		return baseDao.queryList(hql,paramList.toArray());
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
}
