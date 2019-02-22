<?php
namespace app\admin\controller;
use think\Controller;
use think\db;//用数据库
use think\View;//用视图
use think\Session;//用session
use think\Request;//提交用
/****
----------后台公共控制器
****/
class Publics extends Controller
{
	public $view;///公共属性 保存运行成功的视图类
	public $db;//公共属性 保存运行成功的数据库类
	public $req;//公共属性 保存运行成功的提交类
	public $c;//  Admin/news/index  =>  news   控制器名
	public $m;//  Admin/news/index  =>  Admin  模块文件夹
	public $a;//  Admin/news/index  =>  index  控制器里面方法名
	public $prePage=1;//公共属性,分页，每页显示一条
	public $user_id;
	//公共标题库
	public $title=array(
	    'Adminuser'=>'管理员',
	    'Knowledge'=>'文章',
	    'Diary'=>'日记',
	    'User'=>'信息',
	    'Words'=>'碎言碎语',
	    'Msg'=>'留言',
	    'Pics'=>'图片',
	    'Friendlink'=>'友情链接',
	    'Comment'=>'评论',
	    'Video'=>'视频',
	    'Member'=>'视频',
	);
	//字段库,不显示与显示
	public $field=array(
	    'Adminuser' =>'email,password,error_times',
	    'Knowledge'   =>'description,content',
	    'Diary'=>'id,title,ctime,portrait',
	    'User'=>'id,real_name,name,position,qq,wechat,portrait',
	    'Words'=>'id,title,ctime',
	    'Msg'=>'id,message_user,email,ctime,is_reply',
	    'Pics'=>'id,pic_name,description,pic_url,ctime',
	    'Friendlink'=>'id,title,url,ctime',
	    'Video'=>'id,name,url,create_time',
	    'Member'=>'id,real_name,name,last_login',
	);
	//显示字段名
	public $item=array(
	    'Adminuser' =>array('管理员id','真实姓名','登录名','上次登录时间'),
	    'Knowledge'   =>array('id','标题','图片','时间','推荐','最新','阅读数','作者'),
	    'Diary'   =>array('标题','时间','图片'),
	    'User'   =>array('id','昵称','英文名字','职业','QQ','微信','头像'),
	    'Words'   =>array('id','标题','发布时间'),
	    'Msg'=>array('id','留言用户','留言邮箱','留言时间','回复状态'),
	    'Pics'=>array('图片名称','图片描述','图片','添加时间'),
	    'Friendlink'=>array('id','链接标题','链接地址','添加时间'),
	    'Comment'=>array('id','文章标题','评论人','评论时间','是否回复'),
	    'Video'=>array('id','视频名称','视频链接','添加时间','上传者'),
	    'Member'=>array('id','真实姓名','登录名','上次登录时间'),
	);
	/*后台公共控制器构造函数*/
	public function __construct()
	{
		$this->view=new View();//运行视图类，保存在公共属性view
		$this->db=new db\Query();//运行数据库类，保存在公共属性db
		$this->req=\think\Request::instance();
	    //查询出m,c,a
		$this->m = $this->req->module();
		$this->c = $this->req->controller();
		$this->a = $this->req->action();	
		
		//模板输出变量    $this->view->变量名=变量值
		$this->view->baseurl='http://localhost:8080/blogtest/public/';//公共变量：网站域名www.aa.com
		// $this->view->category=$this->getCategory('商品分类');
		// $this->view->category1=$this->getCategory('帮助分类');
		$this->view->adminnav=$this->getAdminNav();
		$this->view->c=strtolower($this->req->controller());
		
		//检查登录
		if($this->a != 'login' && $this->c != 'index'){
			$this->checklogin();
		}
		
		if(isset($_SESSION['think']['user'])){
			$this->user_id = $_SESSION['think']['user']['id'];
			$this->assign('user_id',$this->user_id);
		}
		// dump($_FILES);exit;
		if(!empty($_FILES)){
			  //判断上传的只有一副图片
			  if(count($_FILES)==1){
				  // echo 1;exit;
				   foreach($_FILES AS $k=>$v){
					   if($_FILES[$k]['error']==0 && $_FILES[$k]['error']!=4){
					       //执行单图上传
					       $_POST[$k]=$this->singleUpload($k);
					   }else{
						   $_POST[$k]=''; 
					   }
				   }
				   // dump($_POST);exit;
			  }else{
				  // echo 2;exit;
				   //如果多图和单图全部都在$_FILES
				   //先判断哪一个是单图，那一个多图
				   foreach($_FILES AS $k=>$v){				   
					   if(count($v['name'])>1){
						   foreach($_FILES[$k]['name'] AS $key=>$value){
							   if(empty($value)){  
								   $_POST[$k][]=array();
							   }else{
								   $_FILES['photos']=array(
								      'name'=>$_FILES[$k]['name'][$key],
									  'type'=>$_FILES[$k]['type'][$key],
									  'tmp_name'=>$_FILES[$k]['tmp_name'][$key],
									  'error'=>$_FILES[$k]['error'][$key],
									  'size'=>$_FILES[$k]['size'][$key],
								   );
								   $_POST[$k][]=$this->singleUpload('photos');
								   $_FILES['photos']=array();
							   }
                               
						   }
					   }else{
					       if($_FILES[$k]['error']!=4){
					          $_POST[$k]=$this->singleUpload($k);
						   }else{
							  $_POST[$k]=''; 
						   }	   
					   }
				   }
			  }	  
		}
	}
	
	public function check_log()
	{
		if($this->a != 'login'){
			$this->checklogin();
		}
	}
	
	//检查登录
	public function checklogin()
	{
		if($this->req->isAjax()){
			if(session('?user') == false){
				if($this->a != 'reg'){
					echo json_encode('no1');
					exit;
				}
			}
		}else{
			if(session('?user') == false){
				if($this->a != 'reg'){
					$this->error('请先登录','/admin/index/login');
				}
				
			}
		}
	}
	
	//检查权限
	function checkLevel(){
		//拿即将要访问的地址去查nav表拿到相关id
		$group = $this->db->name('adminmenu')->where(array(
			'fun'=>$this->c,
			'act'=>$this->a,
		))->find();
		// dump($group);exit;
		$scopearr = explode(',',session('AdminUser.admin_scope'));
		// dump($scopearr);exit;
		//查看id是否在允许操作的范围
		if(!in_array($group['id'],$scopearr)){		
			echo "<script>alert('没有权限操作');window.history.back();</script>";exit;
		}
    }

	
	/*
	  单图上传
	*/	
 	public function singleUpload($name){
		// 获取表单上传文件 例如上传了001.jpg
		$file = request()->file($name);
		
		// 移动到框架应用根目录/public/uploads/ 目录下
		if($file){
			$info = $file->move(ROOT_PATH . 'public/uploads');
			// dump($info);exit;
			if($info){
              				
			    // 成功上传后 获取上传信息
				// 输出  jpg  图片后缀
				//echo $info->getExtension().'<br/>';
				// 输出  保存路径
				//echo $info->getSaveName().'<br/>';
				// 输出 
				//echo $info->getFilename().'<br/>';  
			
			    
				return 'uploads/'.$info->getSaveName();
			}else{
				// 上传失败获取错误信息
				$this->error($file->getError());
			}
		}
	} 
	/*
	  多图上传
	*/
 	public function multiUpload($name){
		// 获取表单上传文件
		$files = request()->file($name);
		// dump($files);
		$res=array();
		foreach($files as $file){
			// 移动到框架应用根目录/public/uploads/ 目录下
			$info = $file->move(ROOT_PATH . 'public/uploads');
		    // dump($info);
			if($info){
				$res[]='uploads/'.$info->getSaveName();	
				// dump($res);exit;
			}else{
				// 上传失败获取错误信息
				$this->error($file->getError()); 
			}    
		}
		
		return implode(',',$res);
    } 
	
	//获取后台导航数据
	public function getAdminNav()
	{
		$adminnav = $this->db->name('adminmenu')->where(array(
			'isshow'=>1,
		))->order('sort asc')->select();
		return $adminnav;
	}
	
	//获取分类数据
	public function getCategory($cat_name){
		$result1=$this->db->name('category')->where(array(
	         'pid'=>0,
			 'cat_name'=>$cat_name
	    ))->order('id desc')->limit('')->select();
	   //拿第一层的id作为第二层分类的pid去查询
	    $result2=$this->db->name('category')->where(array(
	         'pid'=>$result1[0]['id'],
	   ))->order('id desc')->limit('')->select();
	    foreach($result2 AS $k=>$v){
		   //
		   $result3=$this->db->name('category')->where(array(
	         'pid'=>$v['id'],
	       ))->order('id desc')->limit('')->select();
		   $result2[$k]['sonCat']=$result3;
        }	   	   
		$html='';
		$html.='<div class="form-group">';
		$html.='<label>所属分类</label>';
			$html.='<select name="catid">';
				$html.='<option value="">...请选择...</option>';
				foreach($result2 AS $k=>$v){
				  $html.='<option value="'.$v['id'].'">'.$v['cat_name'].'</option>';
				  if(!empty($v['sonCat'])){
					    foreach($v['sonCat'] AS $key=>$value){
					       $html.='<option value="'.$value['id'].'">-----------'.$value['cat_name'].'</option>';
						}
				  }
				}
			$html.='</select>';
		$html.='</div>';							
		$html.='</div>';
		//返回组装的分类下拉
        return $html;		
	}
	
	public function formatIdArray($data)
	{
		foreach($data AS $k=>$v){
			$temp[$v['id']]=$v;
		}
		$data=$temp;
		return $data;
	}
	
	
}
