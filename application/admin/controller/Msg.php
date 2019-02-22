<?php
namespace app\admin\controller;
/*
后台信息中心控制器
*/
class Msg extends Publics
{
    public function index()
    {
		// $this->checklogin();
		// $this->checkLevel();
		//直接执行sql语句
		$result=$this->db->name(strtolower($this->c))->field($this->field[$this->c])->where(array('user_id'=>$this->user_id))->limit('')->paginate($this->prePage=10);
		// var_dump($result);exit;
		$html='';
 		foreach($result AS $k=>$v){
						 $html.='<tr class="list-group-item-success">';	
                            foreach($v AS $key=>$value){
							   if($key == 'ctime'){
								   $value = date('Y-m-d H:i');
								   $html.='<td>'.$value.'</td>';
								   continue;
							   }elseif($key == 'is_reply'){
								   if($value == '0'){
									   $value = '未回复';
								   }else{
									   $value = '已回复';
								   }
								   $html.='<td>'.$value.'</td>';
								   continue;
							   }
							   $html.='<td>'.$value.'</td>';
							}
							$html.='<td>
							<button class="btn btn-xs btn-primary update"  onclick="window.location=`admin/'.strtolower($this->c).'/update?id='.$v['id'].'&page='.$this->req->get('page').'`"><i class="glyphicon glyphicon-search" ></i>查看回复</button><a href="admin/'.strtolower($this->c).'/del?id='.$v['id'].'" class="btn btn-xs btn-danger del"><i class="glyphicon glyphicon-home del"></i>删除</a></td>';
						$html.='</tr>';			
		}
		//加载模板
		return $this->view->fetch('index',array(
            'title'=>$this->title[$this->c].'列表',
			'html'=>$html,
			'field'=>$this->item[$this->c],
			'name'=>$this->title[$this->c].'中心',
			'rs'=>$result,
	   ));
    }
	
	//添加
    public function add()
    {
		// $this->checklogin();
		// $this->checkLevel();
		if ($this->req->isPost()){
		    //保存提交的信息
		    $data=$_POST;
			$data['ctime'] = time();
			$data['content']=addslashes($_POST['content']);
			// var_dump($data);exit;
			//添加数据到数据库
			$result=$this->db->name(strtolower($this->c))->insert($data);
			// var_dump($result);exit;
			if($result>0){
				$this->success('发布成功','admin/'.strtolower($this->c).'/index');
			}else{
				$this->error('发布失败');
			}
	   }else{
		   return $this->view->fetch('add',array(
				'title'=>$this->title[$this->c].'添加',	
			    'name'=>$this->title[$this->c].'中心',
		   ));
	   }
		
    }
	
	//更新
    public function update()
    {
		// $this->checklogin();
		// $this->checkLevel();
		if(!empty($_GET['id'])){
				if ($this->req->isPost()){
				 //保存提交的信息
				$data=$_POST;
				// 插入留言回复信息到数据库
				$update_data = array(
					'reply_content'=>$data['reply_content'],
					'is_reply'=>1
					);
				$this->db->name(strtolower($this->c))->where('id',$data['id'])->update($update_data);

				$sent_success = $this->sent_email($data['message_user'],$data['email'],$data['reply_content']);
				

		   }else{
			   //输出到前台		   
			   $result=$this->db->name(strtolower($this->c))->where('id',$this->req->get('id'))->find();
				$result['ctime'] = date('Y-m-d H:i:s',$result['ctime']);
			   return $this->view->fetch('update',array(
					'title'=>$this->title[$this->c].'回复',
					'rs'=>$result,
			        'name'=>$this->title[$this->c].'回复',
			   ));
		   }
		}else{
			$this->error('无法操作');
		}
    }

	//ajax留言回复发送邮箱信息
	public function sent_email($user,$email,$reply_content)
	{
		$data = array(
				'content'=>$reply_content,
				'subject'=>'来自'.$_SESSION['think']['user']['real_name'].'博客的留言回复',
				'user'=>$user,
				'user_email'=>$email,
        );
        // dump($data);exit;
		$rs = sendMail($data);
		
		if($rs == true){
			$this->success('回复留言成功');
		}else{
			$this->error('回复留言失败');
		}
	}


	//del
    public function del()
    {
		// $this->checklogin();
		// $this->checkLevel();
		if(!empty($_GET['id'])){
			$result=$this->db->name(strtolower($this->c))->where('id', $this->req->get('id'))->delete();
			if($result>0){
					$this->success('删除成功','admin/'.strtolower($this->c).'/index');
			}else{
					$this->error('删除失败');
			}			
		}else{
			$this->error('无法操作');
		}		   

    }
}
?>