/*TMODJS:{"version":8,"md5":"11a0bd4d2470642bc2201ffdb2a7545d"}*/
template('user-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$escape=$utils.$escape,user=$data.user,imageUrl=$data.imageUrl,$out='';$out+='<div class="container-gird"> <div class="confirmation-form"> <div class="confirmation-list"> <img data-echo="';
$out+=$escape(user.avater);
$out+='" src="';
$out+=$escape(imageUrl);
$out+='/blank.gif" class="avater lazy"> <div style="text-align: center;padding: 10px 0px;" id="identity">普通用户</div> <div class="divider"></div> <div class="dotted-divider" style="width: 105.263157894737%; margin-left: -2.9%"></div> <ul> <li> <div class="confirmation-item"> <div class="item-info"> <span class="item-name">我的账号:<br></span> </div> <div class="select-box" id="nickname">';
$out+=$escape(user.username);
$out+='</div> </div> <div class="divider"></div> </li> <li> <div class="confirmation-item"> <div class="item-info"> <span class="item-name">我的账户:<br></span> </div> <div class="select-box" id="balance"></div> </div> <div class="divider"></div> </li> <li> <div class="confirmation-item"> <div class="item-info"> <span class="item-name">我的积分:<br></span> </div> <div class="select-box" id="score"></div> </div> </li> </ul> </div> </div> </div> <div class="my-order-header"> <span>我的订单</span> <div class="dotted-divider"></div> </div> <div class="myOrderList none"> <div> <div class="container-gird">  <div> <div class="orderResult-list" id="items-order-result-list"> <ul> </ul> </div> </div> </div> </div> </div> <div class="history-loader"> <i class="ico ico-history"></i> <span>点击查看历史订单</span> </div> <div style="padding-top:80px;"> <a href="javascript:void(0);" style="text-align: center;color: #949494;font-size: 12px;display: block;"></a> </div> <div id="orderCancel-popup" class="popup none"> <div class="popup-header">确定取消订单吗？</div> <div class="popup-tips"></div> <div class="btn-group"> <button class="btn" id="yesOrder">确定</button> <button class="btn" id="noOrder">取消</button> </div> </div> <div id="orderComment-popup" class="popup none"> <div class="popup-header"> 评论订单 </div> <div class="popup-tips"> <input style="width: 86%;margin: 0px 10px 10px 10px;height: 20%;" type="text" id="comment-text"> </div> <div class="btn-group"> <button class="btn" id="yesCommit">提交</button> <button class="btn" id="noCommit">取消</button> </div> </div> <div id="pay-popup" class="popup none"> <div class="popup-header"> 账户充值 </div> <div class="popup-tips"> <input style="width: 86%;margin: 0px 10px 10px 10px;height: 20%;" type="number" id="pay-text"> </div> <div class="btn-group"> <button class="btn" id="yesPay">提交</button> <button class="btn" id="noPay">取消</button> </div> </div>';
return new String($out);
});