package com.scut.crm.service;

import com.scut.crm.dao.impl.BaseDaoImpl;
import com.scut.crm.entity.Contract;
import com.scut.crm.entity.Customer;
import com.scut.crm.entity.User;
import com.scut.crm.utils.IdentifierUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class AbstractBaseService<T> implements IBaseService<T> {

    @Autowired
    private BaseDaoImpl baseDao;

    @Override
    public String getIdentifier(Class c) {
        String hql = "";
        boolean flag = true;
        if (c.equals(User.class)){
            hql = "select user.serialNumber from User user";
        }else if (c.equals(Customer.class)){
            hql = "select customer.serialNumber from Customer customer";
        }else if (c.equals(Contract.class)){
            hql = "select contract.serialNumber from Contract contract";
        }
        String serialNumber = "";
        do {
            serialNumber = IdentifierUtils.getSerialNumber(c);
            List<String> snList = baseDao.queryList(hql,null);
            for (int i = 0; i < snList.size(); i++) {
                /**判断serialNumber是否重复*/
                if (serialNumber.equals(snList.get(i))){
                    flag = false;
                    break;
                }
            }
        }while (!flag);
        return serialNumber;
    }

    @Override
    public void update(T object) {
        baseDao.update(object);
    }

    @Override
    public void remove(T object) {
        baseDao.remove(object);
    }

    @Override
    public int save(T object) {
       return baseDao.save(object);
    }
}

