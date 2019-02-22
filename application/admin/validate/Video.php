<?php
// +----------------------------------------------------------------------
// | 海豚PHP框架 [ DolphinPHP ]
// +----------------------------------------------------------------------
// | 版权所有 2016~2017 河源市卓锐科技有限公司 [ http://www.zrthink.com ]
// +----------------------------------------------------------------------
// | 官方网站: http://dolphinphp.com
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

namespace app\admin\validate;

use think\Validate;

/**
 * 节点验证器
 * @package app\admin\validate
 * @author 蔡伟明 <314013107@qq.com>
 */
class Video extends Validate
{
    //定义验证规则
    protected $rule = [
        'name|视频名称' => 'require',
        'url|上传视频'    => 'require',
        'description|视频描述'  => 'require',
    ];

    //定义验证提示
    protected $message = [
        'name.require' => '视频名称不能为空',
        'description.require'    => '视频描述不能为空',
    ];
}
