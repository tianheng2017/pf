<?php
namespace Home\Controller;
use http\Url;
use Think\Controller;
class IndexController extends CommonController
{
    public function index(){
//
//		$ulist = M('user')->order('zsy desc')->limit(10)->select();
//
//		foreach($ulist as $k=>&$v){
//			$v['username'] = $this->substr_cut($v['username']);
//		}
//
//
//
//		$num = count($ulist);
//
//		$this->assign('num',$num);
//		$this->assign('ulist',$ulist);
//        $this->display();
        $this->redirect('Index/qdgame');
    }
	
	public function substr_cut($user_name){
		$strlen     = mb_strlen($user_name, 'utf-8');
		$firstStr     = mb_substr($user_name, 0, 2, 'utf-8');
		$lastStr     = mb_substr($user_name, -2, 2, 'utf-8');
		return $strlen == 2 ? mb_substr($user_name, 0, 1, 'utf-8') . str_repeat('*', mb_strlen($user_name, 'utf-8') - 1) : $firstStr . "**" . $lastStr;
	}
	
	public function qdgame(){
		$userid = session('userid');
		$ulist = M('user')->where(array('userid'=>$userid))->find();
		$clist = M('system')->where(array('id'=>1))->find();
		if($ulist['money'] > 0){
		    //只能抢小于本金70%的单子
			$max_pipeinone = $ulist['money'] * ($clist['qd_cf']  / 100);
		}else{
			$max_pipeinone = 0;
		}
		$tarr = explode(',',$clist['qd_ndtime']);
		/*******刷新一次更改一次，不行*******/
		/* $st = in_array($h,$tarr);
		
		$nd = explode(',',$clist['qd_nd']);
		
		$num = count($nd);
		$key = rand(0,$num-1);	
		if($st){
			$key = rand(0,$num-1);
			if($key=='' || $key == 0){
				$key = '0';
			}
			if($m > 0 && $m <= 59){
				$tkey = $key;
			}
			$qd_yjjc = $nd[$tkey];
		}else{
			$qd_yjjc = '0';
		}  */
		
		/******只能手动后台更改了*****/
		
		$this->assign('tarr',$tarr);
		$this->assign('qd_nd',$clist['qd_nd']);
		$this->assign('qd_yjjc',$clist['qd_yjjc']);
		$this->assign('max_pipeinone',$max_pipeinone);
		$this->display();		
	}
	public function shoudan(){
		$userid = session('userid');
		$where['pipeitime'] = array('gt',strtotime(date("Y-m-d 00:00:00",time())));
		$slist = M('userrob')->where(array('uid'=>$userid,'status'=>2))->where($where)->order('id desc')->select();
		$flist = M('userrob')->where(array('uid'=>$userid,'status'=>3))->where($where)->order('id desc')->select();
		$dlist = M('userrob')->where(array('uid'=>$userid,'status'=>4))->where($where)->order('id desc')->select();
		$this->assign('slist',$slist);
		$this->assign('flist',$flist);
		$this->assign('dlist',$dlist);
		$this->display();	
	}
	
	//会员抢单详请
	public function qiangdanxq(){
		if($_GET){
			$userid = session('userid');
			$ulist = M('user')->where(array('userid'=>$userid))->find();
			$id = trim(I('get.id'));
			$olist = M('userrob')->where(array('id'=>$id,'uid'=>$userid))->find();
			$ewmlist = M('ewm')->where(array('uid'=>$userid,'ewm_price'=>$olist['price'],'ewm_class'=>$olist['class']))->find();
			$this->assign('olist',$olist);
			$this->assign('ewmlist',$ewmlist);
			if($olist['status']==2){
				$orderconfig = M('orderconfig')->where(array('id'=>1))->find();
				//paypipeiouttime 支付匹配超时时间/s		 payouttime 支付超时时间/s 
				$this->assign('orderconfig',$orderconfig);
				$ntime = time();
				$this->assign('ntime',$ntime);
				$timeed = $ntime-$olist['pipeitime'];
				if($timeed>=$orderconfig['payouttime']){
					$uuserrob = M('userrob')->where(array('id'=>$id,'status'=>2))->save(array('status'=>4,'finishtime'=>$ntime,'hasfalistate'=>-1)); //修改定单状态
					if($uuserrob){
						$uroborder = M('roborder')->where(array('id'=>$olist['ppid'],'status'=>2))->save(array('status'=>4,'finishtime'=>$ntime)); //修改后台发布的订单状态
						if($uroborder){
							header('Location: /Index/qdgame.html');exit;
						}else{
							$this->error('未知错误'); 
						}
					}else{
						$this->error('未知错误'); 
					}
				}
				
				$this->assign('stimev',$orderconfig['payouttime']-$timeed);

				$this->display('qiangdanxq2');
			}else{
				$this->display();
			}
		}else{
			$this->error('未知错误',U('Index/shoudan'));
		}
		
	}
	
	
	
	public function getqiangdanxqdata(){
		$data = array();
		$data['state'] = 0;
		if($_GET){
			
			
			$userid = session('userid');
			$id = trim(I('get.id'));
			$olist = M('userrob')->where(array('id'=>$id,'uid'=>$userid))->find();
			if($olist){
				$data['state'] = 1;
				$data['data']['status'] = $olist['status'];
			}
			
		}else{
			
		}
		
		print_r(json_encode($data,true));
	}
	
	
	public function shoudaning(){
		$userid = session('userid');
		$where['status'] = array('not in','3,4,5');
		$where['uid'] =$userid;
		$ond = M('userrob')->where($where)->find();
		
		if($ond){
			header('Location: /Index/qiangdanxq/id/'.$ond['id'].'.html');
		}else{
			header('Location: /Index/qdgame.html');exit;
		}
	}

	//确认订单接口
	public function setsuccessorderdo(){
		if($_POST){
			$id=trim(I('post.id'));
			$userid = session('userid');
			$list = M('userrob')->where(array('id'=>$id,'uid'=>$userid))->find();
			if($list){
				if($list['status']==2){
					$ntime = time();
					$pipeilist = M('roborder')->where(array('id'=>$list['ppid']))->find();//被 匹配的订单
					$ulist =  M('user')->where(array('userid'=>$list['uid']))->find();
					$clist = M('system')->where(array('id'=>1))->find();
					$yjbl = 0; //支付类型佣金比例 
					$yjjc = $list['yjjc']; //当前佣金加成
					if($list['class'] ==1){
						$yjbl = $clist['qd_wxyj'];
						$str = '微信抢单';
					}elseif($list['class'] ==2){
						$yjbl = $clist['qd_zfbyj'];
						$str = '支付宝抢单';
					}elseif($list['class'] ==3){
						$yjbl = $clist['qd_bkyj'];
						$str = '银行卡抢单';
					}
					$yjbl = $yjbl + $yjjc;//实际佣金比例
					$yj_money = $list['price'] * $yjbl; //实际的佣金金额
					$mdst_re = M('userrob')->where(array('id'=>$id,'status'=>2))->save(array('status'=>3,'finishtime'=>$ntime)); //修改定单状态
					$rob_mdst = M('roborder')->where(array('id'=>$list['ppid'],'status'=>2))->save(array('status'=>3,'finishtime'=>$ntime)); //修改后台发布的订单状态
					if($mdst_re && $rob_mdst){
						$udec_re = M('user')->where(array('userid'=>$list['uid']))->setInc('money',$yj_money); //金额
						$zsy_re = M('user')->where(array('userid'=>$list['uid']))->setInc('zsy',($list['price']+$yj_money)); //记录匹配收款和佣金
						if($udec_re && $zsy_re){
								$billdec['uid'] = $ulist['userid'];
								$billdec['jl_class'] = 5; //抢单
								$billdec['info'] = $str.'本金'; 
								$billdec['addtime'] = $ntime; 
								$billdec['jc_class'] = '-'; 
								$billdec['num'] = $list['price'];
								$billdec_re = M('somebill')->add($billdec);
								$billinc['uid'] = $ulist['userid'];
								$billinc['jl_class'] = 1; //佣金类型
								$billinc['info'] = $str.'佣金'; 
								$billinc['addtime'] = $ntime; 
								$billinc['jc_class'] = '+'; 
								$billinc['num'] = $yj_money;
								$billinc_re = M('somebill')->add($billinc);
								if($billdec_re && $billinc_re){
									$oneuser = M('user')->where(array('userid'=>$ulist['pid']))->find();//上一代
									//一代佣金奖励
									if(!empty($oneuser)){
										$oneyj_money = $yj_money * $clist['team_oneyj']; //上一代佣金
										$puser_inc_re = M('user')->where(array('userid'=>$ulist['pid']))->setInc('money',$oneyj_money);
										if($puser_inc_re){							
											$puser_bill['uid'] = $oneuser['userid'];
											$puser_bill['jl_class'] = 1; //佣金类型
											$puser_bill['info'] = '直推抢单成功佣金'; 
											$puser_bill['addtime'] = $ntime; 
											$puser_bill['jc_class'] = '+'; 
											$puser_bill['num'] = $oneyj_money;
											M('somebill')->add($puser_bill);
										}
										$twouser = M('user')->where(array('userid'=>$oneuser['pid']))->find();//上二代
										if(!empty($twouser)){
											$twoyj_money = $yj_money * $clist['team_twoyj']; //二代佣金
											$twouser_inc_re = M('user')->where(array('userid'=>$oneuser['pid']))->setInc('money',$twoyj_money);
											if($twouser_inc_re){
												$twouser_bill['uid'] = $twouser['userid'];
												$twouser_bill['jl_class'] = 1; //佣金类型
												$twouser_bill['info'] = '二代抢单成功佣金'; 
												$twouser_bill['addtime'] = $ntime; 
												$twouser_bill['jc_class'] = '+'; 
												$twouser_bill['num'] = $twoyj_money;
												M('somebill')->add($twouser_bill);
											}
											$threeuser = M('user')->where(array('userid'=>$twouser['pid']))->find();//上三代
											if(!empty($threeuser)){
												$threeyj_money = $yj_money * $clist['team_threeyj']; //三代佣金
												$threeuser_inc_re =  M('user')->where(array('userid'=>$twouser['pid']))->setInc('money',$threeyj_money);
												if($threeuser_inc_re){
													$threeuser_bill['uid'] = $threeuser['userid'];
													$threeuser_bill['jl_class'] = 1; //佣金类型
													$threeuser_bill['info'] = '三代抢单成功佣金'; 
													$threeuser_bill['addtime'] = $ntime; 
													$threeuser_bill['jc_class'] = '+'; 
													$threeuser_bill['num'] = $threeyj_money;
													M('somebill')->add($threeuser_bill);
												}
											}
										}
									}
									/*********************这里添加打款成功短信提示***********************/
									/*********************回调通知***********************/
									$orderidpw = $list['ordernum'];
									$app_id = "15111115548446";
									$app_secret = "csd8w9sf65sd4f4sd61sdf5asdsdewffg1rh1tik8khjmg";
									$token = md5($app_id.$orderidpw.$app_secret);
									$dataarr = array(
										"orderidpw" => $orderidpw,
										"token" => $token
									);
									$purl = 'http://payshow1.xiangxin.me/pay/index.php/spay/notify';
									function sendHttpPostCurl($url, $data = null, $header = null, $referer = null)
									{
										$ch = curl_init();
										curl_setopt($ch, CURLOPT_TIMEOUT, 30);
										curl_setopt($ch, CURLOPT_URL, $url);
										if ($header) {
											curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
										}
										if ($referer) {
											curl_setopt($ch, CURLOPT_REFERER, $referer);
										}
										if ($data) {
											curl_setopt($ch, CURLOPT_POST, 1);
											curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
										} else {
											curl_setopt($ch, CURLOPT_POST, false);
										}
										if (stripos($url, 'https://') !== false) {
											curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);   // 跳过证书检查
											curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);   // 从证书中检查SSL加密算法是否存在
										}
										//  curl_setopt($ch, CURLOPT_HTTPHEADER, array('Expect:'));   //避免data数据过长问题
										curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
										$res = curl_exec($ch);
										if ($error = curl_error($ch)) {
											return "Error:404";
											/*
											echo '=====info=====' . "\r\n";
											print_r(curl_getinfo($ch));
											echo '=====error=====' . "\r\n";
											print_r(curl_error($ch));
											echo '=====$response=====' . "\r\n";
											print_r($res);
											die($error);
											*/
										}
										curl_close($ch);
										return $res;
									}
									$result = sendHttpPostCurl($purl,$dataarr);
									$data['status'] = 1;
									$data['msg'] = '确认成功';
									$this->ajaxReturn($data);exit;
								}else{
									$data['status'] = 0;
									$data['msg'] = '未知错误';
									$this->ajaxReturn($data);exit;
								}
						}else{
							$data['status'] = 0;
							$data['msg'] = '未知错误';
							$this->ajaxReturn($data);exit;
						}
					}else{
						
						$data['status'] = 0;
						$data['msg'] = '未知错误';
						$this->ajaxReturn($data);exit;
					}
				}else{
					$data['status'] = -2;
					$data['msg'] = '该订单已结束';
					$this->ajaxReturn($data);exit;
				}
			}else{
				$data['status'] = 0;
				$data['msg'] = '订单不存在';
				$this->ajaxReturn($data);exit;
			}
		}
	}

	//生成抢单订单
	public function pipeiorder(){
		if($_POST){
			$qdclass=trim(I('post.qdclass'));
			$userid = session('userid');
			$ulist = M('user')->where(array('userid'=>$userid))->find();
			$clist = M('system')->where(array('id'=>1))->find();
			if($ulist['rz_st'] != 1){
				$data['status'] = 0;
				$data['msg'] = '请先完善资料';
				$this->ajaxReturn($data);exit;
			}
			if($ulist['tx_status'] != 1){
				$data['status'] = 0;
				$data['msg'] = '您的账号被管理员禁止抢单';
				$this->ajaxReturn($data);exit;
			}
			if($ulist['money'] > 0){
			    //可抢单金额不能高于余额的70%
				$max_pipeinone = $ulist['money'] * ($clist['qd_cf']  / 100);
			}else{
				$max_pipeinone = 0;
			}
			//如果可抢单金额低于系统设置的最低抢单额度
			if($max_pipeinone < $clist['qd_minmoney']){
				$data['status'] = 0;
				$data['msg'] = '最低抢单额度为'.$clist['qd_minmoney'];
				$this->ajaxReturn($data);exit;
			}
			/****需要添加一个未完成订单限制*******/
			$where['status'] = array('not in','3,4,5');
			$where['uid'] =$userid;
			$no_count = M('userrob')->where($where)->count();
			if($no_count){
				$data['status'] = 11;
				$data['msg'] = '您当前有一条匹配订单正在进行中';
				$this->ajaxReturn($data);exit;
			}
			/********************/
			$count_qrnum = M('ewm')->where(array('uid'=>$userid,'ewm_class'=>$qdclass,'state'=>1))->count();
			if($qdclass == 1){
				$str = '微信收款二维码';
			}elseif($qdclass== 2){
				$str = '支付宝收款二维码';
			}elseif($qdclass==3){
				$str = '银行收款二维码';
			}
			if($count_qrnum < 1){
				$data['status'] = 0;
				$data['msg'] = '您没有上传'.$str;
				$this->ajaxReturn($data);exit;
			}
			$orderconfig = M('orderconfig')->where(array('id'=>1))->find();
			//paypipeiouttime 支付匹配超时时间/s		 payouttime 支付超时时间/s
			$ntime = time();
			/*********这里需要区分直接匹配成功，和后台没有发布订单时的排队匹配两种情况********/
			$orderlist = M('roborder')->where(array('class'=>$qdclass,'status'=>1))->order('price asc')->select();
			if(!empty($orderlist)){//后台有符合条件的待匹配订单，生成一条直接匹配好的记录。
				//符合条件的最小额度的记录为$orderlist[0],所以直接匹配最小的这一条，如果最小金额的都不够匹配，同样也生成一条匹配记录，提示等待(不采用)				
				//这里写业务
				//循环匹配收款二维类型及金额都符合则匹配成功
				$ewmlist = M('ewm')->where(array('uid'=>$userid,'ewm_class'=>$qdclass,'state'=>1))->select();
				foreach($orderlist as $k=>$v){
					if($ulist['money'] >= $v['price'] && $v['addtime']>$ntime-$orderconfig['paypipeiouttime'] && $v['uponlinetime']>$ntime-$orderconfig['payonlineouttime']){
						foreach($ewmlist as $val){
							if($v['price'] == $val['ewm_price']){
								$st = 1;
								$pid = $v['id'];
								break;
							}
						}
					}
				}
				if($st == '' || $st ==0){
					$pipeist = 0;
				}elseif($st == 1){
					$pipeist = 1;
				}
				if($pipeist == 1){//匹配成功更新后台发布的订单/生成一条匹配成功的会员匹配记录  同时减去会员账号余额，且加上佣金'qd_yjjc' 生成日录(确认后做这些操作)
					$tolist = M('roborder')->where(array('id'=>$pid))->find();//被匹配的这一条记录
					if($ulist['money'] < $tolist['price']){
						$data['status'] = 5;
						$data['msg'] = '空';
						$this->ajaxReturn($data);exit;
					}
					$uproborders2 = M('roborder')->where(array('id'=>$pid,'status'=>1))->save(array('status'=>2)); //修改定单状态
					if($tolist['status'] == 1 && $uproborders2){
						//判断是否额度够
						if($ulist['money'] >= $tolist['price'] && $tolist['price']>0){
							$udec_re = M('user')->where(array('userid'=>$userid))->setDec('money',$tolist['price']); //减去金额
							if($udec_re){
								$psave['uid'] = $userid;
								$psave['uname'] = $ulist['truename'];
								$psave['umoney'] = $ulist['money'];
								$psave['pipeitime'] = $ntime;
								//$psave['status'] = 2;
								$pipei_re = M('roborder')->where(array('id'=>$pid,'status'=>2))->save($psave);
								if($pipei_re){
									$updata['uid'] = $userid;
									$updata['class'] = $qdclass;
									$updata['price'] = $tolist['price'];
									$updata['yjjc'] = $clist['qd_yjjc'];
									$updata['umoney'] = $ulist['money'];
									$updata['uaccount'] = $ulist['account'];
									$updata['uname'] = $ulist['truename'];
									$updata['ppid'] = $pid;
									$updata['status'] = 2;
									$updata['addtime'] = $ntime;
									$updata['pipeitime'] = $ntime;
									$updata['ordernum'] = $tolist['ordernum'];
									$updata['hasfalistate'] = -1;
									$up_re = M('userrob')->add($updata);
									if($up_re){
										$data['status'] = 1;
										$data['msg'] = '匹配成功';
										$this->ajaxReturn($data);exit;
									}else{
										$data['status'] = 0;
										$data['msg'] = '未知错误';
										$this->ajaxReturn($data);exit;
									}
								}else{
									$data['status'] = 0;
									$data['msg'] = '未知错误';
									$this->ajaxReturn($data);exit;
								}
							}else{
								$data['status'] = 0;
								$data['msg'] = '未知错误';
								$this->ajaxReturn($data);exit;
							}
						}else{
							$data['status'] = 5;
							$data['msg'] = '空';
							$this->ajaxReturn($data);exit;
						}
					}else{
						$data['status'] = 5;
						$data['msg'] = '空';
						$this->ajaxReturn($data);exit;
					}
				}else{
					$data['status'] = 5;
					$data['msg'] = '空';
					$this->ajaxReturn($data);exit;
				}
			}else{//后台没有符合条件的单则生成一条记录，提示等待
				$data['status'] = 5;
				$data['msg'] = '空';
				$this->ajaxReturn($data);exit;
			}
		}else{
			$data['status'] = 0;
			$data['msg'] = '非法操作';
			$this->ajaxReturn($data);exit;
		}
	}
	
	
	public function pipeiauto(){
		if($_POST){
			$data['status'] = 0;
			$data['msg'] = '抢单业务繁忙！';
			$this->ajaxReturn($data);exit;
		}else{
			$data['status'] = 0;
			$data['msg'] = '非法操作';
			$this->ajaxReturn($data);exit;
		}
	}
}