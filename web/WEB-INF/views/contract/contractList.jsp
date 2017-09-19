<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../main/index.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">合同管理</h1>
		</div>
	</div>

	<button class="btn btn-default" onclick="addContract()">添加合同</button>

	<div class="row" id="contractList">
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
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagination.dataList}" var="contract" varStatus="stat">
								<tr>
									<td>${(pagination.currentPage-1)*pagination.pageSize+stat.count}</td>
									<td>${contract.name}</td>
									<td>${contract.type}</td>
									<td>${contract.state}</td>
									<td>${contract.money}</td>
									<td>${contract.customer.name}</td>
									<td>${contract.editTime}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<!-- 分页标签 -->
						<ul class="pagination ul-group from-horizontal">
							<li><a href="${pageContext.request.contextPath}/contractAction/list.action?currentPage=${pagination.first}">首页</a></li>
							<li><a href="${pageContext.request.contextPath}/contractAction/list.action?currentPage=${pagination.previous}">上一页</a></li>
							<li><span>${ pagination.currentPage } / ${pagination.totalPages}</span></li>
							<li><a href="${pageContext.request.contextPath}/contractAction/list.action?currentPage=${pagination.next}">下一页</a></li>
							<li><a href="${pageContext.request.contextPath}/contractAction/list.action?currentPage=${pagination.last}">尾页</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="contractAdd.jsp"%>

<script type="text/javascript">

    function addCustomer(){
        $("#contractList").hide();
        $("#addContract").show();
    }

    function backSubmit(){
        $("#contractList").show();
        $("#addContract").hide();
    }

    function addSubmit(){
        $.ajax({
            type:"post",
            url:"<%=basePath%>contractAction/add.action",
            data:$("#addContractForm").serialize(),
            success:function(data) {
                alert("合同添加成功");
                window.location.href="<%=basePath%>contractAction/list.action";
            }
        });
    }

</script>