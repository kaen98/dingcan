<?php
namespace Admin\Controller;

class UserController extends BaseController
{
    public function user()
    {
        $num = 25;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", "Admin/User/user/page/" . $p);

        $userList = D("User")->getList(array(), true, "id desc", $p, $num);
        $this->assign("userList", $userList);// 赋值数据集

        $count = D("User")->getMethod(array(), "count");// 查询满足要求的总记录数
        $Page = new \Think\Page($count, $num);// 实例化分页类 传入总记录数和每页显示的记录数
        $Page->setConfig("theme", "<ul class='pagination no-margin pull-right'></li><li>%FIRST%</li><li>%UP_PAGE%</li><li>%LINK_PAGE%</li><li>%DOWN_PAGE%</li><li>%END%</li><li><a> %HEADER%  %NOW_PAGE%/%TOTAL_PAGE% 页</a></ul>");
        $show = $Page->show();// 分页显示输出

        $this->assign("page", $show);// 赋值分页输出
        $this->display();
    }

    public function delUser()
    {
        D("User")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", cookie("prevUrl"));
    }

    public function addUser()
    {
        if (IS_POST) {
            $data = I("post.");
            if ($data["password"] != "") {
                $data["password"] = md5($data["password"]);
            } else {
                unset($data["password"]);
            }
            D("User")->add($data);

            $this->success("添加成功", cookie("prevUrl"));
        } else {
            $this->display();
        }
    }

    public function modUser()
    {
        $user = D("User")->get(array("id" => I("get.id")), true);
        $this->assign("user", $user);

        $this->display("User:addUser");
    }

    public function authGroup()
    {
        $authGroupList = D("AuthGroup")->getList();
        $this->assign("authGroupList", $authGroupList);
        $this->display();
    }

    public function addAuthGroup()
    {
        if (IS_POST) {
            if (!I("post.rules")) {
                $this->error("权限不能为空", "Admin/User/addAuthGroup");
            }

            D("AuthGroup")->add(I("post."));
            $this->success("添加成功", "Admin/User/authGroup");
        } else {
            $authRuleList = D("AuthRule")->getList();
            $this->assign("authRuleList", $authRuleList);
            $this->display();
        }
    }

    public function modAuthGroup()
    {
        $authGroup = D("AuthGroup")->get(I("get.id"));
        $this->assign("authGroup", $authGroup);

        $authRuleList = D("AuthRule")->getList();
        $this->assign("authRuleList", $authRuleList);

        $this->display("User:addAuthGroup");
    }

    public function delAuthGroup()
    {
        D("AuthGroup")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", "Admin/User/authGroup");
    }

    public function admin()
    {
        $user = D("Admin")->getList(array(), true);

        $auth = new \Think\Auth();
        foreach ($user as $key => $value) {
            $groups = $auth->getGroups($value["id"]);
            $user[$key]["group"] = $groups[0];
        }
        $this->assign("userList", $user);
        $this->display();
    }

    public function addAdmin()
    {
        if (IS_POST) {
            $data = I("post.");
            if (!$data["group_id"]) {
                $this->error("操作失败", "Admin/User/addAdmin");
            }

            if ($data["password"] != "") {
                $data["password"] = md5($data["password"]);
            } else {
                unset($data["password"]);
            }

            $groupId = $data["group_id"];
            unset($data["group_id"]);
            $userId = D("Admin")->add($data);

            if ($groupId > 0) {
                D("AuthGroupAccess")->add($userId, $groupId);
            }

            $this->success("添加成功", "Admin/User/admin");
        } else {
            $authGroupList = D("AuthGroup")->getList(array(), false, "id asc");
            $this->assign("authGroupList", $authGroupList);
            $this->display();
        }
    }

    public function modAdmin()
    {
        $user = D("Admin")->get(array("id" => I("get.id")), true);
        $this->assign("user", $user);

        $authGroupList = D("AuthGroup")->getList(array(), false, "id asc");
        $this->assign("authGroupList", $authGroupList);

        $this->display("User:addAdmin");
    }

    public function delAdmin()
    {
        D("Admin")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", "Admin/User/admin");
    }

}