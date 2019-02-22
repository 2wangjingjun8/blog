<?php
namespace app\admin\controller;

class Index extends Publics
{
    public function index()
    {
		// $this->checklogin();
		$data = $_POST;
		// var_dump($data);exit;
		//加载模板
		return $this->view->fetch('index',array(
            'title'=>'后台首页',		
	   ));
    }
	//管理员登录
    public function login()
    {
	     if($this->req->isAjax()){
			$data = $_POST;
			$return = array();
			$return['code'] = '101';
			//检查验证码是否正确
			if(!captcha_check($data['captcha'])){
				$return['msg'] = '验证码错误';
				return $return;
			}else{
				if($data['rem'] == 'ok'){
					//添加cookie
					setcookie("username",$data['name'],time()+3600);
					setcookie("password",md5($data['password']),time()+3600);
				}
				//检查用户名
				$rs = $this->db->name('user')->where(array(
					'name'=>$data['name'],
				))->find();
				if($rs){
					if($rs['password'] != md5($data['password'])){
							$return['msg'] = '密码错误';
							return $return;
					}else{
						$rs['last_login'] = date('Y-m-d H:i:s',$rs['last_login']);
						session('user',$rs);
						if($rs){
							$login['user_name'] = $data['name'];
							$login['login_time'] = time();
							$log = $this->db->name('log')->insert($login);
							$return['code'] = '100';
							$return['msg'] = '登录成功';
							$return['data'] = $rs;
							return $return;
						}else{
							$return['msg'] = '无法更新最后登录时间';
							return $return;
						}
						
					}
				}else{
					$return['msg'] = '用户名不存在';
					return $return;
				}
			}

		 }else{
		   return $this->view->fetch('login',array(
				'title'=>'博主登录',
		    ));
		 }
		
    }

    	//管理员注册
    public function reg()
    {
    	if ($this->req->isAjax()) {
    		$return = array();
			$return['code'] = '101';
    		$data = $_POST;
    		if(!captcha_check($data['captcha'])){
				$return['msg'] = '验证码错误';
				return $return;
			}else{
				unset($data['captcha']);
			}
			$data['password'] = md5($data['password']);
			$find_rs = $this->db->name('user')->where(array('name'=>$data['name']))->find();
			if($find_rs){
				$return['msg'] = '用户名已存在';
				return $return;
			}
    		// return $data;exit;
			$res = $this->db->name('user')->insert($data);
			if($res){
				$return['code'] = '100';
				$return['msg'] = '注册成功';
				return $return;

			}else{
				$return['msg'] = '注册失败';
				return $return;
			}

    	}
		return $this->view->fetch('reg',array(
						'title'=>'博主注册',
				    ));
    }

        	//用户修改密码
    public function change()
    {
    	if ($this->req->isAjax()) {
    		$return = array();
			$return['code'] = '101';
    		$data = $_POST;
			$data['oldpassword'] = md5($data['oldpassword']);
			$find_rs = $this->db->name('user')->where(array('id'=>$this->user_id))->find();

			if($find_rs){
				if($find_rs['password'] == $data['oldpassword']){
					//修改密码
					$update = $this->db->name('user')->where(array('id'=>$this->user_id))->update(array('password'=>md5($data['password'])));
					if(!$update){
						$return['msg'] = '修改失败';
						return $return;
					}else{
						$return['code'] = '100';
						$return['msg'] = '修改成功,请重新登陆';

						session('user',null);
						return $return;
					}
					

				}else{
					$return['msg'] = '原密码不正确';
					return $return;
				}
				$return['msg'] = '用户名已存在';
				return $return;
			}else{
				$return['msg'] = '用户名还没登陆';
				return $return;
			}


    	}
		return $this->view->fetch('change',array(
						'title'=>'修改密码',
				    ));
    }

	//管理员退出
    public function logout()
    {
		//更新这次的登录时间
		$res = $this->db->name('user')->where(array(
			'id'=>session('user.id')
		))->update(array(
			'last_login'=>time()
		));
		
		$login['user_name'] = session('user.name');
		$login['logout_time'] = time();
		$log = $this->db->name('log')->insert($login);
		
		session('user',null);
        $this->success('退出成功','admin/index/login');
    }
	
	//验证验证码是否正确
	function check_verify($code, $id = ''){
		$captcha = new Captcha();
		return $captcha->check($code, $id);
	}
}
