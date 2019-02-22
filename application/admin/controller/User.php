<?php
namespace app\admin\controller;
/*
后台信息中心控制器
*/
class User extends Publics
{
    public function index()
    {
		// $this->checklogin();
		// $this->checkLevel();
		// dump($_SESSION['think']['user']['wechat']);exit;
		if($_SESSION['think']['user']){
			$_GET['id'] = $_SESSION['think']['user']['id'];
		}
		
		if(!empty($_GET['id'])){
				if ($this->req->isPost()){
				 //保存提交的信息
				$data=$_POST;
				if($data['portrait'] == ''){
					unset($data['portrait']);
				}
				
				$data['content']=addslashes($_POST['content']);
				// dump($data);exit;
				$result=$this->db->name(strtolower($this->c))->where('id', $this->req->post('id'))->update($data);
				if($result>0){
					$this->success('保存成功',url('admin/'.strtolower($this->c).'/index',array('page'=>$this->req->get('page'))));
					// echo '<script>alert("修改成功");location.href="'.$this->view->baseurl.'/admin/'.strtolower($this->c).'/index"</script>';
				}elseif($result==0){
					$this->error('保存失败,请至少修改一个信息');
				}else{
					$this->error('保存失败');
				}
		   }else{
			   //输出到前台		   
			   $result=$this->db->name(strtolower($this->c))->where('id',$this->req->get('id'))->find();
			   // dump($result);exit;
			   return $this->view->fetch('update',array(
					'title'=>$this->title[$this->c].'更新',
					'rs'=>$result,
			        'name'=>$this->title[$this->c].'中心',
			   ));
		   }
		}else{
			$this->error('无法操作');
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
				if($data['portrait'] == ''){
					unset($data['portrait']);
				}
				
				$data['content']=addslashes($_POST['content']);
				// dump($data);exit;
				$result=$this->db->name(strtolower($this->c))->where('id', $this->req->post('id'))->update($data);
				if($result>0){
					$this->success('修改成功',url('admin/'.strtolower($this->c).'/index',array('page'=>$this->req->get('page'))));
				}elseif($result==0){
					$this->error('修改失败,请至少修改一个信息');
				}else{
					$this->error('修改失败');
				}
		   }else{
			   //输出到前台		   
			   $result=$this->db->name(strtolower($this->c))->where('id',$this->req->get('id'))->find();
			   // dump($result);exit;
			   return $this->view->fetch('update',array(
					'title'=>$this->title[$this->c].'更新',
					'rs'=>$result,
			        'name'=>$this->title[$this->c].'中心',
			   ));
		   }
		}else{
			$this->error('无法操作');
		}

    }
}
?>