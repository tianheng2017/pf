<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="generator" content="CoreThink">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-title" content="<?php echo C('WEB_SITE_TITLE');?>">
    <meta name="format-detection" content="telephone=no,email=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="apple-touch-icon" type="image/x-icon" href="/favicon.ico">
    <link rel="shortcut icon" type="image/x-icon" href="/logo.png">
    <link rel="stylesheet" type="text/css" href="/Public/libs/lyui/dist/css/lyui.min.css">
    <link rel="stylesheet" type="text/css" href="/APP/Admin/View/Public/css/admin.css">
    
    <link rel="stylesheet" type="text/css" href="/Public/libs/lyui/dist/css/lyui.extend.min.css">
    <link rel="stylesheet" type="text/css" href="/APP/Admin/View/Public/css/style.css">

    <!--[if lt IE 9]>
        
        
    <![endif]-->
    <script type="text/javascript" src="/Public/libs/jquery/1.x/jquery.min.js"></script>
     <link rel="stylesheet" href="/Public/plugin/themes/default/default.css" />
    <script charset="utf-8" src="/Public/plugin/kindeditor-min.js"></script>
    <script charset="utf-8" src="/Public/plugin/lang/zh_CN.js"></script>

    <!-- 日期 -->
    <script type="text/javascript" src="/Public/libs/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="/Public/libs/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <!-- 日期js cs -->
    <link href="/Public/libs/datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css">
    <link href="/Public/libs/datetimepicker/css/dropdown.css" rel="stylesheet" type="text/css">

</head>
<!-- <body class="admin_index_index"> -->
<body class="admin_config_group" >
    <div class="clearfix full-header">
        
                <!-- 顶部导航 -->
                <div class="navbar navbar-default navbar-fixed-top main-nav" role="navigation">
                    <div class="container-fluid">
                        <div>
                            <div class="navbar-header navbar-header-inverse">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-top">
                                    <span class="sr-only">切换导航</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" target="_blank" href="/">
                                    <span><b><span style="color: #2699ed;">后台管理</span></b></span>
                                </a>
                            </div>
                            <div class="collapse navbar-collapse navbar-collapse-top">
                                <ul class="nav navbar-nav">
                                    <!-- 主导航 -->
                                    <li <?php if (CONTROLLER_NAME=='Index') { echo "class='active'"; } ?> ><a href="<?php echo U('Admin/Index/index');?>"><i class="fa fa-home"></i> 首页</a></li>
                                    <?php if(is_array($_menu_list_g)): foreach($_menu_list_g as $key=>$g_val): ?><li <?php if ($_menu_tab['gid']==$g_val['id'] && CONTROLLER_NAME!='Index') { echo "class='active'"; } ?> >
                                    <a href="<?php if($g_val['col'] && $g_val['act']) echo U('Admin/'.$g_val['col'].'/'.$g_val['act']); ?>" target="">
                                        <i class="fa <?php echo ($g_val['icon']); ?>"></i>
                                        <span><?php echo ($g_val["name"]); ?></span>
                                    </a>
                                    </li><?php endforeach; endif; ?>                                                  
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="<?php echo U('Admin/Index/removeRuntime');?>" style="border: 0;text-align: left" class="btn ajax-get no-refresh"><i class="fa fa-trash"></i> 清空缓存</a></li>
                                    <li><a target="_blank" href="/"><i class="fa fa-external-link"></i> 打开前台</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-user"></i> <?php echo ($_user_auth["username"]); ?> <b class="caret"></b>
                                        </a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a target="_blank" href="/"><i class="fa fa-external-link"></i> 打开前台</a></li>
                                            <li><a href="<?php echo U('Admin/Index/removeRuntime');?>" style="border: 0;text-align: left;" class="btn text-left ajax-get no-refresh"><i class="fa fa-trash"></i> 清空缓存</a></li>
                                            <li><a href="<?php echo U('Admin/Pubss/logout');?>" class="ajax-get"><i class="fa fa-sign-out"></i> 退出</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
        
    </div>

    <div class="clearfix full-container" id="full-container">
        
            <input type="hidden" name="check_version_url" value="<?php echo U('Admin/Update/checkVersion');?>">
            <div class="container-fluid with-top-navbar" style="height: 100%;overflow: hidden;">
                <div class="row" style="height: 100%;">
                    <!-- 后台左侧导航 S-->
                    <div id="sidebar" class="col-xs-12 col-sm-3 sidebar tab-content">
                        <!-- 模块菜单 -->
                        <nav class="navside navside-default" role="navigation">
                            <?php if($_menu_list_p): ?>
                                <ul class="nav navside-nav navside-first">
                                    <?php if(is_array($_menu_list_p)): $fkey = 0; $__LIST__ = $_menu_list_p;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$_ns_first): $mod = ($fkey % 2 );++$fkey;?><li>
                                            <a data-toggle="collapse" href="#navside-collapse-<?php echo ($_ns_first["id"]); ?>-<?php echo ($fkey); ?>">
                                                <i class="<?php echo ($_ns_first["icon"]); ?>"></i>
                                                <span class="nav-label"><?php echo ($_ns_first["name"]); ?></span>
                                                <span class="angle fa fa-angle-down"></span>
                                                <span class="angle-collapse fa fa-angle-left"></span>
                                            </a>
                                            <?php if(!empty($_menu_list_c)): ?><ul class="nav navside-nav navside-second collapse in" id="navside-collapse-<?php echo ($_ns_first["id"]); ?>-<?php echo ($fkey); ?>">
                                                    <?php if(is_array($_menu_list_c)): $skey = 0; $__LIST__ = $_menu_list_c;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$_ns_second): $mod = ($skey % 2 );++$skey; if(($_ns_first['id']) == $_ns_second['pid']): ?><li <?php  if(!empty($_select_url) && strtolower($_ns_second['col'].'-'.$_ns_second['act'])== $_select_url) echo 'class="active"'; elseif(empty($_select_url) && $_ns_second['col'] == CONTROLLER_NAME) echo 'class="activea"'; ?>>
                                                            <a href="<?php echo U($_ns_second['col'].'/'.$_ns_second['act']); ?>" >
                                                                <i class="<?php echo ($_ns_second["icon"]); ?>"></i>
                                                                <span class="nav-label"><?php echo ($_ns_second["name"]); ?></span>
                                                            </a>
                                                        </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                                                </ul><?php endif; ?>
                                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                                </ul>
                            <?php endif; ?>
                        </nav>
                    </div>
                    <!-- 后台左侧导航 E-->

                    <!-- 右侧内容 S-->
                    
   <div id="main" class="col-xs-12 col-sm-9 main" style="overflow-y: scroll;">
        <ul class="breadcrumb">
            <li><i class="fa fa-map-marker"></i></li>

            <li class="text-muted">商品管理 /  商品编辑</li>

        </ul>

        <!-- 主体内容区域 -->
        <div class="tab-content ct-tab-content">
            <div class="panel-body">
                <div class="builder formbuilder-box">
                    <div class="form-group"></div>
                    <div class="builder-container" >
                            <div class="row" >
                                <div class="col-xs-12">
                                    <form action="/Admin/User/shopedit/id/77.html" method="post" class="form-horizontal form form-builder" enctype="multipart/form-data">
                                        <div class="form-type-list">
                                            <div class="form-group hidden item_id ">
                                                <label class="left control-label">ID号：</label>
                                                <div class="right">
                                                    <input type="hidden" class="form-control input" readonly="readonly" name="id" value="<?php echo ($info["id"]); ?>" />
                                                </div>
                                            </div>
                                            
                                            <div class="form-group item_title ">
                                                <label class="left control-label">商品名称：</label>
                                                <div class="right">
                                                    <input type="text" name="name" class="form-control input" value="<?php echo ($info["name"]); ?>"/>
                                                </div>
                                            </div>
                                            <div class="form-group item_title ">
                                                <label class="left control-label">商品价格：</label>
                                                <div class="right">
                                                    <input type="text" class="form-control input" name="price" value="<?php echo ($info["price"]); ?>" />
                                                </div>
                                            </div>
                                            <div class="form-group item_title ">
                                                <label class="left control-label">商品图片：</label>
                                                <div class="right">
                                                    <div class="mui-card-content erweima">
                                                        <div class="opiniontop_d" style=" background: none;width: 80%;margin: 5px auto 0 auto;height:170px; border-radius:5px;">
                                                            <div class="clear oneimg" style="width:100%;height:100%;color:#000;padding:10px 5px;">
                                                                <div id="filelist1" class="files fl" style="margin: 15% auto;">
                                                                     <span id="filePicker1" class="file-btn webuploader-container">
                                                                        <div class="webuploader-pick">
                                                                            <img src="<?php echo ($info["img"]); ?>" id="img1" onload="setImgWH(this)" />
                                                                        </div>
                                                                        <div id="rt_rt_1cvagj2mr16sv1dg91skisdj1qfr1" style="position: absolute; top: 0px; left: 0px; width: 120px; height: 100%; overflow: hidden; bottom: auto; right: auto;display:none;">
                                                                            <input type="file" name="file" class="webuploader-element-invisible" accept="image/jpg,image/gif,image/png,image/jpeg">
                                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
                                                                        </div>
                                                                    </span>
                                                                    <input type="hidden" name="icon" id="icon" value="">
                                                                    <input type="hidden" name="ewmclass" id="ewmclass" value="1">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="form-group"></div>
                                        <div class="form-group bottom_button_list">
                                            <label class="left control-label"></label>
                                            <div class="right">
                                                <button class="btn btn-danger return" type="submit">提交</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>    
                        </div>
                    </div>
                </div>
        </div>
    </div>                   
</div>

                    <!-- 右侧内容 E-->
                    
                </div>


            </div>
        

    </div>

    <div class="clearfix full-footer">
        
    </div>

    <div class="clearfix full-script">
        <div class="container-fluid">
            <input type="hidden" id="corethink_home_img" value="__HOME_IMG__">
            <script type="text/javascript" src="/Public/libs/lyui/dist/js/lyui.min.js"></script>
            <script type="text/javascript" src="/APP/Admin/View/Public/js/admin.js"></script>
            
    <script type="text/javascript" src="/Public/libs/lyui/dist/js/lyui.extend.min.js"></script>
    <script type="text/javascript" src="/Public/home/common/js/public.js" ></script>
    <script type="text/javascript" src="/Public/home/common/js/Uploader.swf" ></script>
    <script type="text/javascript" src="/Public/home/common/js/webuploader.js" ></script>
    <script type="text/javascript">
        var UPLOAD_URL = "/Home/User/uploadfile";
        var SWF_URL = '/Public/js/Uploader.swf';
        $(function () {
            upload1();
        });
    </script>
    <script>
        function changepic() {
            var reads= new FileReader();
            f=document.getElementById('upload').files[0];
            reads.readAsDataURL(f);
            reads.onload=function (e) {
                document.getElementById('show').src=this.result;
            };
        }
    </script>

        </div>
    </div>
</body>
</html>