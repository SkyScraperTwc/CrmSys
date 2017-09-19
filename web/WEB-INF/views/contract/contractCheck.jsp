<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../main/index.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">合同管理</h1>
		</div>
	</div>

	<button class="btn btn-default" onclick="addContract()">添加合同</button>

	<div class="row" id="ContractList">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">合同信息列表</div>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>合同名称</th>
								<th>合同类型</th>
								<th>合同状态</th>
								<th>合同金额</th>
								<th>客户名称</th>
								<th>修改时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${contractList}" var="contract" varStatus="stat">
								<tr>
									<td>${stat.count}</td>
									<td>${contract.name}</td>
									<td>${contract.type}</td>
									<td>${contract.state}</td>
									<td>${contract.money}</td>
									<td>${contract.customer.name}</td>
									<td>${contract.editTime}</td>
									<td>
										<a href="javascript:void(0);"  onclick="editContract(${contract.id})" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#ContractEditDialog">修改</a>
										<a href="javascript:void(0);" onclick="deleteContract(${contract.id})"  class="btn btn-danger btn-xs">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

    function addContract(){
        $("#ContractList").hide();
        $("#addContract").show();
    }

    function backSubmit(){
        $("#ContractList").show();
        $("#addContract").hide();
    }

    function addSubmit(){
        $.ajax({
            type:"post",
            url:"<%=basePath%>ContractAction/add.action",
            data:$("#addContractForm").serialize(),
            success:function(data) {
                alert("客户添加成功");
                window.location.href="<%=basePath%>ContractAction/list.action";
            }
        });
    }

    function checkContract(opportunity, id){
		if(opportunity!="签订合同"){
			alert("此客户没有签订合同！");
		}else{
            $.post(
                "<%=basePath%>contractAction/checkContract.action",
                {"ContractId":id},
                function(data){
                    return true;
			});
		}
	}

    function editContract(id) {
        $.ajax({
            type:"post",
            url:"<%=basePath%>ContractAction/detail.action",
            data:{"ContractId":id},
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

    function updateContract() {
        $.post(
            "<%=basePath%>ContractAction/update.action",
            $("#edit_Contract_form").serialize(),
            function(data){
                if(data=="update_success"){
                    alert("客户信息更新成功！");
                    window.location.href="<%=basePath%>ContractAction/list.action";
                }
            });
    }

    function deleteContract(id) {
        if(confirm('确实要删除该客户吗?')) {
            $.post(
                "<%=basePath%>ContractAction/delete.action",
                {"ContractId":id},
                function(data){
                    if(data=="delete_success"){
                        alert("客户删除更新成功！");
                        window.location.href="<%=basePath%>ContractAction/list.action";
                    }
			});
        }
    }

</script>