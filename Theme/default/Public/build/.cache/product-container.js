/*TMODJS:{"version":4,"md5":"c1c12d68377df16e7f87b6618397356a"}*/
template('product-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$each=$utils.$each,menu=$data.menu,value=$data.value,i=$data.i,$escape=$utils.$escape,config=$data.config,include=function(filename,data){data=data||$data;var text=$utils.$include(filename,data,$filename);$out+=text;return $out;},$out='';$out+='<div class="header"> <div class="types types-flour"> <div id="swiper-container"> <div class="swiper-wrapper"> ';
$each(menu,function(value,i){
$out+=' <div class="menuItem swiper-slide" onclick="changeMenu(this,\'';
$out+=$escape(value.id);
$out+='\',\'\');">';
$out+=$escape(value.name);
$out+='</div> ';
});
$out+=' </div> </div> </div> </div> <div id="mainList" class="main"> <div id="items" class="items" style="margin-top: 52px;">  ';
if(config.notification){
$out+=' <div class="item large" id="notification"> ';
$out+=$escape(config.notification);
$out+=' </div> ';
}
$out+=' ';
include("./productList-container");
$out+=' </div> </div> <div class="backToTop"> <div class="backToTop-inner" onclick="backToTop()"> <i class="ico ico-top"></i><span>回到顶部</span> </div> </div>';
return new String($out);
});