package com.scut.crm.service.impl;

import com.scut.crm.constant.PaginationPropertyConst;
import com.scut.crm.dao.impl.BaseDaoImpl;
import com.scut.crm.dao.po.Customer;
import com.scut.crm.dao.po.User;
import com.scut.crm.entity.Pagination;
import com.scut.crm.service.AbstractBaseService;
import com.scut.crm.utils.ScopeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl extends AbstractBaseService<User>{

    private Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Autowired
    private BaseDaoImpl baseDao;

    @Autowired
    private CustomerServiceImpl customerService;

    public boolean login(String username, String password) {
        String hql = "select user from User user where user.username=?";
        Object[] param = {username};
        User user = (User) baseDao.queryOne(hql, param);
        if (null!=user && user.getPassword().equals(password)){
            HttpSession session = ScopeUtils.getHttpSession();
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(-1);
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Pagination<User> listByPage(Map<String, Object> map) {
        logger.info("map---"+map);
        String hql = "select user from User user where 1=1";
        StringBuffer joint = new StringBuffer("");

        String currentPage = (String) map.get("currentPage");
        if(null==currentPage || currentPage.isEmpty()){
            /**currentPage=1*/
            currentPage = String.valueOf(PaginationPropertyConst.PAGE_CURRENT_ONE);
        }
        /**获取totalRecords*/
        int totalRecords = this.getTotalRecords(joint.toString(), null);
        /**查询userList*/
        List<User> dataList = baseDao.queryByPage(hql, null, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN);
        for (User user :dataList) {
            List<Customer> customerList = customerService.listByForeignKey(String.valueOf(user.getId()));
            user.setCustomerList(customerList);
        }
        /**构建pagination*/
        Pagination<User> pagination = new Pagination<>(totalRecords, Integer.valueOf(currentPage), PaginationPropertyConst.PAGE_SIZE_TEN, dataList);
        return pagination;
    }

    @Override
    public List<User> listByForeignKey(String id) {
        return null;
    }

    @Override
    public int getTotalRecords(String joint, Object[] params) {
        String hql = "select count(*) from User user where 1=1";
        hql = hql + joint;
        int totalRecords = baseDao.count(hql, params);
        logger.info("getTotalRecords----hql---"+hql);
        logger.info("getTotalRecords----totalRecords----"+totalRecords);
        return totalRecords;
    }

    @Override
    public User getById(Integer id) {
        return (User) baseDao.get(User.class,id);
    }
}
