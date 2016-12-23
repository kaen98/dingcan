/*TMODJS:{"version":8,"md5":"0331d0615e7bb7eb5990b5834ba151f7"}*/
template('ads-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$each=$utils.$each,ads=$data.ads,value=$data.value,i=$data.i,$escape=$utils.$escape,imageUrl=$data.imageUrl,uploadsUrl=$data.uploadsUrl,$out='';$out+='<section class="m-component-promotion" id="list-section"> <ul class="list-unstyled" id="list-sale"> ';
$each(ads,function(value,i){
$out+=' <li><a onclick="clickItemDetail(\'';
$out+=$escape(value.remark);
$out+='\')"><img class="lazy" src="';
$out+=$escape(imageUrl);
$out+='/blank.gif" data-echo="';
$out+=$escape(uploadsUrl+value.savepath+value.savename);
$out+='" style="display: inline; height: 137px;"></a></li> ';
});
$out+=' </ul> </section> <div style="padding-top:80px;"> <a href="javascript:void(0);" style="text-align: center;color: #949494;font-size: 12px;display: block;"></a> </div> ';
return new String($out);
});