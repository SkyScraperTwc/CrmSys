package com.scut.crm.service;

import com.scut.crm.dao.impl.BaseDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractBaseService<T> implements IBaseService<T> {

    @Autowired
    private BaseDaoImpl baseDao;

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

