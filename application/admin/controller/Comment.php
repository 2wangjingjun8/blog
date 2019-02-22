<?php
namespace app\admin\controller;
/*
后台信息中心控制器
*/
class Comment extends Publics
{
    public function index()
    {
		// $this->checklogin();
		// $this->checkLevel();
		//直接执行sql语句
		$result=$this->db->name(strtolower($this->c))
		->alias('com')
		->join('blog_knowledge bk','com.article_id = bk.id')
		->field('com.id,bk.title,com.comment_person,com.create_time,com.reply_content')->where(array('user_id'=>$this->user_id))->order('com.id desc')->paginate($this->prePage=10);
		// var_dump($result);exit;
		$html='';
 		foreach($result AS $k=>$v){
						 $html.='<tr class="list-group-item-success">';	
                            foreach($v AS $key=>$value){
							   if($key == 'create_time'){
								   $value = date('Y-m-d H:i:s',$v['create_time']);
								   $html.='<td>'.$value.'</td>';
								   continue;
							   }elseif($key == 'reply_content'){
								   if($value == ''){
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

	//更新
    public function update()
    {
		// $this->checklogin();
		// $this->checkLevel();
		if(!empty($_GET['id'])){
				if ($this->req->isPost()){
				 //保存提交的信息
				$data=$_POST;
				$data['reply_time'] = date('Y-m-d H:i:s',time());
				$data['reply_content']=addslashes($_POST['reply_content']);
				// dump($data);exit;

				$result=$this->db->name(strtolower($this->c))->where('id', $this->req->post('id'))->update($data);

				if($result>0){
					$this->success('回复成功',url('admin/'.strtolower($this->c).'/index',array('page'=>$this->req->get('page'))));
				}elseif($result==0){
					$this->error('回复失败,请至少回复一个信息');
				}else{
					$this->error('回复失败');
				}
		   }else{
			   //输出到前台		   
			   $result=$this->db->name(strtolower($this->c))
				->alias('com')
				->join('blog_knowledge bk','com.article_id = bk.id')
		        ->field('com.*,bk.title')->where('com.id',$this->req->get('id'))->find();
		        // dump($result);exit;
				$result['create_time'] = date('Y-m-d H:i:s',$result['create_time']);
			   return $this->view->fetch('update',array(
					'title'=>$this->title[$this->c].'回复',
					'rs'=>$result,
			        'name'=>$this->title[$this->c].'中心',
			   ));
		   }
		}else{
			$this->error('无法操作');
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