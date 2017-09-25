package com.scut.crm.utils;
import com.scut.crm.dao.impl.BaseDaoImpl;
import com.scut.crm.entity.Customer;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import java.util.*;

@Component
public class JunitTest {

    @Test
    public void test1(){
        Map<String,Object> map = new HashMap();
        System.out.println(map.get(""));
    }

    @Test
    public void test2(){
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(ServletActionContext.getServletContext());
        BaseDaoImpl baseDao = webApplicationContext.getBean(BaseDaoImpl.class);
        String hql = "select customer from Customer customer where 1=1";
        String currentPage = "1";
        List<Customer> customerList = baseDao.queryByPage(hql, null, Integer.valueOf(currentPage),10);
        System.out.println(customerList);
    }

    @Test
    public void test3(){
        Map<String,Object> map = new HashMap<>();
        map.put("aa","123");
        System.out.println(map);
        map = Collections.unmodifiableMap(map);
        map.put("bb","456");
    }

}
