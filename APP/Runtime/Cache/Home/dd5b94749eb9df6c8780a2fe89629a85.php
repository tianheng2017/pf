<?php if (!defined('THINK_PATH')) exit();?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>setIntervalupdata</title>
<style>
	body{
		background-color:#fff;
		font-size:14px;
	}
	h3{
		font-size:60px;
		color:#eee;
		text-align:center;
		padding-top:30px;
		font-weight:normal;
	}
</style>
</head>

<body>


<iframe id="iframe1" width="200" height="500" src="<?php echo U('corem/hintervalupdata');?>"></iframe>


<p id="txt1"></p>
<script>
	setInterval(function(){
		//location.reload();
		
		var timestamp = Date.parse(new Date());
		
		document.getElementById("iframe1").src="<?php echo U('corem/hintervalupdata');?>?"+timestamp;
		
		document.getElementById("txt1").innerText="<?php echo U('corem/hintervalupdata');?>?"+timestamp+"    ";
	},1000*2);
	
	

	
	
</script>































</body>
</html>