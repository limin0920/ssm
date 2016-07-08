

function check_addSale(){
	//alert("check_addSale执行");
	//此处是验证邮箱的正则表达式
	var email = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$"
	var re_email = new RegExp(email);
	if(!/^1\d{10}$/g.test($('#pTel').val())){
		alert("电话号码格式错误");
		$('#pTel').focus();
		$('#pTel').select();
		return false;
	}else if(!re_email.test($('#pPos').val())){
		alert ("请输入有效合法的E-mail地址 ！");
		$('#pPos').focus();
		$('#pPos').select();
		return false;
	}else if(!/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/.test($('#pCardid').val())){
		alert("身份证号码有误");
		$('#pCardid').focus();
		$('#pCardid').select();
		return false;
	}else if($('#pName').val().length!=0 ){
		alert("新增员工成功！")
		return true;
	}else {
		alert("员工姓名不能为空");
		return false;
	}
		
	
}


function check_addDept(){
	//alert("提交");
	if($('#deptno').val().length==0 && $('#did').val().length!=0 && $('#dName').val().length!=0 ){
		if($('#did').val().length > 6){
			$('#deptno').html('<font color="red">部门编号长度不能超过6位且只能是数字</font>');
			return false;
		}else{
			alert("新增部门成功！")
			return true;
		}
		
	}
	return false;
}

function loadDepartmentInfo(){
	//alert("点击了新增员工超连接")
	var url="dept/selectDeptInfo.do";
	$.ajax({
		type : 'POST',
		url : url,
		dataType :'text',
		data : { "tablename" : "department" },
		success : function(data) {
			//alert(data);
			$('#pDepartment').html(data);
		}
	});
}


function checkDeptno(){
	//alert("这里用于部门编号的检查");
	$('#did').bind('onprepertychange input',function(){
		$('#deptno').html("");
		var did = $('#did').val();
		//alert(did);
		if(did.length!=0||did!=" "){
			var url="dept/selectAllDeptno.do";
			$.ajax({
				type : 'POST',
				url : url,
				dataType :'text',
				data : { "did" : did },
				success : function(data) {
					if(data.length!=0){
						$('#deptno').html('<font color="red">'+data+'</font>');
					}
					
				}
			});
		}
	});
}

function checkDeptname(){
	//alert("这里用于部门名称的检查");
	$('#dName').bind('onprepertychange input',function(){
		$('#deptno').html("");
		var dname = $('#dName').val();
		//alert(dname);
		if(dname.length!=0||dname!=" "){
			var url="dept/selectAllDeptname.do";
			$.ajax({
				type : 'POST',
				url : url,
				dataType :'text',
				data : { "dname" : dname },
				success : function(data) {
					if(data.length!=0){
						$('#deptno').html('<font color="red">'+data+'</font>');
					}
				}
			});
		}
	});
}


function checkPerName(){
	var flag = 0;
	var name = $('#name').val();
	if(name.length != 0 && name !=" "){
		//alert(name);
		var url="sale/checkPerName.do";
		$.ajax({
			type : 'POST',
			url : url,
			dataType :'text',
			data : { "name" : name },
			async:false, //这是重要的一步，防止重复提交的
			success : function(data) {
				if(data=="yes"){
					flag=1;
					//addUser(flag);
				}else{
					alert(data);
					$('#name').focus();
					$('#name').select();
				}
			}
		});
		
		if(flag=="1"){
			alert("新增角色成功！");
			return true;
		}else{
			return false;
		}	
	}else{
		alert("名字不能为空");
		return false;
	}

}




