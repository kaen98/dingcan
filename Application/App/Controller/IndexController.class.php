<?php
namespace App\Controller;


class IndexController extends BaseController
{
    public function index()
    {
        $user = R("App/Public/oauthLogin");
        $user = json_encode($user);
        $this->assign("user", $user);

        $config = D("Config")->get();
        $config["delivery_time"] = explode(",", $config["delivery_time"]);
        $this->assign("config", json_encode($config));

        $menu = D("Menu")->getList(array(), true, "rank desc,id desc");
        $menu = list_to_tree($menu, 'id', 'pid', 'sub');
        $this->assign("menu", json_encode($menu));

        $product = D("Product")->getList(array("status" => array("neq", -1)), true, "rank desc", 0, 0, 0);
        $this->assign("product", json_encode($product));

        $ads = D("Ads")->getList(array(), true);
        $this->assign("ads", json_encode($ads));
        $this->display();
    }

    public function init()
    {
        $data = array();
        $config = D("Config")->get();
        $config["delivery_time"] = explode(",", $config["delivery_time"]);
        $data["config"] = $config;

        $data["ads"] = D("Ads")->getList(array(), true);

        $menu = D("Menu")->getList(array(), true, "rank desc,id desc");
        $menu = list_to_tree($menu, 'id', 'pid', 'sub');
        $data["menu"] = $menu;

        $data["product"] = D("Product")->getList(array("status" => array("neq", -1)), true, "rank desc", 0, 0, 0);
        $this->ajaxReturn($data);
    }
}