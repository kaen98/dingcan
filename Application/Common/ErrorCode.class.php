<?php
namespace Common;

/**
错误码为5位
第一位为version code，默认为1
第2，3位为模块编号，通用的错误码的2，3位为00，其他模块依次递增
第4，5位为此模块下的错误码编号，从01开始递增
 */
class ErrorCode {
    // 0. 通用错误码
    const UNKONW = 10001; // 未知错误
    const PARAMS_ERROR = 10002; // 请求参数错误
    const SERVER_ERROR = 10003; // 服务器错误
    const UNAUTHORIZED = 10004; // 用户未认证
    const FORBIDDEN = 1005; // 用户无权限访问该资源
    const NO_DATA = 10006; // 没有数据了
    const DEPRECATED = 10007; // 此接口已废弃，请升级到新版本客户端
    const NOT_READY = 10008; // 正在建设中
    const NOT_FOUND = 10009; // 资源不存在
    const ADD_FAILURE = 10010; // 添加失败
    const DELETE_FAILURE = 10011; // 删除失败
    const UPDATE_FAILURE = 10012; // 更新失败
    const SELECT_FAILURE = 10013; // 查询失败
    const EMPTY_POST = 10014; //POST提交数据有空值
    const COUNT_FAILURE = 10015; //查询总记录数失败
    const UPLOAD_FAILURE = 10016; //上传失败

    // 1. 用户、认证相关
    const MOBILE_EXISTS = 10101; // 此手机号已经注册过了
    const USER_NOT_FOUND = 10102; // 用户不存在
    const USER_EXISTS = 10103; // 用户已存在
    const WRONG_PASSWORD = 10104; // 密码错误
    const EMPTY_PASSWORD = 10105; // 密码不能为空
    const TOO_SHORT_PASSWORD = 10106; // 密码长度不能少于6位
    const WRONG_CODE = 10107; // 验证码错误
    const CODE_REQUEST_TOO_FREQUENTLY = 10108; // 验证码发送频繁
    const WRONG_TOKEN = 10109; // TOKEN无效，请重新登录
    const EXPIRED_TOKEN = 10111; // TOKEN过期
    const NO_TOKEN = 10112; // 缺少TOKEN参数
    const INVALID_MOBILE = 10113;
    const INVALID_EMAIL = 10114;
    const WRONG_ACTIVE = 10115; // 活动无效无效
    const WRONG_TICKET = 10116; // 票种无效无效
    const BIND_EXISTS = 10117; //已绑定

    //2. 商户端模块
    const CANCEL_FAILURE = 10201; //取消包间预定失败
    const MERCHANT_ID_FAILURE = 10202; //获取当前管理餐厅ID失败
    const UID_FAILURE = 10203; //获取UID失败
    const BOOK_ROOM_FAILURE = 10204; //预定包间失败
    const ARRIVE_TIME_ERROR = 10205; //到店时间小于当前时间
    const NO_EMPTY_ROOM = 10206; //无空闲包间
    const DENY_ACTION = 10207; //拒绝执行
    const NO_CUSTOMER = 10208; //'客户详情表'未跟'客户管理表'关联, 客户未认证
    const BOOK_ROOM_LIST_UPDATE_FAILED = 10209; // 包间预约表更新失败
    const CREATE_BOOK_PAY_ORDER_FAILED = 10210; // 创建支付订单失败
    const BOOK_ORDER_UPDATE_FAILED = 10211; // 预定订单更新失败
    const CREATE_BILL_PAY_ORDER_FAILED = 10212; //创建结算支付订单失败
    const BILL_ORDER_UPDATE_FAILED = 10213; //// 结算订单更新失败
    const NOT_BIND = 10214; //商户创建的订单已绑定过用户, 无需再次绑定
    const NOT_REPEAT_OPERATE = 10215; //不要重复操作订单

    //3.抵用券模块
    const REPEAT_COUPON = 10301; //重复领券
    const COUPON_EXPIRED = 10302; //优惠券过期

    //4.用户端订单
    const CANAEL_ORDER_FAILED = 10401; //取消订单失败
    const APPLY_REFUND_FAILED = 10402; //申请退款失败
    const CREATE_ORDER_FAILED = 10403; //创建订单失败
    const ORDER_ARRIVE_TIME_ERROR = 10404; //未到支持预约时间段内
    const ORDER_OPEN_TIME_ERROR = 10404; //预定的时间不在营业时间
    //用户端邀请函
    const INVITE_EXPIRED = 10501; //邀请函过期

    //微信公众号相关
    const WX_GET_MENU_FAILURE = 10601;
    const WX_UPDATE_MENU_FAILURE = 10602;
}
