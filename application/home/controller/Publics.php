<?php 
namespace app\home\controller;
use think\Controller;
use think\db;
use think\view;
use think\session;
use think\Request;


class Publics extends controller
{
	public $view;     //保存运行成功的视图
	public $db;       //保存运行成功的数据库
	public $req;      //保存运行成功的提交类
	public $nav;      //导航栏
	public $user;     //博主信息
	public $M;     //模块
	public $C;     //控制器
	public $A;     //操作方法
	public $perpage = 4;
	public $user_id;     //博主id
	
	public function __construct(){
		$this->view = new \think\View();      //实例化视图类
		$this->db = new \think\db\Query();    //实例化数据库类
		$this->req=\think\Request::instance();//实例化请求类
		
		if(isset($_GET['su'])){
			$this->view->user = $this->db->name('user')->where('id='.$_GET['su'])->find();
		}else{
			$this->view->user = $this->db->name('user')->where('id=1')->find();
		}

		$this->M = $this->req->Module();
		$this->C = $this->req->Controller();
		$this->A = $this->req->Action();
		// dump(session('user'));exit;
		
		$this ->view->baseurl = 'http://localhost:8080/blogtest/public/';//域名
		$this ->view->title = $this->view->user['real_name'].'的个人博客';//标题
		$this ->view->Vice_title = $this->view->user['real_name'].'的博客';//副标题
		$this ->view->side_title = $this->side_nav();
		$this ->view->nav = $this->get_nav();
		$this ->view->recommend_knowledge = $this->recommend_knowledge();
		$this ->view->new_knowledge = $this->new_knowledge();
		$this ->view->rand_knowledge = $this->rand_knowledge();
		$this ->view->friend_link = $this->get_link();



		
	}
	
	public function side_nav()
	{
		$side_title='';
		switch($this->A){
			case 'index':
			$side_title = '首页';
			break;
			case 'about':
			$side_title = '关于我';
			break;
			case 'shuo':
			$side_title = '视频收藏';
			break;
			case 'riji':
			$side_title = '个人日记';
			break;
			case 'xc':
			$side_title = '相册展示';
			break;
			case 'learn':
			$side_title = '学无止境';
			break;
			case 'learn_details':
			$side_title = '学无止境';
			break;
			case 'guestbook':
			$side_title = '留言板';
			break;
		}
		return $side_title;
	}
	//获取导航栏
	public function get_nav()
	{
		$nav = $this->db->name('nav')->where(array(
		    
		))->select();
		return $nav;
	}
	
	//查询右边推荐文章
	public function recommend_knowledge()
	{
		$rs = $this->db->name('knowledge')->where(array(
			'is_recommend'=>1,
		))->order('id desc')->limit(5)->select();
		return $rs;
	}
	
	//查询右边最新文章
	public function new_knowledge()
	{
		$rs = $this->db->name('knowledge')->where(array())->order('id desc')->limit(5)->select();
		// dump($rs);exit;
		return $rs;
	}
	
	//查询右边随机文章
	public function rand_knowledge()
	{
		$str_id = $this->get_rand_id();
		// dump($str_id);exit;
		$rs = $this->db->name('knowledge')->where(array(
			'id'=>array('in',$str_id),
		))->limit(5)->select();
		// dump($rs);exit;
		return $rs;
	}
	//获取随机文章的随机id
	function get_rand_id(){
		$rs = $this->db->name('knowledge')->field('id')->select();
		// dump($rs);die;
		if($rs){
			$arr_rand = array_rand($rs,5);
		}else{
			$arr_rand =array();
		}
		// dump($rs);
		// dump($arr_rand);die;

		//定义一个新数组
		$str = '';
		//编辑结果，把id全部放进数组中
		// $count = count($rs);
		// dump($arr_rand);exit;
		foreach($arr_rand as $k=>$v){
			foreach($rs as $k1=>$v1){
				if($v == $k1){
					$str.=$rs[$k1]['id'].',';
				}
			}
		}
		$str = substr($str,0,-1);
		// dump($str);exit;
		return $str;
		
	}

	//查询右边友情链接
	public function get_link()
	{
		$rs = $this->db->name('friendlink')->where(array('user_id'=>'1'))->order('id desc')->select();
		// dump($rs);exit;
		return $rs;
	}
	
}
	