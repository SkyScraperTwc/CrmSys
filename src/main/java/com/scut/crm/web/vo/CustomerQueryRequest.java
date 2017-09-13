package com.scut.crm.web.vo;

import lombok.Data;

@Data
public class CustomerQueryRequest {

    private String cust_name;

    private String cust_source;

    private String cust_industry;

    private String cust_level;

    private String currentPage;

}
