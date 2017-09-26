package com.scut.crm.service.impl;

import com.scut.crm.constant.PaginationPropertyConst;
import com.scut.crm.dao.impl.BaseDaoImpl;
import com.scut.crm.entity.Contract;
import com.scut.crm.entity.Customer;
import com.scut.crm.entity.Pagination;
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
public class ContractServiceImpl extends AbstractBaseService<Contract>{

    @Autowired
    private BaseDaoImpl baseDao;

    @Override
    public Pagination<Contract> listByPage(Map<String, Object> map) {
        String hql = "select contract from Contract contract where 1=1";
        StringBuffer joint = new StringBuffer("");

        String currentPage = (String) map.get("currentPage");
        if(null==currentPage || currentPage.isEmpty()){
            /**currentPage=1*/
            currentPage = String.valueOf(PaginationPropertyConst.PAGE_CURRENT_ONE);
        }
        /**获取totalRecords*/
        int totalRecords = this.getTotalRecords(joint.toString(), null);
        /**查询contractSet*/
        List<Contract> dataList = baseDao.queryByPage(hql, null, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN);
        /**构建pagination*/
        Pagination<Contract> pagination = new Pagination<>(totalRecords, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN, dataList);
        return pagination;
    }

    /**
     * 根据外键customerId查询
     * @param map
     * @return
     */
    @Override
    public Pagination<Contract> listByForeignKey(Map<String,Object> map) {
        String hql = "select contract from Contract contract where 1=1";
        List<Object> paramList = new ArrayList<>();
        StringBuffer joint = new StringBuffer("");

        String currentPage = (String) map.get("currentPage");
        String customerId = (String) map.get("customerId");
        if(null==currentPage || currentPage.isEmpty()){
            /**currentPage=1*/
            currentPage = String.valueOf(PaginationPropertyConst.PAGE_CURRENT_ONE);
        }
        if(null!=customerId && !customerId.isEmpty()){
            joint.append(" and contract.customer.id=?");
            paramList.add(Integer.valueOf(customerId));
        }
        hql = hql + joint.toString();
        int totalRecords = this.getTotalRecords(joint.toString(), paramList.toArray());

        List<Contract> dataList = baseDao.queryByPage(hql, paramList.toArray(), Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN);

        Pagination<Contract> pagination = new Pagination<>(totalRecords, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN, dataList);
        return pagination;
    }

    @Override
    public int getTotalRecords(String joint, Object[] params) {
        String hql = "select count(*) from Contract contract where 1=1";
        hql = hql + joint;
        int totalRecords = baseDao.count(hql, params);
        log.info("getTotalRecords----hql---"+hql);
        log.info("getTotalRecords----totalRecords----"+totalRecords);
        return totalRecords;
    }

    @Override
    public Contract getById(Integer id) {
        return (Contract) baseDao.get(Contract.class, id);
    }

    @Override
    public Contract getBySerialNumber(String serialNumber) {
        return null;
    }

}
