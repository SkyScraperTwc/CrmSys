package com.scut.crm.service;

import com.scut.crm.constant.SerialNumberConst;
import com.scut.crm.dao.impl.BaseDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class AbstractBaseService<T> implements IBaseService<T> {

    @Autowired
    private BaseDaoImpl baseDao;

    @Override
    public boolean judgeIdentifier(String serialNumber) {
        String hql = "";
        String prefix = serialNumber.substring(0,2);
        boolean flag = true;
        if (prefix.equals(SerialNumberConst.USER_SERIAL_PREFIX)){
            hql = "select user.serialNumber from User user";
        }else if (prefix.equals(SerialNumberConst.CUSTOMER_SERIAL_PREFIX)){
            hql = "select customer.serialNumber from Customer customer";
        }else if (prefix.equals(SerialNumberConst.CONTRACT_SERIAL_PREFIX)){
            hql = "select contract.serialNumber from Contract contract";
        }
        List<String> snList = baseDao.queryList(hql,null);
        for (int i = 0; i < snList.size(); i++) {
            if (serialNumber.equals(snList.get(i))){
                flag = false;
                break;
            }
        }
        return flag;
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

