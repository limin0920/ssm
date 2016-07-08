$(document).ready(function(){

	$("#paytime").hide();
	$("#payli").hide();
	$("#paymoney").hide(); 
	$("#payhostel").hide(); 
	
});

//弹出隐藏层
function ShowDiv(show_div,bg_div){
	document.getElementById(show_div).style.display='block';
	document.getElementById(bg_div).style.display='block' ;
	var bgdiv = document.getElementById(bg_div);
	bgdiv.style.width = document.body.scrollWidth;
	// bgdiv.style.height = $(document).height();
	$("#"+bg_div).height($(document).height());
};
//关闭弹出层
function CloseDiv(show_div,bg_div)
{
	document.getElementById(show_div).style.display='none';
	document.getElementById(bg_div).style.display='none';
	
};


function checkCoutomer(){
	
	if($('#ispay').is(":checked")){
		//$('#cstime').date_input();
		if($('#cstime').val().length==0){
			alert("签单时间不能为空");
			return false;
		}else if($('#cpay').val().length==0){
			alert("学费不能为空");
			return false;
		}else if($('#chostel').val().length==0){
			alert("住宿费不能为空");
			return false;
		}else{
			return true;
		}
		
	}else {
		alert("否按钮");
		return true;
	}
	
}

function checkRadio(name,flag){
	if(name.checked){
		if(flag=="yes"){
			//alert("你点击了是按钮");
			//$("#paytime").show();
			$("#payli").show();
			$("#paymoney").show(); 
			$("#payhostel").show(); 
		}else{
			//alert("你点击了否");
			$("#paytime").hide();
			$("#payli").hide();
			$("#paymoney").hide(); 
			$("#payhostel").hide(); 
		}
	}
	
}

function checkCustomerStatus(part){
	
	
	//alert("a2sd")
	var url="customer/selectCustomerStatus.do";
	$.ajax({
		type : 'POST',
		url : url,
		dataType :'json',
		data : { "selectCustomerStatus" : "selectCustomerStatus" },
		success : function(data) {
			//alert(data);
			var htmlContent = "<tr><th width='131'>姓名</th><th>电话</th><th>状态</th><th>操作</th></tr>";
			for(var obj in data){
				htmlContent += "<tr><td>" + data[obj].uname + "</td>";
				htmlContent += "<td>" +  data[obj].utel + "</td>";
				if(data[obj].uid2==0 && data[obj].cif==""){
					htmlContent += "<td>未签单</td>";
					if(part==1){
						htmlContent +="<td><a onclick='return delectsomeone()' href='customer/deleteOneCustomer.do?cuid="+data[obj].uid1+"'>删除</a>";
						htmlContent +="&nbsp;&nbsp;&nbsp;&nbsp;<a href='customer/addcode.do?cuid="+data[obj].uid1+"&cuname="+data[obj].uname+"'>签单</a></td></tr>";
					}else{
						htmlContent +="<td></td></tr>";
					}
				}else if(data[obj].uid2!=0 && data[obj].cif==""){
					htmlContent += "<td>已签单</td>";
					if(part == 2){
						htmlContent +="<td><a href='customer/cheques.do?cid="+data[obj].cid+"&uname="+data[obj].uname+"'>核对收款</a></td></tr>";
					}else{
						htmlContent +="<td></td></tr>";
					}
				}else if(data[obj].uid2!=0 && data[obj].cif!=""){
					htmlContent += "<td>已付款</td>";
					htmlContent +="<td></td></tr>";
				}
			}
			$("#customerStatusTable").html(htmlContent);

		}
	});
}

function delectsomeone(){
	if(confirm("确定要删除这条记录吗？")){
		return true;
	}else{
		return false;
	}
}
	
