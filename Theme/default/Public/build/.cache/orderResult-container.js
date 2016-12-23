/*TMODJS:{"version":5,"md5":"f77a8ad65d919b41669df8765e8f52d4"}*/
template('orderResult-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$escape=$utils.$escape,config=$data.config,$out='';$out+='<div class="container-gird" id="orderResult"> <div class="orderResult-header"> <span> <i class="ico ico-succ"></i>&nbsp;&nbsp;下单成功-<span id="status"></span> </span> </div> <div class="orderResultList-container"> <div> <div class="orderResult-form"> <div class="orderResult-list" id="items-order-result"> <div class="order-info"> <span> 订单号：<span id="result-order-no"></span> </span> <span class="date" style="float: right"></span> </div> <div class="order-list" id="item-order-list"> <ul> </ul> </div> <div class="divider"></div> <div class="total-info"> <span class="deliver">运费：<span id="orderFreight">0</span>元 </span> <span class="deliver" style="margin-left: 6px;">优惠：<span id="orderDiscount">0</span>元 </span> <span class="total">共<span>0</span>元 </span>  </div> </div> </div> <div class="tips" id="items-tips"> <span>温馨提示：<span id="timeBox">';
$out+=$escape(config.reminder);
$out+='</span></span> </div> </div> </div> </div> <div style="padding-top:80px;"> <a href="javascript:void(0);" style="text-align: center;color: #949494;font-size: 12px;display: block;"></a> </div>';
return new String($out);
});