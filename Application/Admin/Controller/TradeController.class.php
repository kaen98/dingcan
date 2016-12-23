<?php
namespace Admin\Controller;

class TradeController extends BaseController
{
    public function trade()
    {
        //      每页显示的记录数
        $num = 25;
        $p = I("get.page") ? I("get.page") : 1;
        $tradeList = D("Trade")->getList(array(), false, "id desc", $p, $num);
        $this->assign('tradeList', $tradeList);// 赋值数据集

        $count = D("Trade")->getMethod(array(), "count");// 查询满足要求的总记录数
        $Page = new \Think\Page($count, $num);// 实例化分页类 传入总记录数和每页显示的记录数
        $Page->setConfig('theme', "<ul class='pagination no-margin pull-right'></li><li>%FIRST%</li><li>%UP_PAGE%</li><li>%LINK_PAGE%</li><li>%DOWN_PAGE%</li><li>%END%</li><li><a> %HEADER%  %NOW_PAGE%/%TOTAL_PAGE% 页</a></ul>");
        $show = $Page->show();// 分页显示输出

        $this->assign('page', $show);// 赋值分页输出
        $this->display();
    }

    public function export()
    {
        if (I("get.id")) {
            $trade = D("Trade")->getList(array("id" => array("in", I("get.id"))));
        } else {
            $trade = D("Trade")->getList();
        }

        Vendor("PHPExcel.Excel#class");
        \Excel::export($trade);
    }
}