package com.scut.crm.service.impl;

import com.scut.crm.constant.PaginationPropertyConst;
import com.scut.crm.dao.impl.BaseDaoImpl;
import com.scut.crm.dao.po.Contract;
import com.scut.crm.entity.Pagination;
import com.scut.crm.service.AbstractBaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ContractServiceImpl extends AbstractBaseService<Contract>{

    private Logger logger = Logger.getLogger(ContractServiceImpl.class);

    @Autowired
    private BaseDaoImpl baseDao;

    @Override
    public Pagination<Contract> listByPage(Map<String, Object> map) {
        logger.info("map---"+map);
        String hql = "select contract from Contract contract where 1=1";
        StringBuffer joint = new StringBuffer("");

        String currentPage = (String) map.get("currentPage");
        if(null==currentPage || currentPage.isEmpty()){
            /**currentPage=1*/
            currentPage = String.valueOf(PaginationPropertyConst.PAGE_CURRENT_ONE);
        }
        /**获取totalRecords*/
        int totalRecords = this.getTotalRecords(joint.toString(), null);
        /**查询contractList*/
        List<Contract> dataList = baseDao.queryByPage(hql, null, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN);

        /**构建pagination*/
        Pagination<Contract> pagination = new Pagination<>(totalRecords, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN, dataList);
        return pagination;
    }

    @Override
    public List<Contract> listByForeignKey(String id) {
        String hql = "select contract from Contract contract where contract.customerId=?";
        List<Object> paramList = new ArrayList<>();
        paramList.add(id);
        return baseDao.queryList(hql, paramList.toArray());
    }

    @Override
    public int getTotalRecords(String joint, Object[] params) {
        String hql = "select count(*) from Contract contract where 1=1";
        hql = hql + joint;
        int totalRecords = baseDao.count(hql, params);
        logger.info("getTotalRecords----hql---"+hql);
        logger.info("getTotalRecords----totalRecords----"+totalRecords);
        return totalRecords;
    }

    @Override
    public Contract getById(Integer id) {
        return (Contract) baseDao.get(Contract.class, id);
    }
}
