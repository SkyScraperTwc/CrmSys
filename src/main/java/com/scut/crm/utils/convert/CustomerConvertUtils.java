package com.scut.crm.utils.convert;

import com.scut.crm.constant.PropertyMapConst;
import com.scut.crm.entity.Customer;
import com.scut.crm.entity.User;
import com.scut.crm.utils.convert.base.SuperConvertUtils;
import com.scut.crm.web.vo.CustomerQueryRequest;
import com.scut.crm.web.vo.save.CustomerSaveRequest;
import com.scut.crm.web.vo.CustomerUpdateRequest;
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Entity转换工具类
 */

public final class CustomerConvertUtils extends SuperConvertUtils{
    /**
     * customerSaveRequest ——> customer
     * @param saveRequest
     * @return
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public static Customer fromSaveRequest2Customer(CustomerSaveRequest saveRequest, String serialNumber, User user) throws InvocationTargetException, IllegalAccessException {
        Customer customer = new Customer();
        BeanUtils.setProperty(customer,"id",null);
        BeanUtils.setProperty(customer,"serialNumber", serialNumber);
        BeanUtils.setProperty(customer,"name",saveRequest.getCust_name());
        BeanUtils.setProperty(customer,"zipcode",saveRequest.getCust_zipcode());
        BeanUtils.setProperty(customer,"phone",saveRequest.getCust_phone());
        BeanUtils.setProperty(customer,"address",saveRequest.getCust_address());
        /**转换成中文形式存进数据库*/
        BeanUtils.setProperty(customer,"level", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_LEVEL_MAP),saveRequest.getCust_level()));
        BeanUtils.setProperty(customer,"source", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_SOURCE_MAP),saveRequest.getCust_source()));
        BeanUtils.setProperty(customer,"industry", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_INDUSTRY_MAP),saveRequest.getCust_industry()));
        BeanUtils.setProperty(customer,"annualTurnover", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_ANNUALTURNOVER_MAP),saveRequest.getCust_annualTurnover()));
        BeanUtils.setProperty(customer,"nature", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_NATURE_MAP),saveRequest.getCust_nature()));
        BeanUtils.setProperty(customer,"opportunity", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_OPPORTUNITY_MAP),saveRequest.getCust_opportunity()));
        BeanUtils.setProperty(customer,"contractSet",null);
        BeanUtils.setProperty(customer,"user",user);
        BeanUtils.setProperty(customer,"createTime",new Date());
        BeanUtils.setProperty(customer,"editTime",new Date());
        return customer;
    }

    /**
     * customerQueryRequest ——> customer
     * @param queryRequest
     * @return
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public static Map<String,Object> fromQueryRequest2Customer(CustomerQueryRequest queryRequest) throws InvocationTargetException, IllegalAccessException {
        if(null!=queryRequest){
            Map<String,Object> map = new HashMap<>();
            Customer customer = new Customer();
            /**转换成中文形式存进数据库*/
            BeanUtils.setProperty(customer,"name",queryRequest.getCust_name());
            BeanUtils.setProperty(customer,"level", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_LEVEL_MAP),queryRequest.getCust_level())) ;
            BeanUtils.setProperty(customer,"source",getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_SOURCE_MAP),queryRequest.getCust_source()));
            BeanUtils.setProperty(customer,"industry",getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_INDUSTRY_MAP),queryRequest.getCust_industry()));
            String currentPage = queryRequest.getCurrentPage();
            map.put("currentPage",currentPage);
            map.put("customer",customer);
            return map;
        }else {
            return null;
        }
    }

    /**
     * customer——>customerUpdateRequest
     * @param customer
     * @return
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public static CustomerUpdateRequest fromCustomer2UpdateRequest(Customer customer) throws InvocationTargetException, IllegalAccessException {
        CustomerUpdateRequest updateRequest = new CustomerUpdateRequest();
        BeanUtils.setProperty(updateRequest,"cust_id",customer.getId());
        BeanUtils.setProperty(updateRequest,"cust_serialNumber",customer.getSerialNumber());
        BeanUtils.setProperty(updateRequest,"cust_name",customer.getName());
        BeanUtils.setProperty(updateRequest,"cust_phone",customer.getPhone());
        BeanUtils.setProperty(updateRequest,"cust_zipcode",customer.getZipcode());
        BeanUtils.setProperty(updateRequest,"cust_address",customer.getAddress());
        BeanUtils.setProperty(updateRequest,"cust_source",getKeyByValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_SOURCE_MAP), customer.getSource()));
        BeanUtils.setProperty(updateRequest,"cust_industry",getKeyByValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_INDUSTRY_MAP),customer.getIndustry()));
        BeanUtils.setProperty(updateRequest,"cust_level", getKeyByValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_LEVEL_MAP), customer.getLevel()));
        BeanUtils.setProperty(updateRequest,"cust_annualTurnover",getKeyByValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_ANNUALTURNOVER_MAP),customer.getAnnualTurnover()));
        BeanUtils.setProperty(updateRequest,"cust_nature",getKeyByValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_NATURE_MAP),customer.getNature()));
        BeanUtils.setProperty(updateRequest,"cust_opportunity",getKeyByValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_OPPORTUNITY_MAP),customer.getOpportunity()));
        return updateRequest;
    }

    /**
     * updateRequest——>Customer
     * @param updateRequest
     * @return
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public static Customer fromUpdateRequest2Customer(CustomerUpdateRequest updateRequest, User user) throws InvocationTargetException, IllegalAccessException {
        Customer customer = new Customer();
        BeanUtils.setProperty(customer,"id",updateRequest.getCust_id());
        BeanUtils.setProperty(customer,"serialNumber", updateRequest.getCust_serialNumber());
        BeanUtils.setProperty(customer,"name",updateRequest.getCust_name());
        BeanUtils.setProperty(customer,"zipcode",updateRequest.getCust_zipcode());
        BeanUtils.setProperty(customer,"phone",updateRequest.getCust_phone());
        BeanUtils.setProperty(customer,"address",updateRequest.getCust_address());
        /**转换成中文形式存进数据库*/
        BeanUtils.setProperty(customer,"level", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_LEVEL_MAP),updateRequest.getCust_level()));
        BeanUtils.setProperty(customer,"source", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_SOURCE_MAP),updateRequest.getCust_source()));
        BeanUtils.setProperty(customer,"industry", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_INDUSTRY_MAP),updateRequest.getCust_industry()));
        BeanUtils.setProperty(customer,"annualTurnover", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_ANNUALTURNOVER_MAP),updateRequest.getCust_annualTurnover()));
        BeanUtils.setProperty(customer,"nature", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_NATURE_MAP),updateRequest.getCust_nature()));
        BeanUtils.setProperty(customer,"opportunity", getValue(getUnmodifiableMap(PropertyMapConst.CUSTOMER_OPPORTUNITY_MAP),updateRequest.getCust_opportunity()));
        BeanUtils.setProperty(customer,"contractSet",null);
        BeanUtils.setProperty(customer,"user",user);
        BeanUtils.setProperty(customer,"createTime",new Date());
        BeanUtils.setProperty(customer,"editTime",new Date());
        return customer;
    }

}
