<?php
namespace app\admin\controller;
/*
后台文章中心控制器
*/
class Knowledge extends Publics
{
    public function index()
    {
		// $this->checklogin();
		// $this->checkLevel();
		//直接执行sql语句
		$result=$this->db->name(strtolower($this->c))->field($this->field[$this->c],true)->where(array('user_id'=>$this->user_id))->order('id desc')->limit('')->paginate($this->prePage=10);
		// var_dump($result);exit;
		$html='';
 		foreach($result AS $k=>$v){
						 $html.='<tr class="list-group-item-success">';	
                            foreach($v AS $key=>$value){
								if($key == 'portrait'){
									$html.='<td><img src="'.$value.'" width="60",height="60"/></td>';
									continue;
								}elseif($key == 'ctime'){
									$value = date('Y-m-d H:i',$value);
									$html.='<td>'.$value.'</td>';
									continue;
								}elseif($key == 'is_recommend'){
									if($value == 1){
										$value = '推荐';
									}else{
										$value = '普通';
									}
									$html.='<td>'.$value.'</td>';
									continue;
								}elseif($key == 'is_new'){
									if($value == 1){
										$value = '最新';
									}else{
										$value = '非最新';
									}
									$html.='<td>'.$value.'</td>';
									continue;
								}
							   $html.='<td>'.$value.'</td>';
							}
							$html.='<td>
							<button class="btn btn-xs btn-primary update"  onclick="window.location=`admin/'.strtolower($this->c).'/update?id='.$v['id'].'&page='.$this->req->get('page').'`"><i class="glyphicon glyphicon-search" ></i>编辑</button><a href="admin/'.strtolower($this->c).'/del?id='.$v['id'].'" class="btn btn-xs btn-danger del"><i class="glyphicon glyphicon-home del"></i>删除</a></td>';
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
			$data['user_id'] = $this->user_id;
			$data['content']=addslashes($_POST['content']);
			// var_dump($data);exit;
			//添加数据到数据库
			$result=$this->db->name(strtolower($this->c))->insert($data);
			// var_dump($result);exit;
			if($result>0){
				$this->success('添加成功','admin/'.strtolower($this->c).'/index');
			}else{
				$this->error('添加失败');
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
				if($data['portrait'] == ''){
					unset($data['portrait']);
				}
				
				$data['ctime'] = time();
				$data['content']=stripslashes($_POST['content']);
				// dump($data);exit;
				$result=$this->db->name(strtolower($this->c))->where('id', $this->req->post('id'))->update($data);
				if($result>0){
					$this->success('更新成功',url('admin/'.strtolower($this->c).'/index',array('page'=>$this->req->get('page'))));
				}elseif($result==0){
					$this->error('更新失败,请至少修改一个信息');
				}else{
					$this->error('更新失败');
				}
		   }else{
			   //输出到前台		   
			   $result=$this->db->name(strtolower($this->c))->where('id',$this->req->get('id'))->find();
			$result['content']=stripslashes($result['content']);
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