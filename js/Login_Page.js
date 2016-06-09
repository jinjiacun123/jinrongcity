//LoginPageActive();
//回车登录
function keyLogin(event){
  if (event.keyCode == 13)  {
    event.returnValue=false;
    event.cancel = true;
	// 登录
	var UsernameDef = $(".Login_Box #Username").val();
	if(UsernameDef){
		var PasswordDef = $(".Login_Box #Password").val();	
		var RmbPsw=$('#Auto_landing').val();
		var AutoLogin=$('#Rem_password').val();
		ajaxlogin(UsernameDef,PasswordDef,RmbPsw,AutoLogin);
	}
	var mobile=$('#Mobile_number').val();
	if(mobile){
		var mobilecode=$('#Security_Code').val();
		var username=$('#new_username').val();
		var password=$('#new_password').val();
		var newpassword=$('#new_password2').val();
		ajaxregister(mobile,mobilecode,username,password,newpassword);
	}
  }
}
function ajaxlogin(UsernameDef,PasswordDef,RmbPsw,AutoLogin){
	$.post("/Login/dologin",{username:UsernameDef,password:PasswordDef,check:RmbPsw,AutoLogin:AutoLogin},function(data){
		$(".writer_box .alert_info").css('display','block');
		if(data=='ok'){		
		$(".Login_Box .Landing_btn_info").html("登录成功").css({"display":"block",'color':"green"});
			location.reload();
		}else{
			$(".Login_Box .Landing_btn_info").html(data).css("display","block");
		}							
	 });
}
//注册
function ajaxregister(mobile,mobilecode,username,password,newpassword){
	$.post("/Login/register",{mobile:mobile,mobilecode:mobilecode,username:username,password:password,newpassword:newpassword},function(data){
		if(data=='ok'){		
			$(".Login_Register .Landing_btn_info").html("用户注册成功").css({"display":"block",'color':"green"});
			location.reload();
		}else{
			$(".Login_Register .Landing_btn_info").html(data).css("display","block");
		}							
	 });
}
function LoginPageActive(){
//////2015.10.28 添加图形校验部分 开始
	
	//注册页部分
	$(".Login_Register #ecuritycode1_code").blur(function(){
		var code = $(this).val();
		if(code){
			$.post("/Login/check_verify",{verify:code},function(data){
				if(data==1){
					isimgverify(false);
					}
				if(data==0){
//					var $that = $(this).parentsUntil(".Login_Register,.Login_Forget");
//					var objid=$that.find("#Mobile_number");
//					get_mobile(objid,$(".Security_Code_btn"));
					isimgverify(true);					
					}	
				});			
		}else{
			isimgverify(false);
		}	
	});	
	$(".Login_Register #ecuritycode1").click(function(){
		var verifyimg = $(this).attr("src"); 
		 $(this).attr("src", verifyimg+'?random='+Math.random());
	});	
	$(".Login_Register .Landing_btn").click(function(){
		if($('.Login_Register .ecuritycode2').is(':hidden')){
			$(".Login_Register #ecuritycode1_code").focus();
			$(".Login_Register .ecuritycode1 .ecuritycode1_info").text("请输入右侧图片中的数字和字母");			
		}		
	});
	
	//忘记密码部分
	$(".Login_Forget #ecuritycode3_code").blur(function(){
			var code = $(this).val();
		if(code){
			$.post("/Login/check_verify",{verify:code},function(data){
				if(data==1){
					isimgverify(false);
					}
				if(data==0){
//					var $that = $(this).parentsUntil(".Login_Register,.Login_Forget");
//					var objid=$that.find("#Mobile_number");
//					get_mobile(objid,$(".Security_Code_btn"));
					isimgverify(true);					
					}	
				});			
		}else{
			isimgverify(false);
		}	
	});
	
	$(".Login_Forget #ecuritycode3").click(function(){
		var verifyimg = $(this).attr("src"); 
		 $(this).attr("src", verifyimg+'?random='+Math.random());
	});
	
	$(".Login_Forget .Landing_btn").click(function(){
		if($('.Login_Forget .ecuritycode4').is(':hidden')){
			$(".Login_Forget #ecuritycode3_code").focus();
			$(".Login_Forget .ecuritycode3 .ecuritycode1_info").text("请输入右侧图片中的数字和字母");
		}
		
	});
	
	
	
	
//////2015.10.28 添加图形校验部分 结束
	
	//#点击显示登陆和注册
	$(".header2 #register,.header2 #Login").click(function(event){
		$('body').attr("onkeydown",'keyLogin(event)');
		//阻止默认浏览器动作(W3C) 
			if ( event && event.preventDefault ){ 
				event.preventDefault(); 
			//IE中阻止函数器默认动作的方式 
			}else{
				window.event.returnValue = false; 
			return false;
			}			
		 var clickId = ($(this).attr("id"));
		
		LoginBoxToggle(clickId);
		
	});
//判断是否登录
	$('.contribute_btn').click(function(){
		var isuserid=$('#isuserid').val();
		islogin(isuserid,'/sub');
	})
	$('#applysub').click(function(){
		var isuserid=$('#isuserid').val();
		islogin(isuserid,'/User/verify');
	})
	$('#verifyButton').click(function(){
		var isuserid=$('#isuserid').val();
		islogin(isuserid,'/User/verify');
	})
	$('#messageButton').click(function(){
		var uid = $("#space_uid").val();
		if(!uid){
				LoginBoxToggle('Login');
				return false;
			}else{
				$("#messageBox").toggle(200);
				$(".writer_box .alert_info").toggle(200);
				$("#textBox").val(textTemp1);
					return true;
			}
		
	})
	function isimgverify(flag){
		if(flag){
			$(".Login_Register .ecuritycode1").css("display","none");
			$(".Login_Register .ecuritycode2").css("display","block");			
		}else{
			$(".Login_Register .ecuritycode1 .ecuritycode1_info").text("请输入右侧图片中的数字和字母");
		}
	}
	function islogin(issession,url){
		if (issession) {
			location.href=url;		  	
		  }else{
		  	LoginBoxToggle('Login');
		  }
		}
	//------判断是否登录结束----	
		//LoginBox隐藏切换
	function LoginBoxToggle(Element){
		$("#Login_Page .Login_Box,#Login_Page .Login_Register,#Login_Page .Login_Forget").css("display","none");
		if(Element == "Login"){//显示登陆
			$('#Mobile_number').val('');
			$("#Login_Page .Login_Box").css("display","block");
		}else if(Element == "register"){
			$(".Login_Box #Username").val('');
			$("#Login_Page .Login_Register").css("display","block");
		}
		$("#Login_Page").show();
		
		
		$("#Login_Page .Login_Box,#Login_Page .Login_Forget,#Login_Page .Login_Register,#Login_Page>img").click(function(e){
			 if ( e && e.stopPropagation ) {
			// 因此它支持W3C的stopPropagation()方法 
				e.stopPropagation();
				} else { 
			// 否则，我们需要使用IE的方式来取消事件冒泡
			window.event.cancelBubble = true;
			}
			
		});
			$("#Login_Page").click(function(e){	
			
				$("#Login_Page").hide();
				//消除提示层
				$("#Login_Page .Landing_btn_info").html("").css("display","none");
				$("#Login_Page .info").html("");
				$("#Login_Page input").val("");
				
				
				$(".Login_Box #Username").val(UsernameDef);
				$(".Login_Box #Password").attr("type","text");
				$(".Login_Box #Password,.Login_Box #Username").css("color","#ccc");
				$(".Login_Box #Password").val(PasswordDef);
				Username=1,Password=1;		
			
		});
		
	}

	//登陆页输入判断
	inputAct1();
	var Username=1,Password=1;//是否输入标识
	var UsernameDef,PasswordDef;//保存默认值
	UsernameDef = $(".Login_Box #Username").val();
	PasswordDef = $(".Login_Box #Password").val();
	
	
	
	function inputAct1(){
		$(".Login_Box #Username").focus(function(){
			if(Username){
				$(this).val("");
				Username=0;
			}
			$(this).css("color","#000");
			$(".Login_Box .Landing_btn_info").html("").css("display","none");
		});
		
		$(".Login_Box #Password").focus(function(){
			if(Password){
				$(this).val("");
				Password=0;
			}
			$(this).css("color","#000");
			$(this).attr("type","password");
			$(".Login_Box .Landing_btn_info").html("").css("display","none");
		});
		
		$(".Login_Box #Username").blur(function(){
			if($(this).val()==""){
				//alert(UsernameDef)
				$(".Login_Box #Username").val(UsernameDef);
				$(this).css("color","#ccc");
				Username=1;
			}
			
		});
		
		$(".Login_Box #Password").blur(function(){
			if($(this).val()==""){
				$(this).attr("type","text");
				$(this).css("color","#ccc");
				$(this).val(PasswordDef);
				Password=1;
			}
			
		});
		
		//点击登陆
		$(".Login_Box .Landing_btn").click(function(){
			if(Username&&Password == 1){
				$(".Login_Box .Landing_btn_info").html("请输入用户名和密码").css("display","block");
				 
			}else if(Username==1){
				$(".Login_Box .Landing_btn_info").html("请输入用户名").css("display","block");
				 
			}else if(Password==1){
				$(".Login_Box .Landing_btn_info").html("请输入密码").css("display","block");
			
			}else if(Username+Password == 0){//全部不为空			
				UsernameDef = $(".Login_Box #Username").val();
				PasswordDef = $(".Login_Box #Password").val();	
				var RmbPsw=$('#Auto_landing').val();
				var AutoLogin=$('#Rem_password').val();
					ajaxlogin(UsernameDef,PasswordDef,RmbPsw,AutoLogin);
			}
		});
	
	}

	
	//切换到忘记密码页
	
	$(".Login_Box #Forgot_password").click(function(){
		$("#Login_Page .Login_Box").hide();
		$("#Login_Page .Login_Forget").show();
	});
	
	//忘记密码页动作
	inputAct2();
	var ForgotNumber = new Array(1,1,1,1,1);//对应标识
	var ForgotNumberVal = new Array();//对应提醒语
	ForgotNumberVal[0] = "请输入正确手机号";
	ForgotNumberVal[1] = "请输入正确验证码";
	ForgotNumberVal[2] = "请输入数字或英文";
	ForgotNumberVal[3] = "请输入数字或英文";
	
	function inputAct2(){
		//配置对应位置的正则
		var ForgotRegExp = new Array();
		ForgotRegExp[0]= RegExp("^1[3|4|5|8][0-9]\\d{4,8}$");
		ForgotRegExp[1]= RegExp("[0-9]");//数字
		ForgotRegExp[2]= RegExp("[A-z0-9]");//数字和英文
		ForgotRegExp[3]= RegExp("[A-z0-9]");//数字和英文
		$(".Login_Forget .input1").blur(function(){
			var RegExpTemp = $(this).val();
			var i = $(".Login_Forget .input1").index(this);
			if(ForgotRegExp[i].test(RegExpTemp)){
				$("#Forget_main .info").eq(i).html("");
				ForgotNumber[i]=0;
			}else{
				$("#Forget_main .info").eq(i).html(ForgotNumberVal[i]);
				ForgotNumber[i]=1;
			}
			if(i==2||i==3){
				var temp1 = $(".Login_Forget .input1").eq(2).val();
				var temp2 = $(".Login_Forget .input1").eq(3).val();
				//检测密码两次相同
				if(temp1!=temp2){
					$(".Login_Forget .Landing_btn_info").html("请输入2次相同的密码").css("display","block");
					ForgotNumber[4]=1;
				}else{
					$(".Login_Forget .Landing_btn_info").html("").css("display","none");
					ForgotNumber[4]=0;
					// document.Forget.submit();
				}
			}
		});
	}
	//确定检测
	$(".Login_Forget .Landing_btn").click(function(){
			for(var i=0;i<4;i++){
				if(ForgotNumber[i]==1){
					$("#Forget_main .info").eq(i).html(ForgotNumberVal[i]);
				}
			}	
			//检测密码两次相同
			var temp1 = $(".Login_Forget .input1").eq(2).val();
			var temp2 = $(".Login_Forget .input1").eq(3).val();
			if((temp1!=temp2)||(temp1=="")||(temp2=="")){
				$(".Login_Forget .Landing_btn_info").html("请输入2次相同的密码").css("display","block");
			}else{
				$(".Login_Forget .Landing_btn_info").html("").css("display","none");
			}
			//全部合格
			var temp3 = 0,y;
			
			for(y in ForgotNumber){
				temp3 = temp3 + ForgotNumber[y];
			}
			if(temp3 == 0){
			document.Forget.submit();//	alert("全部合格可发送");//全部合格可发送;
			}
			
		});
		
	$(".Login_Forget #goto_Login").click(function(){
		$('#Mobile_number').val('');
		$(".Login_Forget input").val("");
		$(".Login_Box .Login_Forget").val("");
		$("#Login_Page .Login_Forget").hide();
		//$("#Login_Page .Login_Box").hide();
		$("#Login_Page .Login_Box").show();
	});	

	$(".Login_Forget #goto_Register").click(function(){
		//登录清空
		$(".Login_Box #Username").val('');
		$(".Login_Forget input").val("");
		$(".Login_Box .Login_Forget").val("");
		$("#Login_Page .Login_Forget").hide();
		//$("#Login_Page .Login_Box").hide();
		$("#Login_Page .Login_Register").show();
	});

//注册页动作
	inputAct3('Login_Register_auth');
	inputAct3('Login_Register');
	var RegisterNumber = new Array(1,1,1,1,1,1);//对应标识
	var RegisterNumberVal = new Array();//对应提醒语
	RegisterNumberVal[0] = "请输入正确手机号";
	RegisterNumberVal[1] = "请输入正确验证码";
	RegisterNumberVal[2] = "请输入数字或英文,长度大于3小于15";
	RegisterNumberVal[3] = "请输入数字或英文";
	RegisterNumberVal[4] = "请输入数字或英文";
	function inputAct3(Login_Register){
		//配置对应位置的正则
		var RegisterRegExp = new Array();
		RegisterRegExp[0]= RegExp("^1[3|4|5|8][0-9]\\d{4,8}$");
		RegisterRegExp[1]= RegExp("[0-9]");//数字
		RegisterRegExp[2]= RegExp("[A-z0-9]");//数字和英文
		RegisterRegExp[3]= RegExp("[A-z0-9]");//数字和英文
		RegisterRegExp[4]= RegExp("[A-z0-9]");//数字和英文
		$("."+Login_Register+" .input1").blur(function(){
			var RegExpTemp = $(this).val();
			var i = $("."+Login_Register+" .input1").index(this);
			if(RegisterRegExp[i].test(RegExpTemp)){
				$("."+Login_Register+" .info").eq(i).html("");
				RegisterNumber[i]=0;
			}else{
				$("."+Login_Register+" .info").eq(i).html(RegisterNumberVal[i]);
				RegisterNumber[i]=1;
			}
			if(i==3||i==4){
				var temp1 = $("."+Login_Register+" .input1").eq(3).val();
				var temp2 = $("."+Login_Register+" .input1").eq(4).val();
				//检测密码两次相同
				if(temp1!=temp2){
					$("."+Login_Register+" .Landing_btn_info").html("请输入2次相同的密码").css("display","block");
					RegisterNumber[4]=1;
				}else{
					$("."+Login_Register+" .Landing_btn_info").html("").css("display","none");
					RegisterNumber[4]=0;
					//document.register.submit();
				}
			}
		});
	}
	
	//发送验证码
	function get_mobile(objid,obj1){
				$.post("/Login/mobileverify",{mobile:objid.val(), jhashcode:$('#jhashco').val()},function(data){
					var obj =eval('(' + data + ')');
					if(obj.res=='ok'){		
						var btnid=obj1.attr('id');	
						var btn=document.getElementById(btnid);	
						if(obj.count)			
						test.count=obj.count;
						test.init(btn);
						  }
					
			   
				});						   
					var test = {
						   node:null,
						   count:"60",
						   start:function(){
							  //console.log(this.count);
							  if(this.count > 0){
								 this.node.innerHTML ="还剩"+ this.count-- +"秒";	
								 this.node.style.cursor='default';							 
								 var _this = this;
								 setTimeout(function(){
									_this.start();
								 },1000);
							  }else{
									this.node.style.cursor='hand';		
								 this.node.removeAttribute("disabled");
								 this.node.innerHTML = "再次发送";
								 this.count = 60;
							  }
						   },
						   //初始化
						   init:function(node){
							  this.node = node;
							  this.node.setAttribute("disabled",true);
							  this.start();
						   }
						};
					
			
    }
	//再次发送验证码返回图片验证码
function celarEcuritycodeX(codeX){//切回图形验证函数,"ecuritycode1"注册，"ecuritycode3"忘记密码
		
		if(codeX == "ecuritycode1"){//注册页面
			$(".Login_Register #ecuritycode1_code").val("");
			$(".Login_Register #Security_Code").val("");
			$(".Login_Register .ecuritycode2").css("display","none");
			$(".Login_Register .ecuritycode1").css("display","block");
		}
		
		if(codeX == "ecuritycode3"){//忘记密码页面
			$(".Login_Forget #ecuritycode3_code").val("");
			$(".Login_Forget #Security_Code").val("");
			$(".Login_Forget .ecuritycode4").css("display","none");
			$(".Login_Forget .ecuritycode3").css("display","block");
		}
	}
	
	//短信效验
		$(".Security_Code_btn").click(function(){			
			var $that = $(this).parentsUntil(".Login_Register,.Login_Forget");
			var objid=$that.find("#Mobile_number");
			var regVal = objid.val();
		
			if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(regVal))){//验证手机
				var btnNums = $that.find(".Forgetr_box").index($that.find("#Mobile_number").parents(".Forgetr_box"));
				if(btnNums == -1){
					btnNums = $that.find(".Register_box").index($that.find("#Mobile_number").parents(".Register_box"));
					//alert("1"+btnNums);
					$that.find(".info").eq(btnNums).html("请输入正确手机号");
				}else{
					//alert("2"+btnNums);
					$that.find(".info").eq(btnNums).html("请输入正确手机号");
				}
			}else{
				var code_text=$(this).text();
				if(code_text=='再次发送'){
					var celar=$(this).attr('forget');				
					celarEcuritycodeX(celar);
					$(this).text('点击发送验证码');
				}else{
					get_mobile(objid,$(this));	
				}				
			}
			
		});
	
	
//点击注册按钮
	$(".Login_Register .Landing_btn").click(function(){
			for(var i=0;i<5;i++){
				if(RegisterNumber[i]==1){
					$(".Login_Register .info").eq(i).html(RegisterNumberVal[i]);
				}
			}	
			//检测密码两次相同
			var temp1 = $(".Login_Register .input1").eq(3).val();
			var temp2 = $(".Login_Register .input1").eq(4).val();
			
			if((temp1!=temp2)||(temp1=="")||(temp2=="")){
				$(".Login_Register .Landing_btn_info").html("请输入2次相同的密码").css("display","block");
			}else{
				$(".Login_Register .Landing_btn_info").html("").css("display","none");
			}
			
			//全部合格
			var temp3 = 0,y;
			var temp4 = 0 ;
			
			if($(".Login_Register #Agreement").is(':checked')){
				RegisterNumber[5]=0;
				var temp5 = $(".Login_Register .Landing_btn_info").html();
				if(temp5=="请确认同意网站服务条款"){
				$(".Login_Register .Landing_btn_info").html("").css("display","none");
				}
			}else{
				RegisterNumber[5]=1;
				$(".Login_Register .Landing_btn_info").html("请确认同意网站服务条款").css("display","block");
				
			}
			
			for(y in RegisterNumber){
				temp3 = temp3 + RegisterNumber[y];
			}
			if(temp3 == 0){
			//	alert("全部合格可发送");//全部合格可发送
				var mobile=$('.Mobile_number_register').val();
				var mobilecode=$('.Security_Code_register').val();
				var username=$('#new_username').val();
				var password=$('.new_password_register').val();
				var newpassword=$('.new_password2_register').val();
				ajaxregister(mobile,mobilecode,username,password,newpassword);
			}
			
		});	

//第三方注册按钮
	$(".Login_Register_auth .Landing_btn_auth").click(function(){
			inputAct3('Login_Register_auth');
			for(var i=0;i<5;i++){
				if(RegisterNumber[i]==1){
					$(".Login_Register_auth .info").eq(i).html(RegisterNumberVal[i]);
				}
			}	
			//检测密码两次相同
			var temp1 = $(".Login_Register_auth .input1").eq(3).val();
			var temp2 = $(".Login_Register_auth .input1").eq(4).val();
			
			if((temp1!=temp2)||(temp1=="")||(temp2=="")){
				$(".Login_Register_auth .Landing_btn_info").html("请输入2次相同的密码").css("display","block");
			}else{
				$(".Login_Register_auth .Landing_btn_info").html("").css("display","none");
			}
			
			//全部合格
			var temp3 = 0,y;
			var temp4 = 0 ;
			
			if($(".Login_Register_auth #Agreement").is(':checked')){
				RegisterNumber[5]=0;
				var temp5 = $(".Login_Register_auth .Landing_btn_info").html();
				if(temp5=="请确认同意网站服务条款"){
				$(".Login_Register_auth .Landing_btn_info").html("").css("display","none");
				}
			}else{
				RegisterNumber[5]=1;
				$(".Login_Register_auth .Landing_btn_info").html("请确认同意网站服务条款").css("display","block");
				
			}
			
			for(y in RegisterNumber){
				temp3 = temp3 + RegisterNumber[y];
			}
			if(temp3 == 0){		
				var auth_nickname=$('#auth_nickname').val();
				var auth_attachurl=$('#auth_attachurl').val();
				var auth_type=$('#auth_type').val();
				var auth_typeid=$('#auth_typeid').val();
				var mobile=$('.Mobile_number_auth').val();
				var mobilecode=$('.Security_Code_auth').val();
				var username=$('#new_username_auth').val();
				var password=$('#new_password_auth').val();
				var newpassword=$('#new_password2_auth').val();
				ajaxauthregister(mobile,mobilecode,username,password,newpassword,auth_nickname,auth_attachurl,auth_type,auth_typeid);	
			
			}
			
		});
	//注册
function ajaxauthregister(mobile,mobilecode,username,password,newpassword,nickname,attachurl,type,typeid){
	$.post("/Login/authregister",{mobile:mobile,mobilecode:mobilecode,username:username,password:password,newpassword:newpassword,nickname:nickname,attachurl:attachurl,type:type,typeid:typeid},function(data){
		if(data=='ok'){		
			$(".Login_Register_auth .Landing_btn_info").html("注册成功").css({"display":"block",'color':"green"});
			location.href="/";
		}else{
			$(".Login_Register_auth .Landing_btn_info").html(data).css("display","block");
		}							
	 });
}				
}