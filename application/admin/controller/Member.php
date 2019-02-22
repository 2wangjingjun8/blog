<?php
namespace app\admin\controller;
/*
后台会员控制器
*/
class Member extends Publics
{
    public function index()
    {
		// $this->checklogin();
		// $this->checkLevel();
		//直接执行sql语句
		$result=$this->db->name('User')->field($this->field[$this->c])->where(array(
	   ))->order('id desc')->limit('')->paginate($this->prePage=10);
		// var_dump($result);exit;
		$html='';
 		foreach($result AS $k=>$v){
						 $html.='<tr class="list-group-item-success">';	
                            foreach($v AS $key=>$value){
										if($key=='last_login'){
                                            $value=date('Y-m-d H:i:s', $value);
										}
							            $html.='<td>'.$value.'</td>';	
							}
							$html.='<td>
							<a class="btn btn-xs btn-primary" target="_blank" href="home/index/index?su='.$v['id'].'"><i class="glyphicon glyphicon-search" ></i>查看该会员博客</a>
							<a href="admin/'.strtolower($this->c).'/del?id='.$v['id'].'" class="btn btn-xs btn-danger del"><i class="glyphicon glyphicon-home del"></i>删除</a></td>';
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

	//管理员更新
    public function update()
    {
		$this->checklogin();
		// $this->checkLevel();
		if(!empty($_GET['id'])){
				if ($this->req->isPost()){
				 //保存提交的信息
				$data=$this->req->post();
                $data=$this->data_handle($data);
				$result=$this->db->name("user")->where('id', $this->req->post('id'))->update($data);
				if($result>0){
					$this->success('更新成功','admin/'.strtolower($this->c).'/index');
				}elseif($result==0){
					$this->error('更新失败,请至少修改一个信息');
				}else{
					$this->error('更新失败');
				}
		   }else{
			   //输出到前台		   
			   $result=$this->db->name('user')->where('id',$this->req->get('id'))->find();
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
	//管理员del
    public function del()
    {
    	// header("Content-type: text/html; charset=utf-8");
    	header("Content-type: text/html; charset=utf-8"); 
		$this->checklogin();
		// $this->checkLevel();
		if($_GET['id'] == "1"){
			$this->error('无法操作删除管理员');exit;
		}
		if(!empty($_GET['id'])){
			$result=$this->db->name('user')->where('id', $this->req->get('id'))->delete();
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