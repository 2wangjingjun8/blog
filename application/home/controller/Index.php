<?php 
namespace app\home\controller;

class Index extends Publics
{
	//首页信息
	public function index(){
		$rs = $this->db->name('knowledge')
		->alias('bk')
		->join('blog_user bu','bk.user_id=bu.id')
		->field('bk.*,bu.real_name')
		->where(array(
			'bk.is_recommend'=>1,
			// 'user_id'=>$this->view->user['id']
		))->order('bk.id desc')->paginate($this->perpage,false,[
			'query'=>$this->req->param(),
			'type'=>'Npage',
		]);
		$list = $rs->items();
		// dump($list);exit;
		// dump($rs->render());exit;
		foreach($list as $k=>$v){
			$list[$k]['ctime'] = date('Y-m-d',$v['ctime']);
		}
		$html = '';
		foreach($list as $k=>$v){
			           $html .= '<div class="wz">';
			            $html .= '<h3><a class="knowledge" iddata="'.$v['id'].'" href="'.url('learn_details',['id'=>$v['id'],'user_id'=>$v['user_id']]).'" title="'.$v['title'].'">'.$v['title'].'</a></h3>';
			             $html .= '<dl>';
			               $html .= '<dt><img src="'.$v['portrait'].'" width="200"  height="123" alt=""></dt>';
			               $html .= '<dd>';
			                 $html .= '<p class="dd_text_1">'.$v['description'].'</p>';
			               $html .= '<p class="dd_text_2">';
			               $html .= '<span class="left author">'.$v['real_name'].'</span><span class="left sj">时间:'.$v['ctime'].'</span>';
			               $html .= '<span class="left fl">阅读数: '.$v['hits'].'</span><span class="left yd"><a class="knowledge" iddata="'.$v['id'].'" href="home/index/learn_details?id='.$v['id'].'&su='.$v['user_id'].'" title="阅读全文">阅读全文</a>';
			               $html .= '</span>';
			                $html .= '<div class="clear"></div>';
			               $html .= '</p>';
			               $html .= '</dd>';
			               $html .= '<div class="clear"></div>';
			             $html .= '</dl>';
			            $html .= '</div>';
		}
		if($this->req->isAjax()){
			// echo 2;
			$result['page'] = $rs->render();
			$result['html'] = $html;
			return $result;
		}else{
			// echo 1;
			// dump($html);exit;
			return $this->fetch('index',array(
				'page'=>$rs->render(),
				'html'=>$html,
			));
		}
	}
	//关于我
	public function about(){
		return $this->fetch('about',array(
			
		));
	}
	//碎言碎语
	public function shuo(){
		$rs = $this->db->name('video')->order('id desc')->where(array('user_id'=>$this->view->user['id']))->paginate($this->perpage=3,false,[
			'query'=>$this->req->param(),
			'type'=>'Npage',
		]);
		$list = $rs->items();
		foreach($list as $k=>$v){
			$list[$k]['create_time'] = date('Y-m-d',$v['create_time']);
		}
	

		// dump($list);exit;
		return $this->fetch('shuo',array(
			'rs'=>$list,
			'page'=>$rs->render(),
		));
	}
	//个人日记
	public function riji(){
		$rs = $this->db->name('diary')->where(array('user_id'=>$this->view->user['id']))->order('id desc')->paginate($this->perpage=4,false,[
			'query'=>$this->req->param(),
			'type'=>'Npage',
		]);
		$list = $rs->items();
		foreach($list as $k=>$v){
			$list[$k]['ctime'] = date('Y-m-d',$v['ctime']);
		}
		$html = '';
		foreach($list as $k=>$v){
              $html .= '<div class="shiguang animated bounceIn">';
                $html .= '<div class="left sg_ico">';
                $html .= '<img src="'.$v['portrait'].'" width="120" height="120" alt=""/>';
                $html .= '</div>';
               $html .= ' <div class="right sg_text">';
						$html .= '<img src="static/home/images/left.png" width="13" height="16" alt="左图标"/>时间：'.$v['ctime'].'<br>'.$v['content'];
                $html .= '</div>';
               $html .= ' <div class="clear"></div>';
              $html .= '</div>';
		}
		
		if($this->req->isAjax()){
			// echo 1;exit;
			return array(
			'page'=>$rs->render(),
			'html'=>$html,
			);
		}else{
			return $this->fetch('riji',array(
				'rs'=>$list,
				'page'=>$rs->render(),
				'html'=>$html,
			));
		}
	}
	//相册展示
	public function xc(){
		$rs = $this->db->name('pics')->where(array('user_id'=>$this->view->user['id']))->order('id desc')->select();
		foreach($rs as $k=>$v){
			$rs[$k]['ctime'] = date('Y-m-d',$v['ctime']);
		}
		return $this->fetch('xc',array(
			'rs'=>$rs,
		));
	}
	//学无止境
	public function learn(){
		$rs = $this->db->name('knowledge')->where(array('user_id'=>$this->view->user['id']))->order('id desc')->paginate($this->perpage=4,false,[
			'query'=>$this->req->param(),
			'type'=>'Npage',
		]);
		$list = $rs->items();
		foreach($list as $k=>$v){
			$list[$k]['ctime'] = date('Y-m-d',$v['ctime']);
		}
		$html = '';
		foreach($list as $k=>$v){
           $html .= '<div class="wz">';
            $html .= '<h3><a target="_blank" class="knowledge" href="home/index/learn_details?id='.$v['id'].'&su='.$v['user_id'].'" iddata="'.$v['id'].'" title="'.$v['title'].'">'.$v['title'].'</a></h3>';
             $html .= '<dl>';
               $html .= '<dt><img src="'.$v['portrait'].'" width="200"  height="123" alt=""></dt>';
               $html .= '<dd>';
                 $html .= '<p class="dd_text_1">'.$v['description'].'</p>';
               $html .= '<p class="dd_text_2">';
               $html .= '<span class="left author">'.$this->view->user['real_name'].'</span><span class="left sj">'.$v['ctime'].'</span>';
               $html .= '<span class="left fl">阅读数: '.$v['hits'].'</span><span class="left yd"><a  target="_blank" class="knowledge" href="home/index/learn_details?id='.$v['id'].'&su='.$v['user_id'].'" iddata="'.$v['id'].'" title="阅读全文">阅读全文</a>';
               $html .= '</span>';
                $html .= '<div class="clear"></div>';
               $html .= '</p>';
               $html .= '</dd>';
               $html .= '<div class="clear"></div>';
             $html .= '</dl>';
           $html .= ' </div>';
		}
		// dump($html);exit;
		if($this->req->isAjax()){
			// echo 1;exit;
			return array(
			'page'=>$rs->render(),
			'html'=>$html,
			);
		}else{
			return $this->fetch('learn',array(
				'list'=>$list,
				'page'=>$rs->render(),
				'html'=>$html,
			));
		}
	}
	//学无止境详细页
	public function learn_details(){
		$rs = $this->db->name('knowledge')
        ->alias('kl')
        ->field('kl.*,bu.real_name')
        ->join('blog_user bu','kl.user_id = bu.id')
		->where(array(
			'kl.id'=>$this->req->get('id'),
		))->find();
		$rs['ctime'] = date('Y-m-d',$rs['ctime']);
			$rs['content']=stripslashes($rs['content']);
		
		$comment_data = $this->db->name('comment')->where(array('article_id'=>$this->req->get('id')))->select();
		
		// dump();exit;
		
		$html = '';
		$html .= '<h2  data-id="'.$rs['id'].'">'.$rs['title'].'</h2>';
		$html .= '<p><span>阅读数：'.$rs['hits'].'</span><span>发布时间：'.$rs['ctime'].'</span>作者：<span id="author" comment_person="'.session("user.real_name").'">'.$rs['real_name'].'</span></p>';
		$html .= '<div>'.$rs['content'].'</div>';
		return $this->fetch('learn_details',array(
			'rs'=>$rs,
			'html'=>$html,
			'comment_data'=>$comment_data,
		));
	}

	//发表评论
	public function send_comment(){
		if($this->req->isAjax()){
			//获取提交过来的数据
			$data = $this->req->post();
			$data['create_time'] = time();
			$rs = $this->db->name('comment')->insert($data);
			if($rs){
				return 1;
			}else{
				return 101;
			}
		}
	}
	
	//留言
	public function guestbook(){
		// echo 123;
		return $this->fetch('guestbook',array(
			
		));
	}
	
	//ajax提交留言消息，加入数据库
	public function add_msg()
	{
		if($this->req->isAjax()){
			//获取提交过来的数据
			$data = $this->req->post();
		// dump($data);exit;
			//判断验证码是否正确
			if($data['email_vcode'] != session('vcode')){
				echo '验证码有误';exit;
			}else{
				unset($data['email_vcode']);
				session('vcode',null);
				//留言信息加入数据库
				$data['ctime'] = time();
				$data['content'] = htmlspecialchars($data['content']);
				// $data['content'] = addslashes($data['content']);
				// dump($data);exit;
				$rs = $this->db->name('msg')->insert($data);
				if($rs){
					echo '留言成功,谢谢您的留言，我会尽快回复的';
				}else{
					echo '留言失败，请联系管理员QQ';
				}
			}
		}
	}
	//ajax发送邮箱验证码
	public function sent_email()
	{
		//生成随机验证码
		// file_put_contents('pp.txt',$this->req->get('useremail'));
		$vcode = ramdomWord(6);
		session('vcode',$vcode);
		// dump($this->req->post());exit;
		$data =  array(
				'content'=>'亲亲，您的验证码是'.$vcode,
				'subject'=>'来自博客的留言邮箱验证',
				'user'=>$this->req->post('username'),
				'user_email'=>$this->req->post('useremail'),
        );
		$rs = sendMail($data);
		
		if($rs == true){
			echo '发送邮箱成功，请登录查看验证码';
		}else{
			echo '发送邮箱验证码失败';
		}
	}
	
	//阅读数增加
	public function add_view()
	{
		//查出原来阅读数
		$past_view = $this->db->name('knowledge')->where(array(
			'id'=>$this->req->get('id'),
		))->find();
		
		//每点击一次，阅读数加一，更新操作
		$rs = $this->db->name('knowledge')->where(array(
			'id'=>$this->req->get('id'),
		))->setInc('hits');
		
	}
}
	