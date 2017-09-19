<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../main/index.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">客户管理</h1>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" action="${pageContext.request.contextPath }/customerAction/list.action" method="post">
				<div class="form-group">
					<label for="customerName">客户名称</label>
					<input type="text" class="form-control" id="customerName" value="${queryRequest.cust_name}" name="queryRequest.cust_name">
				</div>
				<div class="form-group">
					<label for="customerFrom">客户来源</label>
					<select class="form-control" id="customerFrom" placeholder="客户来源" name="queryRequest.cust_source">
						<option value="">--请选择--</option>
						<option value="1">电话营销</option>
						<option value="2">网络营销</option>
						<option value="3">媒体推广</option>
					</select>
				</div>
				<div class="form-group">
					<label for="custIndustry">所属行业</label>
					<select class="form-control" id="custIndustry" name="queryRequest.cust_industry">
						<option value="">--请选择--</option>
						<option value="1">教育培训</option>
						<option value="2">电子商务</option>
						<option value="3">对外贸易</option>
						<option value="4">酒店旅游</option>
						<option value="5">互联网</option>
					</select>
				</div>
				<div class="form-group">
					<label for="custLevel">客户级别</label>
					<select class="form-control" id="custLevel" name="queryRequest.cust_level">
						<option value="">--请选择--</option>
						<option value="1">普通客户</option>
						<option value="2">VIP客户</option>
					</select>
				</div>
			<button type="submit" class="btn btn-primary">查询</button>
		</form>
	</div>
</div>

<button class="btn btn-default" onclick="addCustomer()">添加客户</button>

<div class="row" id="customerList">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">客户信息列表</div>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>客户名称</th>
							<th>客户来源</th>
							<th>客户行业</th>
							<th>客户级别</th>
							<th>年营业额</th>
							<th>公司性质</th>
							<th>商机状态</th>
							<th>手机</th>
							<th>合同数量</th>
							<th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagination.dataList}" var="customer" varStatus="stat">
							<tr>
								<td>${(pagination.currentPage-1)*pagination.pageSize+stat.count}</td>
								<td>${customer.name}</td>
								<td>${customer.source}</td>
								<td>${customer.industry}</td>
								<td>${customer.level}</td>
								<td>${customer.annualTurnover}</td>
								<td>${customer.nature}</td>
								<td>${customer.opportunity}</td>
								<td>${customer.phone}</td>
								<td>${fn:length(customer.contractSet)}</td>
								<td>${customer.editTime}</td>
								<td>
									<a href="javascript:void(0);"  onclick="editCustomer(${customer.id})" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog">修改</a>
									<a href="javascript:void(0);" onclick="deleteCustomer(${customer.id})"  class="btn btn-danger btn-xs">删除</a>
									<a href="javascript:void(0);"  onclick="checkContract('${customer.opportunity}', ${customer.id})" class="btn btn-success btn-xs">查看合同</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<!-- 分页标签 -->
					<ul class="pagination ul-group from-horizontal">
						<li><a href="${pageContext.request.contextPath}/customerAction/list.action?queryRequest.currentPage=${pagination.first}&amp;queryRequest.cust_name=${queryRequest.cust_name}&amp;queryRequest.cust_source=${queryRequest.cust_source}&amp;queryRequest.cust_industry=${queryRequest.cust_industry}&amp;queryRequest.cust_level=${queryRequest.cust_level}">首页</a></li>
						<li><a href="${pageContext.request.contextPath}/customerAction/list.action?queryRequest.currentPage=${pagination.previous}&amp;queryRequest.cust_name=${queryRequest.cust_name}&amp;queryRequest.cust_source=${queryRequest.cust_source}&amp;queryRequest.cust_industry=${queryRequest.cust_industry}&amp;queryRequest.cust_level=${queryRequest.cust_level}">上一页</a></li>
						<li><span>${ pagination.currentPage } / ${pagination.totalPages}</span></li>
						<li><a href="${pageContext.request.contextPath}/customerAction/list.action?queryRequest.currentPage=${pagination.next}&amp;queryRequest.cust_name=${queryRequest.cust_name}&amp;queryRequest.cust_source=${queryRequest.cust_source}&amp;queryRequest.cust_industry=${queryRequest.cust_industry}&amp;queryRequest.cust_level=${queryRequest.cust_level}">下一页</a></li>
						<li><a href="${pageContext.request.contextPath}/customerAction/list.action?queryRequest.currentPage=${pagination.last}&amp;queryRequest.cust_name=${queryRequest.cust_name}&amp;queryRequest.cust_source=${queryRequest.cust_source}&amp;queryRequest.cust_industry=${queryRequest.cust_industry}&amp;queryRequest.cust_level=${queryRequest.cust_level}">尾页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="customerAdd.jsp"%>
<%@include file="customerEdit.jsp"%>

<script type="text/javascript">

    function addCustomer(){
        $("#customerList").hide();
        $("#addCustomer").show();
    }

    function backSubmit(){
        $("#customerList").show();
        $("#addCustomer").hide();
    }

    function addSubmit(){
        $.ajax({
            type:"post",
            url:"<%=basePath%>customerAction/add.action",
            data:$("#addCustomerForm").serialize(),
            success:function(data) {
                alert("客户添加成功");
                window.location.href="<%=basePath%>customerAction/list.action";
            }
        });
    }

    function checkContract(opportunity, id){
		if(opportunity!="签订合同"){
			alert("此客户没有签订合同！");
		}else{
            window.location.href="<%=basePath%>contractAction/checkContract.action?customerId="+id;
		}
	}

    function editCustomer(id) {
        $.ajax({
            type:"post",
            url:"<%=basePath%>customerAction/detail.action",
            data:{"customerId":id},
            success:function(data) {
                var obj = JSON.parse(data);
                $("#edit_cust_id").val(obj["cust_id"]);
                $("#edit_cust_name").val(obj["cust_name"]);
                $("#edit_cust_phone").val(obj["cust_phone"])
                $("#edit_cust_zipcode").val(obj["cust_zipcode"])
                $("#edit_cust_address").val(obj["cust_address"])
                $("#edit_cust_source").val(obj["cust_source"]);
                $("#edit_cust_industry").val(obj["cust_industry"]);
                $("#edit_cust_Level").val(obj["cust_level"]);
                $("#edit_cust_annualTurnover").val(obj["cust_annualTurnover"]);
                $("#edit_cust_nature").val(obj["cust_nature"]);
                $("#edit_cust_opportunity").val(obj["cust_opportunity"]);
            }
        });
    }

    function updateCustomer() {
        $.post(
            "<%=basePath%>customerAction/update.action",
            $("#edit_customer_form").serialize(),
            function(data){
                if(data=="update_success"){
                    alert("客户信息更新成功！");
                    window.location.href="<%=basePath%>customerAction/list.action";
                }
            });
    }

    function deleteCustomer(id) {
        if(confirm('确实要删除该客户吗?')) {
            $.post(
                "<%=basePath%>customerAction/delete.action",
                {"customerId":id},
                function(data){
                    if(data=="delete_success"){
                        alert("客户删除更新成功！");
                        window.location.href="<%=basePath%>customerAction/list.action";
                    }
			});
        }
    }

</script>