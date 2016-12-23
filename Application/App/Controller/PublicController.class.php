<?php
namespace App\Controller;

use Think\Controller;

class PublicController extends Controller
{
    public $appUrl = "";
    public function _initialize()
    {
        $this->appUrl = "http://" . I("server.HTTP_HOST");
    }

    public function login()
    {
        $condition["phone"] = I("post.phone");
        $condition["password"] = md5(I("post.password"));
        $user = D("User")->get($condition);
        if ($user && $user["status"]) {
            session("userId", $user["id"]);

            //reset token
            $user["token"] = getRandom(32);
            D("User")->save($user);

            $this->ajaxReturn($user);
        }
    }

    public function register()
    {
        $data ["openid"] = "appOpenId_" . date("ymdhis") . mt_rand(100, 999);
        $data ["username"] = I("post.username");
        $data ["phone"] = I("post.phone");
        $data ["password"] = md5(I("post.password"));
        $data ["status"] = 1;
        $user = D("User")->get(array("phone" => I("post.phone")));
        if ($user) {
            $this->ajaxReturn(array("info" => "error", "msg" => "注册失败", "status" => 0));
            return;
        }

        D("User")->add($data);
        $this->ajaxReturn(array("info" => "success", "msg" => "注册成功", "status" => 1));
    }

    public function oauthDebug()
    {
        $config = D("Config")->get();
        if ($config["oauth_debug"] && $config["oauth"]) {
            session("userId", 1);
        }
    }

    public function oauthLogin()
    {
        $this->oauthDebug();

        if (!session("userId")) {
            $config = D("Config")->get();
            if ($config["oauth"]) {
                $weObj = D("WxConfig")->getWeObj();
                $token = $weObj->getOauthAccessToken();
                if (!$token) {
                    $url = $weObj->getOauthRedirect($this->appUrl . __SELF__);
                    header("location: $url");
                    die();
                } else {
                    $userInfo = $weObj->getOauthUserinfo($token["access_token"], $token["openid"]);
                    $this->oauthRegister($userInfo);
                }
            }
        }

        $user = D("User")->get(array("id" => session("userId")), true);
        if ($user["status"] == 0) {
            $this->redirect("Empty/index");
            return;
        }

        return $user;
    }

    private function oauthRegister($userInfo)
    {
        $user = D("User")->get(array("openid" => $userInfo["openid"]));
        $data = array(
            "username" => $userInfo["nickname"],
            "subscribe" => 1,
            "sex" => $userInfo["sex"],
            "language" => $userInfo["language"],
            "city" => $userInfo["city"],
            "province" => $userInfo["province"],
            "avater" => $userInfo["headimgurl"],
            "status" => 1,
        );

        $userId = $user["id"]?$user["id"]:0;
        if ($user) {
            $data["id"] = $user["id"];
            D("User")->save($data);
        } else {
            $data["openid"] = $userInfo["openid"];
            $userId = D("User")->add($data);

            //统计
            D("Analysis")->add(0, 0, 1, 0);
        }

        session("userId", $userId);
    }

    public function logout()
    {
        D("User")->save(array("id" => session("userId"), "token" => ""));
        session(null);

        $this->ajaxReturn(array("info" => "success", "msg" => "注销成功", "status" => 1));
    }
}