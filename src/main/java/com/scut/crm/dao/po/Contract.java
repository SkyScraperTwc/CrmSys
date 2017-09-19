package com.scut.crm.dao.po;

import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Contract {
    /**
     * id
     */
    private Integer id;
    /**
     * 合同名字
     */
    private String name;
    /**
     * 合同类型
     */
    private String type;//1买卖合同 2租赁合同 3承揽合同 4技术合同
    /**
     * 合同状态
     */
    private String state;//1执行中 2结束 3意外中止
    /**
     * 合同金额
     */
    private BigDecimal money;
    /**
     * 客户
     */
    private Customer customer;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date editTime;

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", state='" + state + '\'' +
                ", money=" + money +
                ", customerId=" + customer.getId() +
                ", createTime=" + createTime +
                ", editTime=" + editTime +
                '}';
    }
}
