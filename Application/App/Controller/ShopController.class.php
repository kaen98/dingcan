<?php
namespace App\Controller;

class ShopController extends BaseController
{
    public function getProduct()
    {
        $product = D("Product")->get(array("id" => I("get.id")), true, true);
        $albums = explode(",", $product["albums"]);
        $product["albums"] = $albums ? D("File")->getList(array("id" => array("in", $albums))) : "";

        D("Product")->where(array("id" => I("get.id")))->setInc("visiter");
        $this->ajaxReturn($product);
    }

    public function getProductList()
    {
        $product = D("Product")->getList();
        $this->ajaxReturn($product);
    }

    public function getMenu()
    {
        $menu = D("Menu")->get(array("id" => I("get.id")));
        $this->ajaxReturn($menu);
    }

    public function getMenuList()
    {
        $menu = D("Menu")->getList();
        $this->ajaxReturn($menu);
    }

    public function getMenuTreeList()
    {
        $menu = D("Menu")->getList();
        $menuTree = list_to_tree($menu, 'id', 'pid', 'sub');
        $this->ajaxReturn($menuTree);
    }

    public function getAdsList()
    {
        $ads = D("Ads")->getList(array(), true);
        $this->ajaxReturn($ads);
    }

    public function addFeedback()
    {
        $data = I("post.");
        $data["user_id"] = session("userId");
        D("Feedback")->addFeedback($data);
    }
}