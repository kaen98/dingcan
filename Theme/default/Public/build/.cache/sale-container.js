/*TMODJS:{"version":1,"md5":"38a8ce6277bfc68d42ab5287f4305b2c"}*/
template('sale-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$each=$utils.$each,sale=$data.sale,value=$data.value,i=$data.i,$escape=$utils.$escape,uploadsUrl=$data.uploadsUrl,$out='';$out+='<section class="m-component-promotion" id="list-section"> <ul class="list-unstyled" id="list-sale"> ';
$each(sale,function(value,i){
$out+=' <li><a onclick="clickItemDetail(\'';
$out+=$escape(value.product_id);
$out+='\')"><img class="lazy" data-original="';
$out+=$escape(uploadsUrl+value.image);
$out+='" style="display: inline; height: 137px;"></a></li> ';
});
$out+=' </ul> </section> <div style="padding-top:80px;"> <a href="javascript:void(0);" style="text-align: center;color: #949494;font-size: 12px;display: block;"></a> </div> ';
return new String($out);
});