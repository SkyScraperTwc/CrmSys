package com.scut.crm.web.vo;

import lombok.Data;

@Data
public class CustomerSaveRequest {

    private String cust_name;

    private String cust_phone;

    private String cust_zipcode;

    private String cust_address;

    private String cust_source;

    private String cust_industry;

    private String cust_level;

    private String cust_annualTurnover;

    private String cust_nature;

    private String cust_opportunity;
}
