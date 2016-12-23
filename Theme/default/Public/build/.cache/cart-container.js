/*TMODJS:{"version":6,"md5":"0a81134283fabc878a60240a2ed15822"}*/
template('cart-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$escape=$utils.$escape,config=$data.config,$out='';$out+='<div class="container-gird"> <div class="confirmation-form"> <div class="confirmation-header"> <span>订单确认</span> </div> <div class="confirmation-list" id="item-list"> <div class="dotted-divider" style="width: 105.263157894737%; margin-left: -2.9%"></div> <ul>  </ul> <div class="total-info"> <span class="items-total-amount">运费：<span id="items-total-amount">';
$out+=$escape(config.freight);
$out+='</span>元</span> <span class="items-total-amount">满：<span>';
$out+=$escape(config.full);
$out+='</span>元</span> <span class="items-total-amount">减：<span>';
$out+=$escape(config.discount);
$out+='</span>元</span> <span class="items-total-price">总计：<span id="items-total-price">0</span>元</span> </div> </div> </div> </div> <a class="next mybtn" href="javascript:cartNext();" > <span style="display: block; height: 39px; font-size: 1.2em;margin: 10px;background: #ff6703;color: #ffffff;border-radius: 6px;">下一步</span> </a> <div style="padding-top:190px;"></div>';
return new String($out);
});