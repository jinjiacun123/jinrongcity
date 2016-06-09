<div class="header2">
		 <div class="box1_bg">
			<div class="box1">
				<a href="index.asp" target="_parent"><img src="images/LOGO2.jpg" alt="" /></a>
				<!--<div class="search_option_box">
					<div class="option_bg" id="show_option">文章</div>
					<select  name="options" id="options">
						<option value="title" selected="selected">文章 </option>
						<option value="author" >理财</option>
					</select>
				</div>
				<div class="header_search">
					<form action="#">
						<input  type="text" name="k" class="search_text"/>
						<input type="hidden" name="type" id="so_type" value="title" />
						<input  type="submit" class="search_btn" value="" />
					</form>
				</div>-->
					<div class="login_box">
					<a href="mereg.asp" target="_parent">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<%if session("memeber_Id")="" then%><a href="melogin.asp" target="_parent">登录</a>
                    <%else%>
                    <font color="#FFFFFF"><a href="meregister.asp" target="_parent"><%=session("txtUsername")%></a></font>
                    <%end if%>
				</div>
				</div>
		</div>
		
		<div class="box2_bg">
			<div class="box2">
			<div class="nav">
				<ul>
					<li class=""><a href="index.asp" target="_parent">首页</a></li>
					<li class=""><a href="newslist.asp?pid=2" target="_parent">观点</a></li><li class=""><a href="newslist.asp?pid=3" target="_parent">资讯</a></li><li class=""><a href="productlc.asp" target="_parent">理财</a></li><li class=""><a href="productbx.asp">保险</a></li></ul>
				<a href="jx.asp" class="contribute_btn" target="_parent"><span>合作/咨询</span></a>
			</div>
			</div >
		</div>
		 
	</div>