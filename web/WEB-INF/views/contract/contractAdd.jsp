<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="row" id="addContract" style="display: none">
	<div class="col-lg-12">
		<form id="addContractForm" class="form-horizontal" style="width: 600px; margin: 0 auto;" method="post">
			<div class="form-group">
				<label class="col-sm-2 control-label">合同名字</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="合同名字" name="saveRequest.cont_name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">合同类型</label>
				<div class="col-sm-10">
					<select class="form-control" placeholder="合同类型" name="saveRequest.cont_type">
						<option value="0">--请选择--</option>
						<option value="1">买卖合同</option>
						<option value="2">承揽合同</option>
						<option value="3">技术合同</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label">合同状态</label>
				<div class="col-sm-10">
					<select class="form-control" name="saveRequest.cont_state">
						<option value="0">--请选择--</option>
						<option value="1">执行中</option>
						<option value="2">结束</option>
						<option value="3">意外中止</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">合同金额</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="合同金额" name="saveRequest.cont_money">
				</div>
			</div>
			<div class="form-group">
				<button class="btn btn-default" onclick="addSubmit()">添加</button>
				<button class="btn btn-default" onclick="backSubmit()">返回</button>
			</div>
		</form>
	</div>
</div>
