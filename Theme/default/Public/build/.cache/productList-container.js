/*TMODJS:{"version":33,"md5":"dc8eba8bd9af05f77389277c3c07bfdd"}*/
template('productList-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$each=$utils.$each,product=$data.product,value=$data.value,i=$data.i,$escape=$utils.$escape,imageUrl=$data.imageUrl,uploadsUrl=$data.uploadsUrl,$out='';$each(product,function(value,i){
$out+=' <div class="item ';
if(value.label == '推荐'){
$out+='large';
}
$out+='" label-cate="';
$out+=$escape(value.menu_id);
$out+='" label-id="';
$out+=$escape(value.id);
$out+='"> <div class="item-image" onclick="clickItemDetail(\'';
$out+=$escape(value.id);
$out+='\')"><img src="';
$out+=$escape(imageUrl);
$out+='/blank.gif" data-echo="';
$out+=$escape(uploadsUrl+value.savepath+value.savename);
$out+='" class="lazy" style="width: 100%; margin-top: 0px; display: inline;background: #FFF url(';
$out+=$escape(imageUrl);
$out+='/loading.gif) no-repeat center center;background-size: 30px;"> <div class="select-shadow"> <div class="select-inner"><img src="';
$out+=$escape(imageUrl);
$out+='/ico_select.png" alt="selected"><span>已选</span></div> </div> </div> <div class="single-item-info"> <div class="item-title">';
$out+=$escape(value.name);
$out+='</div> <div class="item-price-show"> <div class="item-price"><span class="hotspot">￥';
$out+=$escape(value.price);
$out+='</span></div> </div> ';
if(value.status == 1){
$out+=' ';
if(value.sku.length){
$out+=' <div class="item-amount" onclick="clickItemDetail(\'';
$out+=$escape(value.id);
$out+='\')"><i class="ico ico-cart"></i></div> ';
}else{
$out+=' <div class="item-amount" onclick="doCart(this,\'';
$out+=$escape(value.id);
$out+='\',\'';
$out+=$escape(value.name);
$out+='\',\'';
$out+=$escape(value.price);
$out+='\',\'\')"><i class="ico ico-cart"></i></div> ';
}
$out+=' ';
}else if(value.status == 0){
$out+=' <div class="item-amount"><span>已售罄</span></div> ';
}
$out+=' </div> </div> ';
});
return new String($out);
});