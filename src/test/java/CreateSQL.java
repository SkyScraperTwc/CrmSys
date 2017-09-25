import com.scut.crm.entity.Contract;
import com.scut.crm.entity.Customer;
import com.scut.crm.utils.IdentifierUtils;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class CreateSQL {

    @Test
    public void CreateCustomerSql(){
        String[] name = {"'马云'","'李彦宏'","'马化腾'"};
        String[] level = {"'普通客户'","'VIP客户'"};
        String[] source = {"'电话营销'","'网络营销'","'媒体推广'"};
        String[] industry = {"'教育培训'","'电子商务'","'对外贸易'","'酒店旅游'","'互联网'"};
        String[] annualTurnover = {"'1-50万'","'50-200万'","'200-500万'","'500-1000万'","'1000万以上'"};
        String[] nature = {"'民企'","'合资'","'国企'"};
        String[] opportunity = {"'意向客户'","'初步沟通'","'深度沟通'","'签订合同'"};
        String[] userId = {"'1'","'2'","'3'","'4'","'5'"};
        List<String> list = new ArrayList<>();

        Random random = new Random();
        for (int i=0;i<200;i++){
            StringBuffer buffer = new StringBuffer("INSERT INTO `customer` VALUES ('0', ");
            String serialNumber = IdentifierUtils.getSerialNumber(Customer.class);
            buffer.append("'"+serialNumber+"'"+",");

            int max=3;
            int min=0;
            int s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(name[s]+",");
            buffer.append("'200200', '13888888888', '北京三里桥', ");

            max=2;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(level[s]+",");

            max=3;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(source[s]+",");

            max=5;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(industry[s]+",");

            max=5;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(annualTurnover[s]+",");

            max=3;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(nature[s]+",");

            max=4;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(opportunity[s]+",");

            max=5;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(userId[s]+",");

            buffer.append("current_date(),current_date());");
            list.add(buffer.toString());
        }
        for (String string :list) {
            System.out.println(string);
        }
    }

    @Test
    public void CreateContractSql(){
        String[] name = {"'离婚协议'","'遗赠抚养协议'","'人事代理协议'","'商品房买卖合同'",
                "'竟业禁止协议'","'抵押合同'","'贷款合同'"
                ,"'物业管理合同'","'采购合同'"};
        String[] type = {"'买卖合同'","'租赁合同'","'承揽合同'","'技术合同'"};
        String[] state = {"'执行中'","'结束'","'意外中止'"};
        String[] customerId = {"'1'","'4'","'5'","'15'","'17'","'21'","'28'"
                ,"'30'","'31'","'39'","'45'","'48'","'67'","'71'"
                ,"'79'","'82'","'90'","'91'","'92'","'96'","'99'","'100'","'104'","'105'"
                ,"'111'","'114'","'120'","'125'","'135'","'136'","'138'","'142'","'147'","'151'","'159'"};

        List<String> list = new ArrayList<>();
        Random random = new Random();
        for (int i=0;i<500;i++){
            StringBuffer buffer = new StringBuffer("INSERT INTO `contract` VALUES ('0', ");
            String serialNumber = IdentifierUtils.getSerialNumber(Contract.class);
            buffer.append("'"+serialNumber+"'"+",");

            int max=9;
            int min=0;
            int s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(name[s]+",");

            max=4;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(type[s]+",");

            max=3;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(state[s]+",");
            buffer.append("2000,");

            max=20;
            min=0;
            s = random.nextInt(max)%(max-min+1) + min;
            buffer.append(customerId[s]+",");

            buffer.append("current_date(),current_date());");
            list.add(buffer.toString());
        }
        for (String string :list) {
            System.out.println(string);
        }
    }
}
