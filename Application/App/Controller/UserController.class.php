<?php
namespace App\Controller;

class UserController extends BaseController
{
    public function _initialize()
    {
        parent::_initialize();

        $isLogin = $this->is_login();
        if (!$isLogin) {
            $this->ajaxReturn(array("info" => "error", "msg" => "未登陆", "status" => 0));
        }
    }

    public function getUser()
    {
        $user = D("User")->get(array("id" => session("userId")), true);
        if (I("get.getOrder")) {
            $user["order"] = D("Order")->getList(array("user_id" => session("userId"), "status" => array("gt", -1)), true);
        }

        if (I("get.getProvince")) {
            $user["province"] = D("LocProvince")->getList(array(), true);
        }

        $this->ajaxReturn($user);
    }

    public function getContactList()
    {
        $contact = D("Contact")->getList(array("user_id" => session("userId")));
        if (I("get.getProvince")) {
            $contact["province"] = D("LocProvince")->getList(array(), true);
        }

        $this->ajaxReturn($contact);
    }

    public function addContact()
    {
        $data = I("post.");
        $data["id"] = session("userId");
        D("Contact")->add($data);
    }

    public function delContact()
    {
        D("Contact")->del(array("id" => array("in", I("get.id"))));
    }

    public function getFavoritesList()
    {
        $list = D("UserFavorites")->getList(array("id" => session("userId")), true);
        $this->ajaxReturn($list);
    }

    public function addFavorites()
    {
        $data = array();
        $userFavorites = D("UserFavorites");
        if (strpos(I("get.product_id"), ',') != false) {
            $product_ids = explode(',', I("get.product_id"));
            foreach ($product_ids as $key => $value) {
                array_push($data, array("product_id" => $value, "user_id" => session("userId")));
            }
        } else {
            array_push($data, array("product_id" => I("get.product_id"), "user_id" => session("userId")));
        }

        foreach ($data as $key => $value) {
            $find = $userFavorites->get(array("user_id" => session("userId"), "product_id" => $value));
            if ($find) {
                unset($data[$key]);
            }
        }

        $userFavorites->addAll($data);
    }

    public function delFavorites()
    {
        D("UserFavorites")->del(array("id" => array("in", I("get.id"))));
    }
}