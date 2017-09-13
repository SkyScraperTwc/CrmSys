package com.scut.crm.constant;

import java.util.HashMap;
import java.util.Map;

public final class PropertyMapConst {

    /**客户级别*/
    public final static Map<String,Object> CUSTOMER_LEVEL_MAP = new HashMap();
    /**客户来源*/
    public final static Map<String,Object> CUSTOMER_SOURCE_MAP = new HashMap();
    /**客户行业*/
    public final static Map<String,Object> CUSTOMER_INDUSTRY_MAP = new HashMap();
    /**年营业额*/
    public final static Map<String,Object> CUSTOMER_ANNUALTURNOVER_MAP = new HashMap();
    /**公司性质*/
    public final static Map<String,Object> CUSTOMER_NATURE_MAP = new HashMap();
    /**客户状态*/
    public final static Map<String,Object> CUSTOMER_STATUS_MAP = new HashMap();
    /**商机状态*/
    public final static Map<String,Object> CUSTOMER_OPPORTUNITY_MAP = new HashMap();

    /**静态代码块*/
    static {
        CUSTOMER_LEVEL_MAP.put(EntityPropertyConst.ONE, "普通客户");
        CUSTOMER_LEVEL_MAP.put(EntityPropertyConst.TWO, "VIP客户");


        CUSTOMER_SOURCE_MAP.put(EntityPropertyConst.ONE, "电话营销");
        CUSTOMER_SOURCE_MAP.put(EntityPropertyConst.TWO, "网络营销");
        CUSTOMER_SOURCE_MAP.put(EntityPropertyConst.THREE, "媒体推广");


        CUSTOMER_INDUSTRY_MAP.put(EntityPropertyConst.ONE, "教育培训");
        CUSTOMER_INDUSTRY_MAP.put(EntityPropertyConst.TWO, "电子商务");
        CUSTOMER_INDUSTRY_MAP.put(EntityPropertyConst.THREE, "对外贸易");
        CUSTOMER_INDUSTRY_MAP.put(EntityPropertyConst.FOUR, "酒店旅游");
        CUSTOMER_INDUSTRY_MAP.put(EntityPropertyConst.FIVE, "互联网");


        CUSTOMER_ANNUALTURNOVER_MAP.put(EntityPropertyConst.ONE, "1-50万");
        CUSTOMER_ANNUALTURNOVER_MAP.put(EntityPropertyConst.TWO, "50-200万");
        CUSTOMER_ANNUALTURNOVER_MAP.put(EntityPropertyConst.THREE, "200-500万");
        CUSTOMER_ANNUALTURNOVER_MAP.put(EntityPropertyConst.FOUR, "500-1000万");
        CUSTOMER_ANNUALTURNOVER_MAP.put(EntityPropertyConst.FIVE, "1000万以上");

        CUSTOMER_NATURE_MAP.put(EntityPropertyConst.ONE, "民企");
        CUSTOMER_NATURE_MAP.put(EntityPropertyConst.TWO, "合资");
        CUSTOMER_NATURE_MAP.put(EntityPropertyConst.THREE, "国企");

        CUSTOMER_STATUS_MAP.put(EntityPropertyConst.ONE, "基础客户");
        CUSTOMER_STATUS_MAP.put(EntityPropertyConst.TWO, "潜在客户");
        CUSTOMER_STATUS_MAP.put(EntityPropertyConst.THREE, "成功客户");
        CUSTOMER_STATUS_MAP.put(EntityPropertyConst.FOUR, "无效客户");

        CUSTOMER_OPPORTUNITY_MAP.put(EntityPropertyConst.ONE, "意向客户");
        CUSTOMER_OPPORTUNITY_MAP.put(EntityPropertyConst.TWO, "初步沟通");
        CUSTOMER_OPPORTUNITY_MAP.put(EntityPropertyConst.THREE, "深度沟通");
        CUSTOMER_OPPORTUNITY_MAP.put(EntityPropertyConst.FOUR, "签订合同");
    }
}
