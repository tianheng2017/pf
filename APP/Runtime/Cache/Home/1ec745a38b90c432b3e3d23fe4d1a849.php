<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
    <link href="/Public/home/wap/css/mui.min.css" rel="stylesheet">
	<script src="/Public/home/wap/js/mui.min.js"></script>
	 <script type="text/javascript" src="/Public/home/common/js/jquery-1.9.1.min.js" ></script>
    <script type="text/javascript" charset="utf-8">
      	mui.init();
    </script>
	<style>
		.body{
			line-height: px;
		}
		.mui-table-view-cell:after{
			left: 0px;
			background-color:#292828;
		}
		.mui-table-view:before{
			background-color:#292828;
		}
		.mui-table-view:after{
			background-color:#292828;
		}
		.mui-input-group:before{
			height:0px
		}
		.mui-input-group:after{
			height:0px;
		}
		.header{
			background:#fff;
			top:0;
			box-shadow:0 0px 0px #ccc;
			-webkit-box-shadow:0 0px 0px #ccc;
		}
		.h1{
			font-family:'微软雅黑';
			color: #000;
		}
		.form{
			height:0px;
			width:80%;
			left:0px;
			right:0px;
			margin: auto;
		}
		a{
			color:#000;
		}
		.mui-table-view-cell:after{
			background-color: unset;
			margin: 0 40px;
		}
		.mui-table-view:before{
			background-color: unset;
		}
		.mui-table-view:after{
			background-color: unset;
		}
		.mui-input-group .mui-input-row:after{
			background-color: unset;
		}
		.p{
			font-family:'微软雅黑';
			color:#000;
		}
		.div{
			border-radius:30px;
			background-color:#fff;
			border:1px solid #ccc;
		}
		.input{
			color:#0062CC;
			margin-left:50px;
			font-size: 0.9em;
			font-family:'微软雅黑';
		}
		.img{
			position:absolute;
			width:35px;
			margin-left:15px;
			margin-top:4px;
		}
		.button{
			line-height:2em;
			font-size:0.9em;
			width:100%;
			font-family:'微软雅黑';
			border-radius:30px;
			border:0px solid;
			background:#26C4FD;
			color:#fff;
		}
		li{
			list-style: none;
		}
	</style>
</head>
<body style="background:#f8f8f8;">
	<header class="mui-bar mui-bar-nav header">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title h1">提现</h1>
	</header>
	<div style="background: #fff;height: 415px;margin-top: 55px;">
		<form class="mui-input-group form"  name="AddUser" action="<?php echo U('Withdraw/drawup');?>" id="registerForm"  >
			<li class="mui-table-view-cell mui-collapse-content"><p class="p">收款银行(有问题请联系在线客服)</li>
			<div class="mui-input-row div">
				<img src="../Public/home/wap/images/nubmer.png"  class="img" />
				<input type="text"  name="way" value=""  class="input" placeholder="支付宝/微信/云闪付">
			</div>
			<li class="mui-table-view-cell mui-collapse-content"><p class="p">姓名</li>
			<div class="mui-input-row div">
				<img src="../Public/home/wap/images/nubmer.png" class="img" />
				<input type="text"  name="uname" value=""  class="input" placeholder="请输入提现姓名">
			</div>
			<li class="mui-table-view-cell mui-collapse-content"><p class="p">账号</li>
			<div class="mui-input-row div">
				<img src="../Public/home/wap/images/mima.png" class="img" />
				<input type="text"   name="account" value=""   style=" color: #0062CC; margin-top: 2px;margin-left: 50px; font-size: 0.9em; font-family: '微软雅黑';" placeholder="请输入提现账号">
			</div>
			<li class="mui-table-view-cell mui-collapse-content"><p class="p">金额</li>
			<div class="mui-input-row div">
				<img src="../Public/home/wap/images/nubmer.png" class="img" />
				<input type="number" name="price" value=""  class="input" placeholder="请输入提现金额">
			</div>
			<br/>
			<div class="mui-button-row">
				<button type="button" class="mui-btn button" id="submit"  onclick="setdraw()"   >提交</button>
			</div>
		</form>
	</div>
</body>
<script>
	mui.init({
		swipeBack: true //启用右滑关闭功能
	});
</script>
 <script type="text/javascript" src="/Public/home/common/js/jquery-1.9.1.min.js" ></script>
 <script type="text/javascript" src="/Public/home/common/layer/layer.js" ></script>
<script type="text/javascript">

    function setdraw(){
        //验证注册
        var thisform=document.forms['AddUser'];
        var   way=thisform.way.value;
        var   uname=thisform.uname.value;
        var   account=thisform.account.value;
        var   price=thisform.price.value;
		
        if(way=='' || way==null){
            layer.msg('请输入提现类型');
            return false;
        }
		if(uname=='' || uname==null){
            layer.msg('请输入提现人姓名');
            return false;
        }

		if(account=='' || account==null){
            layer.msg('请输入提现账号');
            return false;
        }
		if(price=='' || price==null){
            layer.msg('请输入提现金额');
            return false;
        }


        var post_url = $("form[name='AddUser']").attr('action');
        var post_data= $("form[name='AddUser']").serialize();
        $.ajax({
            type: "POST",
            url: post_url,
            data:post_data,
            dataType: "json",
            success: function(data){
                if(data.status==1){
                    layer.msg(data.msg);  //,data.url);
					setTimeout(function (args) {
						//window.location.href = "<?php echo U('Withdraw/index');?>";
					}, 3000); 
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }


</script>
</html>