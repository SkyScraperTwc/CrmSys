package com.scut.crm.utils;
import com.scut.crm.dao.impl.BaseDaoImpl;
import com.scut.crm.dao.po.Customer;
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

    @Test
    public void test4(){

    }

    @Test
    public void CreateSql(){
        String[] name = {"'马云'","'李彦宏'","'马化腾'"};
        String[] level = {"'普通客户'","'VIP客户'"};
        String[] source = {"'电话营销'","'网络营销'","'媒体推广'"};
        String[] industry = {"'教育培训'","'电子商务'","'对外贸易'","'酒店旅游'","'互联网'"};
        String[] annualTurnover = {"'1-50万'","'50-200万'","'200-500万'","'500-1000万'","'1000万以上'"};
        String[] nature = {"'民企'","'合资'","'国企'"};
        String[] status = {"'基础客户'","'潜在客户'","'成功客户'","'无效客户'"};
        String[] opportunity = {"'意向客户'","'初步沟通'","'深度沟通'","'签订合同'"};
        String[] userId = {"'1'","'2'","'3'"};
        List<String> list = new ArrayList<>();
        String sql = "INSERT INTO `customer` VALUES ('0', '马云', '200200', '13888888888', '北京三里桥', '1', '2', '1', '1', '1', '1', '1', '2',current_date(),current_date());";

        Random random = new Random();
        for (int i=0;i<200;i++){
            StringBuffer buffer = new StringBuffer("INSERT INTO `customer` VALUES ('0', ");
            int max=3;
            int min=0;
            int s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(name[0]+",");
            if (s==1) buffer.append(name[1]+",");
            if (s==2) buffer.append(name[2]+",");
            buffer.append("'200200', '13888888888', '北京三里桥', ");

            max=2;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(level[0]+",");
            if (s==1) buffer.append(level[1]+",");

            max=3;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(source[0]+",");
            if (s==1) buffer.append(source[1]+",");
            if (s==2) buffer.append(source[2]+",");

            max=5;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(industry[0]+",");
            if (s==1) buffer.append(industry[1]+",");
            if (s==2) buffer.append(industry[2]+",");
            if (s==3) buffer.append(industry[3]+",");
            if (s==4) buffer.append(industry[4]+",");

            max=5;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(annualTurnover[0]+",");
            if (s==1) buffer.append(annualTurnover[1]+",");
            if (s==2) buffer.append(annualTurnover[2]+",");
            if (s==3) buffer.append(annualTurnover[3]+",");
            if (s==4) buffer.append(annualTurnover[4]+",");

            max=3;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(nature[0]+",");
            if (s==1) buffer.append(nature[1]+",");
            if (s==2) buffer.append(nature[2]+",");

            max=4;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(status[0]+",");
            if (s==1) buffer.append(status[1]+",");
            if (s==2) buffer.append(status[2]+",");
            if (s==3) buffer.append(status[3]+",");

            max=4;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(opportunity[0]+",");
            if (s==1) buffer.append(opportunity[1]+",");
            if (s==2) buffer.append(opportunity[2]+",");
            if (s==3) buffer.append(opportunity[3]+",");

            max=3;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            if (s==0) buffer.append(userId[0]+",");
            if (s==1) buffer.append(userId[1]+",");
            if (s==2) buffer.append(userId[2]+",");

            buffer.append("current_date(),current_date());");
            list.add(buffer.toString());
        }
        for (String string :list) {
            System.out.println(string);
        }
    }
}
