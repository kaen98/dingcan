<?php
namespace Admin\Controller;
use Common\ErrorCode;
use Common\Util;

class DishController extends BaseController {
    public function dishmenu() {
        $shopId = I('shopId');
        $where['shop_id'] = $shopId;
        $dishs = M('dish')->where($where)->select();
        foreach ($dishs as &$dish) {
            $dish['price'] = Util::drawMoneyChange($dish['price']);
        }
        $this->assign('shopId', $shopId);
        $this->assign('dishs', $dishs);
        $this->display();
    }

    public function addDish() {
        $shopId = I('shopId');
        if (empty($shopId)) {
            $this->error('参数错误');
        }
        $where['id'] = $shopId;
        $shopName = M('shop')->where($where)->getField('name');

        $this->assign('shopId', $shopId);
        $this->assign('shopName', $shopName);
        $this->display();
    }

    public function doAddDish() {
        try {
            $shopId = I('shopId');
            $name = I('name');
            $price = I('price');

            // dump($shopId);
            // dump($name);die;
            if (empty($shopId) || empty($name)) {
                throw new \Exception("参数不允许空", ErrorCode::PARAMS_ERROR);
            }
            $add['shop_id'] = $shopId;
            $add['name'] = $name;
            $add['price'] = Util::saveMoneyChange($price);
            $add['create_t'] = date('Y-m-d H:i:s');
            $addId = M('dish')->add($add);
            if (!$addId) {
                throw new \Exception("添加失败", ErrorCode::ADD_FAILURE);
            }
            $this->success('添加成功', 'Admin/Dish/dishmenu/shopId/' . $shopId);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), 'Admin/Dish/addDish/shopId/' . $shopId);
        }

    }

    public function delDish() {
        try {
            $id = I('id');
            $shopId = I('shopId');
            if (empty($id)) {
                throw new \Exception("参数不允许空", ErrorCode::PARAMS_ERROR);
            }
            $where['id'] = array('in', $id);
            $rst = M('dish')->where($where)->delete();
            if (!$rst) {
                throw new \Exception("删除失败", ErrorCode::DELETE_FAILURE);
            }
            $this->success('删除成功', 'Admin/Dish/dishmenu/shopId/' . $shopId);
        } catch (\Exception $e) {
            $this->error('删除失败', 'Admin/Dish/dishmenu/shopId/' . $shopId);
        }
    }
}