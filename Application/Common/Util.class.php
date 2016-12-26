<?php
namespace Common;

use Common\ErrorCode;
use Common\Upload;
use Think\Log;

Vendor('emoji');
class Util {

    const KEY_CODE = 'code';
    const KEY_MSG = 'msg';
    const KEY_DATA = 'data';
    const KEY_ID = 'id';
    const KEY_UID = 'uid';
    const KEY_MOBILE = 'mobile';
    const KEY_USERNAME = 'username';
    const KEY_NAME = 'name';
    const KEY_AVATAR = 'avater';
    const KEY_GENDER = 'gender';
    const KEY_PASSWORD = 'password';
    const KEY_COMPANY = 'company';
    const KEY_EMAIL = 'email';
    const KEY_PROVINCE = 'province';
    const KEY_CITY = 'city';
    const KEY_TRACE = 'trace';
    const KEY_KEY = 'key';
    const KEY_HOUR = 'hour';
    const KEY_CNT = 'cnt';
    const KEY_PV = 'pv';
    const KEY_UV = 'uv';
    const KEY_ACTIVITY_ID = 'activity_id';
    const KEY_WX_ID = 'wx_id';
    const KEY_MESSAGE = 'message';
    const KEY_MESSAGES = 'messages';
    const KEY_LIMIT = 'limit';
    const KEY_MIN_ID = 'min_id';
    const KEY_MAX_ID = 'max_id';
    const KEY_CREATE_T = 'create_t';
    const KEY_NICKANME = 'nickname';
    const KEY_HEADIMGURL = 'headimgurl';
    const KEY_FIXED = 'b9a2be4cbc1d73aa4f802901b1e31a708c187ca2e52aebacd5314e052866070f';
    const CODE_SUCCESS = 0;
    const MSG_SUCCESS = 'success';
    const INPUT_CODE = 'inputCode';
    const SEND_CODE = 'sendCode';
    const PLATFORM_ID = '0'; //平台
    const PLATFORM_ADMIN = 2; //平台管理员
    const MERCHANT_ADMIN = 1; //商户管理员
    const ADMIN_GROUP_STATUS1 = 1; //权限组状态启用
    const ADMIN_GROUP_STATUS2 = 2; //禁用
    const DEFAULT_MENU_STATUS1 = 1; //后台管理菜单显示
    const AUTH_RULE_TYPE1 = 1;
    const ADMIN_MENU_STATUS0 = 0;
    const ADMIN_MENU_STATUS2 = 2; //后台管理菜单禁用
    //商户管理员
    const ADMIN_ROLE = 1;
    const USER_ROLE = 0;
    const USER_NORMAL_STATUS = 1;
    const ADMIN_ROLE_STATUS1 = 1; //正常
    const ADMIN_ROLE_STATUS0 = 0;
    const DELETE_AUTH_TYPE1 = 1;
    const DELETE_AUTH_TYPE2 = 2;
    //分类商户排序
    const CATEGORY_TOP_PID = 0;
    const MERCHANT_TYPE_DISTANCE = 1; //获取商户列表类型距离最近
    const MERCHANT_TYPE_DISTANCE7 = 7; //获取商户列表类型距离最远
    const MERCHANT_TYPE_PRICE1 = 2; //价格由低到高
    const MERCHANT_TYPE_PRICE2 = 3; //价格由高到低;
    const MERCHANT_TYPE_CATEGORY = 4; //按分类获取商户
    const MERCHANT_ORDER_CATEGORY = 5; //分类列表下排序
    const MERCHANT_TYPE_SEARCH = 6; //搜索商户
    //分类下排序
    const MERCHANT_ORDER_ENVIRONMENT = 1; //分类下按环境排序
    const MERCHANT_ORDER_PRICE = 2; //分类下按环境排序
    const MERCHANT_ORDER_DISH = 3; //分类下按菜品排序
    const MERCHANT_ORDER_SERVICE = 4; //分类下按服务排序
    const MERCHANT_ORDER_ASSESS = 5; //分类下按评价排序
    const MERCHANT_ORDER_MULTIPLE = 6; //分类下综合排序
    //商户状态
    const MERCHANT_VERIFY_STATUS2 = 2; //审核状态通过
    //商户菜品
    const MERCHANT_DISH_SIGN = 1; //招牌菜
    const MERCHANT_DISH_RECOMMEND = 0; //推荐菜
    const MERCHANT_DISH_NORMAL = 2; //普通菜
    //优惠券
    const COUPON_EXPIRED = 0; //优惠券过期
    const COUPON_UNEXPIRED = 1; //优惠券未过期
    const COUPON_DEL_STATUS0 = 0; //显示
    const COUPON_DEL_STATUS1 = 1; //删除
    const COUPON_UNRECEIVED = 1; //未领取
    const COUPON_RECEIVED = 2; //已领取
    //活动
    const ACTIVITY_ENABLED = 1; //活动启用
    const ACTIVITY_NOT_ENABLED = 0; //活动未启用
    const ACTIVITY_UNSTART = 0; //未开始
    const ACTIVITY_PROGRESS = 1; //进行中
    const ACTIVITY_FINISHED = 2; //已结束
    //坐标
    const KEY_LNG = 'lng';
    const KEY_LAT = 'lat';
    const LNG_TEST = 116.299338; //测试经度
    const LAT_TEST = 40.053997; //测试纬度

    //订单状态
    const APPLY_STATUS1 = 1; //申请状态-用户提交
    const APPLY_STATUS2 = 2; //申请状态-商户确认
    const APPLY_STATUS3 = 3; //申请状态-失败
    const DEPOSIT_STATUS0 = 0; //定金支付状态-暂无状态
    const DEPOSIT_STATUS1 = 1; //定金支付状态-无需支付
    const DEPOSIT_STATUS2 = 2; //定金支付状态-支付成功
    const DEPOSIT_STATUS3 = 3; //定金支付状态-待支付
    const BOOK_STATUS0 = 0; //预定状态-无状态
    const BOOK_STATUS1 = 1; //预定状态-退单中
    const BOOK_STATUS2 = 2; //预定状态-预定成功
    const BOOK_STATUS3 = 3; //预定状态-预定失败
    const REFUND_STATUS0 = 0; //退款状态-无退款申请
    const REFUND_STATUS1 = 1; //退款状态-退款中
    const REFUND_STATUS2 = 2; //退款状态-退款成功
    const REFUND_STATUS3 = 3; //退款状态-退款失败
    const FINAL_STATUS1 = 1; //最终订单状态-待结算
    const FINAL_STATUS2 = 2; //最终订单状态-线上支付订单完成
    const FINAL_STATUS3 = 3; //最终订单状态-订单取消
    const FINAL_STATUS4 = 4; //最终订单状态-线下支付订单完成
    const FINAL_STATUS5 = 5; //最终订单状态-已失效
    const FINAL_STATUS0 = 0; //最终订单状态-无状态

    const IS_DISH2 = 2; //预订订单有菜品

    //订单查询type值
    const ORDER_SEARCH_COMMITTED = 1; //订单状态已提交--
    const ORDER_SEARCH_BOOKED = 2; //已预订--
    const ORDER_SEARCH_UNPAID = 3; //待付定金--
    const ORDER_SEARCH_REFUNDED = 4; //待退款
    const ORDER_SEARCH_BALANCED = 5; //已结算--
    const ORDER_SEARCH_CANCELED = 6; //已取消
    const ORDER_BOOK_FAIL = 7; //被取消
    const ORDER_REFUNDED = 8; //已退款
    const ORDER_SEARCH_FINISHED = 9; //已完成
    const ORDER_BILLING = 10; //待结算
    const ORDER_EXPIRED = 11; //已失效
    const ORDER_REFUND_FAIL = 12; //退款失败

    //分页默认数据
    const DEFAULT_PAGESIZE = 5;
    const DEFAULT_OFFSET = 0;

    //邀请函
    const INVITE_STATUS0 = 0; //未反馈
    const INVITE_ACCEPT = 1; //已接受
    const INVITE_REFUSE = 2; //已拒绝
    const INVITE_EXPIRED = 3; //邀请函过期
    const INVITE_ALREADY_SENT = 2; //已发送过邀请函
    const INVITE_NOT_SEND = 1; //未发送过

    //充值记录状态
    const CASH_LOG_TYPE1 = 1; //充值
    const CASH_LOG_TYPE2 = 2; //支出
    const CASH_LOG_STATUS0 = 0; //无状态
    const CASH_LOG_STATUS1 = 1; //成功

    //用户
    const USER_TYPE1 = 1; //vip用户
    const USER_TYPE0 = 0; //非vip用户
    const PAY_ORDER_STATUS1 = 1; //未完成
    const PAY_ITEM_TYPE3 = 3; //支付类型充值

    //发送模板消息类型
    const TEMPLATE_MESSAGE_TYPE1 = 1; //用户提交订单成功，商户接收
    const TEMPLATE_MESSAGE_TYPE2 = 2; //商户确认订单，用户接收(无订金)
    const TEMPLATE_MESSAGE_TYPE3 = 3; //商户确认订单，用户接收(有订金)
    const TEMPLATE_MESSAGE_TYPE4 = 4; //用户支付定金成功，商户接收
    const TEMPLATE_MESSAGE_TYPE5 = 5; //商户输入结算金额，用户接收
    const TEMPLATE_MESSAGE_TYPE6 = 6; //用户结算成功，商户接收
    const TEMPLATE_MESSAGE_TYPE7 = 7; //用户申请取消订单
    const TEMPLATE_MESSAGE_TYPE8 = 8; //商户取消订单
    const TEMPLATE_MESSAGE_TYPE9 = 9; //用户申请退款
    const TEMPLATE_MESSAGE_TYPE10 = 10; //商户确认退款
    const TEMPLATE_MESSAGE_TYPE11 = 11; //用户拒绝退款

    //平台端消息提醒类型
    const ADMIN_MESSAGE_TYPE12 = 12; //平台订单-预定订单待确认提醒
    const ADMIN_MESSAGE_TYPE13 = 13; //平台订单-预定订单待退款提醒
    const ADMIN_MESSAGE_TYPE14 = 14; //平台订单-预定订单预定成功提醒
    const ADMIN_MESSAGE_TYPE15 = 15; //平台订单-预定订单已取消提醒
    const ADMIN_MESSAGE_TYPE16 = 16; //平台订单-预定订单退款成功提醒
    const ADMIN_MESSAGE_TYPE17 = 17; //平台订单-预定订单已完成提醒
    const ADMIN_MESSAGE_TYPE18 = 18; //平台-充值提醒
    const ADMIN_MESSAGE_TYPE19 = 19; //平台审核-修改商户基本信息提醒
    const ADMIN_MESSAGE_TYPE20 = 20; //平台审核-删除店铺人物提醒
    const ADMIN_MESSAGE_TYPE21 = 21; //平台审核-添加店铺人物提醒
    const ADMIN_MESSAGE_TYPE22 = 22; //平台审核-删除店铺环境图提醒
    const ADMIN_MESSAGE_TYPE23 = 23; //平台审核-添加店铺环境图提醒

    //提醒
    const TEMPLATE_MESSAGE_TYPE24 = 24; //定金支付订单失效前30分钟 提醒
    const TEMPLATE_MESSAGE_TYPE25 = 25; //定金支付订单失效 提醒
    const TEMPLATE_MESSAGE_TYPE26 = 26; //赴约提醒,用户
    const TEMPLATE_MESSAGE_TYPE27 = 27; //接待提醒,商户
    const TEMPLATE_MESSAGE_TYPE28 = 28; //提醒餐厅 , 准备菜品或者特殊服务
    const TEMPLATE_MESSAGE_TYPE29 = 29; //提醒平台客服, 有订单5分钟内未操作

    const TEMPLATE_MESSAGE_TYPE30 = 30; //用户申请结算,商户接受
    const TEMPLATE_MESSAGE_TYPE31 = 31; //平台创建订单成功, 通知用户
    const TEMPLATE_MESSAGE_TYPE32 = 32; //结算支付完成, 通知用户

    const ADMIN_REMIND_CATE1 = 1; //平台提醒-订单
    const ADMIN_REMIND_CATE2 = 2; //平台提醒-充值
    const ADMIN_REMIND_CATE3 = 3; //平台提醒-审核
    const RECHARGE_SCORE_RULE = 2; //充值积分规则id
    const IP_TEST = '114.249.213.99';

    //活动创建
    const ACTIVITY_MERCHANT_CREATE = 1; //商户端创建
    const ACTIVITY_ADMIN_CREATE = 2; //平台创建

    //模版消息是否通知
    const TEMPLATE_IS_SEND0 = 0; //不需要
    const TEMPLATE_IS_SEND1 = 1; //需要

    //角色
    const ROLE1 = 1; //集团管理员
    const ROLE2 = 2; //商户管理员
    const ROLE3 = 3; //集团总厨
    const ROLE4 = 4; //商户总厨
    const ROLE5 = 5; //客户经理

    //商户管理员绑定状态
    const MERCHANT_ADMIN_STATUS0 = 0; //确认中
    const MERCHANT_ADMIN_STATUS1 = 1; //绑定成功

    //检查数组中值是否有空字符串,
    //返回真则代表无空字符串,
    //返回假代表有空字符串
    public static function verifyEmpty($arr) {
        $result = array_keys(array_map(('trim'), $arr), '');
        if ($result) {
            return false;
        } else {
            return true;
        }
    }

    //生成短订单号 prefix 1: 主订单 2: 预定订单 3: 最终支付订单 4:充值订单 5:退款订单
    public static function genCode($time, $prefix, $userId) {
        $userCode = substr(sprintf("%03d", abs(500 - $userId)), -3);
        $hourCode = intval(date('H')) % 10;
        $secondCode = sprintf("%03d", intval($time) % 997);
        $rand = sprintf("%02d", rand(0, 99));

        return $prefix . $userCode . date("ymd", intval($time)) . $hourCode . $secondCode . $rand;
    }

    //生成长订单号:
    // 第1位标记是什么类型 1 订单 2 二维码
    // 2~3位标记是业务码，2位，比如01创建活动订单、02购买门票订单、03打赏订单 04优惠券码
    // 4~7位是用户id后4位，减去5000，取绝对值
    // 8~13是年月日，共6位
    // 14~17是秒数求余 9973 (10000内的最大素数)
    // 18~20 是三位随机数
    // 示例 1 02 4976 160629 6334 482
    // @param $time 为方便以后切换规则传入的time是通过microtime(true)获取的
    // 例如:
    // $applicantId = 2;
    //  $servicePrefix = "102";
    // $orderCreateTime = microtime(true);
    //  $this->genCode($orderCreateTime, $servicePrefix, $applicantId);
    public static function genLongCode($time, $prefix, $userId) {
        $userCode = substr(sprintf("%04d", abs(5000 - $userId)), -4);
        $exploded = explode('.', number_format($time, 3, '.', ''));
        $time10 = $exploded[0];
        $microTime = $exploded[1];
        $secondCode = sprintf("%04d", intval($time) % 9973);
        $rand = sprintf("%03d", rand(0, 999));
        return $prefix . $userCode . date("ymd", intval($time)) . $secondCode . $rand;
    }

    public static function output($result) {
        $str = json_encode($result);
        if (isset($_GET['callback'])) {
            $callback = $_GET['callback'];
            $str = $callback . '(' . $str . ')';
            header('Content-Type: text/javascript');
        } else {
            header('Content-Type:application/json; charset=utf-8');
        }
        exit($str);
    }

    public static function outputSuccess($data = null, $msg = null) {
        $rsp[self::KEY_CODE] = self::CODE_SUCCESS;
        $rsp[self::KEY_TRACE] = "";
        if ($msg) {
            $rsp[self::KEY_MSG] = $msg;
        } else {
            $rsp[self::KEY_MSG] = self::MSG_SUCCESS;
        }
        if (!empty($data)) {
            $rsp[self::KEY_DATA] = $data;
        } else {
            $rsp[self::KEY_DATA] = "";
        }
        self::output($rsp);
    }

    public static function outputFail($e) {
        $data[Util::KEY_CODE] = $e->getCode();
        $data[Util::KEY_MSG] = $e->getMessage();
        $data[self::KEY_DATA] = "";
        if (isDebug()) {
            $data[self::KEY_TRACE] = $e->getTrace();
        } else {
            $data[self::KEY_TRACE] = "";
        }
        self::output($data);
    }

    private static function isLocalIp($ip) {
        $toks = explode('.', $ip);
        if ($toks[0] == '10' || $toks[0] == '192') {
            return true;
        }
        return false;
    }

    // 防止伪造IP
    public static function getBaeIp() {
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ips = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $n = count($ips);
            for ($i = $n - 1; $i >= 0; --$i) {
                $ip = $ips[$i];
                if (!self::isLocalIp($ip)) {
                    return $ip;
                }
            }
        } else if (isset($_SERVER['REMOTE_ADDR'])) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        $ip = (false !== ip2long($ip)) ? $ip : '0.0.0.0';
        return $ip;
    }

    public static function isValidMobile($mobile) {
        return preg_match('/^1[34578][0-9]{9}$/', $mobile);
    }

    public static function isValidEmail($email) {
        return preg_match("/^[0-9a-zA-Z\.]+@(([0-9a-zA-Z]+)[.])+[a-z]{2,4}$/i", $email);
    }

    public static function checkParams($names, $input = null) {
        if ($input === null) {
            $input = $_POST;
        }

        foreach ($names as $name) {
            if (empty($input[$name])) {
                throw new \Exception("No $name", ErrorCode::PARAMS_ERROR);
            }
            if ($name === self::KEY_MOBILE) {
                if (!self::isValidMobile($input[$name])) {
                    throw new \Exception("Invalid mobile", ErrorCode::INVALID_MOBILE);
                }
            }
            // if ($name === self::KEY_EMAIL) {
            //     if (!self::isValidEmail($input[$name])) {
            //         throw new \Exception("Invalid email", ErrorCode::INVALID_EMAIL);
            //     }
            // }
        }
    }

    public static function isMobile() {
        if (isset($_SERVER['HTTP_X_WAP_PROFILE'])) {
            return true;
        }
        if (isset($_SERVER['HTTP_VIA'])) {

            return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
        }

        if (isset($_SERVER['HTTP_USER_AGENT'])) {
            $clientkeywords = array('nokia',
                'sony',
                'ericsson',
                'mot',
                'samsung',
                'htc',
                'sgh',
                'lg',
                'sharp',
                'sie-',
                'philips',
                'panasonic',
                'alcatel',
                'lenovo',
                'iphone',
                'ipod',
                'blackberry',
                'meizu',
                'android',
                'netfront',
                'symbian',
                'ucweb',
                'windowsce',
                'palm',
                'operamini',
                'operamobi',
                'openwave',
                'nexusone',
                'cldc',
                'midp',
                'wap',
                'mobile',
            );
            if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
                return true;
            }
        }
        if (isset($_SERVER['HTTP_ACCEPT'])) {
            if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
                return true;
            }
        }
        return false;
    }

    public static function isAndroid() {
        if (isset($_SERVER['HTTP_USER_AGENT'])) {
            $iosKeywords = array(
                "iphone",
                "ipad",
                "ios",
            );
            $clientkeywords = array(
                'android',
                'nokia',
                'sony',
                'ericsson',
                'mot',
                'samsung',
                'htc',
                'sgh',
                'lg',
                'sharp',
                'sie-',
                'philips',
                'panasonic',
                'alcatel',
                'lenovo',
                'meizu',
                'netfront',
                'ucweb',
                'operamini',
                'operamobi',
                'openwave',
                'nexusone',
                'cldc',
                'midp',
                'wap',
                'mobile',
            );
            if (preg_match("/(" . implode('|', $iosKeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
                return 0;
            } else {
                return 1;
            }
        }
        return 0;
    }

    public static function isWindows() {
        if (isset($_SERVER['HTTP_USER_AGENT'])) {
            $clientkeywords = array(
                'windows',
            );
            if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
                return 1;
            }
        }
        return 0;
    }

    public static function isWeixin() {
        $user_agent = $_SERVER['HTTP_USER_AGENT'];
        if (strpos($user_agent, 'MicroMessenger') === false) {
            return false;
        } else {
            return true;
        }

    }

    public static function produceUid() {
        $length = 4;
        $arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ");

        array_pop($arr);
        $string = implode("", $arr);
        $count = strlen($string) - 1;
        $code = '';
        for ($i = 0; $i < $length; $i++) {
            $code .= $string[rand(0, $count)];
        }
        $date = date("YmdHis", time());
        $uid = substr($date, 2) . $code;
        return $uid;
    }

    public static function checkPassword($pwd) {
        if (strlen($pwd) < 8 || strlen($pwd) > 16) {
            return "密码最少为8位最多16位";
        }

        if (preg_match("/^\d*$/", $pwd)) {
            return "密码必须包含字母";
        }

        if (preg_match("/^[a-z]*$/i", $pwd)) {
            return "密码必须包含数字";
        }
        return true;
    }

    public static function encodeEmoji($return) {
        $text = $return; //可以为收到的微信消息，可能包含二进制emoji表情字符串
        // $tmpStr = json_encode($text); //暴露出unicode
        // $tmpStr = preg_replace("#(\\\ue[0-9a-f]{3})#ie", "addslashes('\\1')", $tmpStr); //将emoji的unicode留下，其他不动
        // $tmpStr = preg_replace("#(\\\ue[0-9a-f]{3})#ie", "'[em_uri:' . urlencode('\1') . ']'", $tmpStr);
        // $text = json_decode($tmpStr);
        $text = emoji_softbank_to_unified($text);
        return $text;
    }
    public static function decodeEmoji($return) {
        $text = $return; //可以为将要发送的微信消息，包含emoji表情unicode字符串，需要转为utf8二进制字符串
        // $text = preg_replace("#\\\u([0-9a-f]+)#ie", "iconv('UCS-2','UTF-8', pack('H4', '\\1'))", $text); //对emoji unicode进行二进制pack并转utf8
        // $text = preg_replace("#\[em_uri:(.*?)\]#ie", "urldecode('\1')", $text);
        if (Util::isWindows()) {
            return emoji_unified_to_html($text);
            // } else if (Util::isAndroid()) {
            //     return emoji_unified_to_softbank($text);
        }
        return $text;
    }

    public static function getMillisecond() {
        list($t1, $t2) = explode(' ', microtime());
        return (float) sprintf('%.0f', (floatval($t1) + floatval($t2)) * 1000);
    }

    /*
     *从数据库取钱转换
     */
    public static function drawMoneyChange($money) {
        $money = number_format(1.0 * $money / 100, 2, ".", '');
        return $money;
    }
    /*
     *从数据库存钱转换
     */
    public static function saveMoneyChange($money) {
        $money = intval($money * 100);
        return $money;
    }

    //分转换为元(无小数)
    public static function convertMoney($money) {
        $money = intval($money / 100);
        return $money;
    }

    public static function payMoneyChange($money) {
        if (APP_DEBUG) {
            $money = 1;
        }
        return intval($money);
    }

    public static function getDistance($lng1, $lat1, $lng2, $lat2) {
        //将角度转为弧度
        $radLat1 = deg2rad($lat1);
        $radLat2 = deg2rad($lat2);
        $radLng1 = deg2rad($lng1);
        $radLng2 = deg2rad($lng2);
        $a = $radLat1 - $radLat2; //两纬度之差,纬度<90
        $b = $radLng1 - $radLng2; //两经度之差纬度<180
        $s = 2 * asin(sqrt(pow(sin($a / 2), 2) + cos($radLat1) * cos($radLat2) * pow(sin($b / 2), 2))) * 6378.137;
        return $s;
    }

    public static function uploadImgByFilePath($moudle, $id, $filePath) {
        $filename = self::genFileName($moudle, $id);
        $imgUrl = Upload::uploadFileByFilePath($filename, $filePath);
        if (empty($imgUrl['filename'])) {
            throw new \Exception("上传图片失败", ErrorCode::UPLOAD_FAILURE);
        }
        $path = $imgUrl['filename'];
        return $path;
    }

    public static function uploadImg($moudle, $id) {
        $filename = self::genFileName($moudle, $id);
        $imgUrl = Upload::uploadFile($filename);
        if (empty($imgUrl['filename'])) {
            throw new \Exception("上传图片失败", ErrorCode::UPLOAD_FAILURE);
        }
        $path = $imgUrl['filename'];
        return $path;
    }

    public static function uploadImgLiu($moudle, $id, $img) {
        $filename = self::genFileName($moudle, $id);
        $filename = $filename . '.jpg';
        $imgUrl = Upload::uploadLiu($img, $filename);
        if (empty($imgUrl['filename'])) {
            throw new \Exception("上传图片失败", ErrorCode::UPLOAD_FAILURE);
        }
        $path = $imgUrl['filename'];
        return $path;
    }

    public static function genFileName($moudle, $id) {
        $code = date('YmdHis');
        $filename = C('PROJECT') . $moudle . '/' . $id . '_' . $code;
        return $filename;
    }

    public static function getImgUrl($filename) {
        return C('QINIU_CODEIMG_URL') . $filename;
    }

    public static function getImg($imgUrl) {
        return substr($imgUrl, strlen(C('QINIU_CODEIMG_URL')));
    }

    //转换时间格式去掉秒 2016-09-27 08:00
    public static function convertTime($time) {
        $time = date('Y-m-d H:i', strtotime($time));
        return $time;
    }

    //转换时间 2016-09-27
    public static function convertDate($time) {
        $time = date('Y-m-d', strtotime($time));
        return $time;
    }

    //根据ip获取用户地理坐标 baidu Api
    public static function getUserCoordinate() {
        $ip = Util::getBaeIp();
        if ($ip == '0.0.0.0' || self::isLocalIp($ip)) {
            $ip = Util::IP_TEST;
        }

        $qterm = Util::isMobile() === true ? 'mb' : 'pc';
        $url = "https://api.map.baidu.com/highacciploc/v1?qcip=" . $ip . "&qterm=" . $qterm . "&ak=" . C('BAIDU_MAP_AK') . "&coord=bd09ll&callback_type=json";

        $content = file_get_contents($url);
        $coorInfo = json_decode($content, true);
        if ($coorInfo['result']['error'] == 161) {
            $lng = $coorInfo['content']['location']['lng'];
            $lat = $coorInfo['content']['location']['lat'];
            session('lng', $lng);
            session('lat', $lat);

            $info['lat'] = $lat;
            $info['lng'] = $lng;
            return $info;
        }

        Log::record('[getUserCoordinate-error] info:' . $content);
        return false;
    }

    public static function getLng() {
        return session('lng');
    }

    public static function getLat() {
        return session('lat');
    }
    //判断是否是微信头像
    public static function checkAvater($avater) {
        return strpos($avater, 'wx.qlogo.cn');
    }

    //  //订单查询type值
    // const ORDER_SEARCH_COMMITTED = 1; //订单状态已提交--
    // const ORDER_SEARCH_BOOKED = 2; //已预订--
    // const ORDER_SEARCH_UNPAID = 3; //待付定金--
    // const ORDER_SEARCH_REFUNDED = 4; //待退款
    // const ORDER_SEARCH_BALANCED = 5; //已结算--
    // const ORDER_SEARCH_CANCELED = 6; //已取消
    // const ORDER_BOOK_FAIL = 7; //被取消
    // const ORDER_REFUNDED = 8; //已退款
    // const ORDER_SEARCH_FINISHED = 9; //已完成
    // const ORDER_BILLING = 10; //待结算

    //用于更新book表中count_status 订单状态字段
    public static function getOrderStatusList() {
        return array(
            array('id' => 0, 'status' => '状态异常'),
            array('id' => 1, 'status' => '待确认'),
            array('id' => 2, 'status' => '已预订'),
            array('id' => 3, 'status' => '待付定金'),
            array('id' => 4, 'status' => '待退款'),
            array('id' => 5, 'status' => '已结算'),
            array('id' => 6, 'status' => '已取消'),
            array('id' => 7, 'status' => '被取消'),
            array('id' => 8, 'status' => '已退款'),
            array('id' => 9, 'status' => '已完成'),
            array('id' => 10, 'status' => '待结算'),
        );
    }

    //统计订单页面, 状态类型下拉框
    public static function getOrderStatusForSelect() {
        return array(
            // array('id' => 0, 'status' => '状态异常'),
            // array('id' => 1, 'status' => '待确认'),
            array('id' => 2, 'status' => '已预订'),
            // array('id' => 3, 'status' => '待付定金'),
            // array('id' => 4, 'status' => '待退款'),
            array('id' => 5, 'status' => '已结算'),
            array('id' => 6, 'status' => '已取消'),
            // array('id' => 7, 'status' => '被取消'),
            array('id' => 8, 'status' => '已退款'),
            array('id' => 9, 'status' => '已完成'),
            // array('id' => 10, 'status' => '待结算'),
        );
    }

    //需要统计的状态
    public static function getCountOrderStatus() {
        return '2, 5, 6, 8, 9';
    }

    //阿里大于 , 短信分享
    public static function shareSms($mobile, $name, $orderNo) {

        $signName = '大鱼测试';
        $param = "{\"name\":\"{$name}\",\"order\":\"{$orderNo}\"}";
        $template = 'SMS_33555639';

        self::alidayuConfig($signName, $param, $mobile, $template);
    }

    //邀请函分享
    public static function shareInviteSms($mobile, $name, $inviteId, $uid) {
        $signName = '大鱼测试';
        $param = "{\"name\":\"{$name}\",\"inviteId\":\"{$inviteId}\", \"userId\":\"{$uid}\"}";
        $template = 'SMS_33635864';

        $rst = self::alidayuConfig($signName, $param, $mobile, $template);
    }

    //授权短信分享
    public static function authSms($mobile, $name) {
        $signName = '大鱼测试';
        $name = $name . ',正在进行餐厅管理员授权，请先关注<开席FoodReport>';
        $param = "{\"name\":\"{$name}\"}";
        $template = 'SMS_33820016';

        self::alidayuConfig($signName, $param, $mobile, $template);
    }

    //$signName 签名
    //$param 短信参数
    //$mobile 接受手机号
    //$template 模版ID
    private static function alidayuConfig($signName, $param, $mobile, $template) {
        Vendor('alidayu.top.TopClient');
        Vendor('alidayu.top.request.AlibabaAliqinFcSmsNumSendRequest');
        Vendor('alidayu.top.ResultSet');
        Vendor('alidayu.top.RequestCheckUtil');
        Vendor('alidayu.top.TopLogger');
        $c = new \TopClient;
        $c->appkey = C('ALIDAYU_APPKEY'); //阿里大于 APPKEY
        $c->secretKey = C('ALIDAYU_SECRET'); //阿里大于 SECRET
        $req = new \AlibabaAliqinFcSmsNumSendRequest;
        $req->setExtend("123456");
        $req->setSmsType("normal");
        $req->setSmsFreeSignName($signName);
        $req->setSmsParam($param);
        $req->setRecNum($mobile);
        $req->setSmsTemplateCode($template);
        $resp = $c->execute($req);
        // $resp = (array) $resp;
        return $resp;
    }

    //对二维数组置顶键名排序
    public static function multiArraySort($arr, $sortKey, $sort = SORT_DESC, $sortType = SORT_REGULAR) {
        foreach ($arr as $key => $value) {
            $sortArr[$key] = $value[$sortKey];
        }
        array_multisort($sortArr, $sortType, $sort, $arr);

        return $arr;
    }
}
