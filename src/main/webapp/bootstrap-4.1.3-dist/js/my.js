// JavaScript Document
//登陆
$("#login_btn_m").click(function(){
		$("#usn_psd_error").remove();
		var form=document.getElementById("login_modal");
		var formdata=new FormData(form);
		formdata.append("modal","true");
		$.ajax({
			//contentType: "application/x-www-form-urlencoded",
			type:"POST",
			url:"UserLogin",
			dataType:"text",
			data:{
				username:$("#login_usn").val(),
				password:$("#login_psd").val(),
				modal:"yes",
			},
			//processData: false,
			success:function(xhr){
					if(xhr=="1"){
						//登陆成功
						window.location.reload();
					}
					else if(xhr=="admin"){
						window.location.href="adminPage.jsp";
					}
					else{
						//添加警告框
						$("#alert-div").append("<small id='usn_psd_error'>用户名或密码错误</small>");
						$("#login_psd").addClass("is-invalid");
						$("#login_usn").addClass("is-invalid");
					}
						
						
			}
		});
		
	})
$("#login_psd").keyup(function(){
	$("#alert-div").empty();
	$(this).removeClass("is-invalid");
	
});
$("#login_usn").keyup(function(){
	$("#alert-div").empty();
	$(this).removeClass("is-invalid");
	
});
$("#find_p_byid_btn").click(function(){
  if($("#find_p_byid_inp").val()=="")
  	alert("id不能为空");
  else{
  $.ajax({
		type:"post",
		url:"FindProducts",
		dataType:"text",
		data:{
			pid:$("#find_p_byid_inp").val()
		},
		success:function(xhr){
			$("#p_result_set").html("");
			$("#p_result_set").html(xhr);
		}
	});
  
  }
  })
  $("#find_p_bycond_btn").click(function(){
  $.ajax({
		type:"post",
		url:"FindProducts",
		dataType:"text",
		data:{
			category:$("#category option:selected").val(),
			priceOp:$("#price_op option:selected").val(),
			priceInp:$("#price_inp").val(),
			numOp:$("#num_op option:selected").val(),
			numInp:$("#num_inp").val(),
			
		},
		success:function(xhr){
			$("#p_result_set").html("");
			$("#p_result_set").html(xhr);
		}
	});
  })
    $("#find_o_bycond_btn").click(function(){
  $.ajax({
		type:"post",
		url:"FindOrders",
		dataType:"text",
		data:{
			model:$("input[type=radio]:checked").val(),
			oval:$("#oinp").val()
			
		},
		success:function(xhr){
			$("#o_result_set").html("");
			$("#o_result_set").html(xhr);
		}
	});
  })
    <script>
  	$("[name=addCart]").click(function(){
  		var btn=$(this);
  		$.ajax({
			type:"post",
			url:"operateCart",
			datatype:"json",
			data:{
				type:'add',
				productid:$(this).attr("id")
			},
			success:function(xhr){
				alert("添加购物车成功");
		}
		});
  	});