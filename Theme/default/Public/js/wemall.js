/**
 * Created by heqing on 15/1/13.
 */
$(document).ready(function () {
    var config = eval(data.config);
    $("title").html(config.name);

    $("#nav-ads").click();

    var cookie = $.cookie("load");
    if (cookie) {
        cookie = JSON.parse(cookie);
        cartData = cookie.cartData;
        totalPrice = cookie.totalPrice;
        totalNum = cookie.totalNum;

        $("#shopcart-tip").show();
        $("#shopcart-tip").html(totalNum);
        if (totalNum == 0) {
            $("#shopcart-tip").hide();
        }
    }

    Path.map("#/user").to(function () {
        $('#nav-user').click();
    });
    Path.map("#/product").to(function () {
        $('#nav-product').click();
    });
    Path.map("#/ads").to(function () {
        $('#nav-ads').click();
    });
    Path.map("#/cart").to(function () {
        $('#nav-cart').click();
    });
    Path.map("#/order/:id").to(function () {
        var id = this.params['id'];
        displayOrderResult(id);
    });
    Path.map("#/product/:id").to(function () {
        var id = this.params['id'];
        clickItemDetail(id);
    });
    Path.root("#/index");
    Path.listen();
});

function backToTop() {
    $("html,body").animate({scrollTop: 0}, 200);
}

function displayOrderResult(id) {
    $.ajax({
        type: "get",
        url: data.baseUrl + "/App/Order/getOrder",
        data: {
            id: id
        },
        success: function (data) {
            $('#nav-cart').click();
            tabTmpl("orderResult-container");
            $(".header-title").html("支付结果");

            $('#result-order-no').html(data.orderid);
            $('#items-order-result').find('.date').html(data.time);
            $('#orderFreight').html(data.freight);
            $('#orderDiscount').html(data.discount);
            $('#items-order-result').find('.total').children().html(data.totalprice);

            if (data.pay_status == 1) {
                $('#status').html("支付成功");
            } else {
                $('#status').html("未支付");
            }

            var json = eval(data.detail);
            var html = '';
            $.each(json, function (index, value) {
                var sku = '';
                if (parseInt(value.sku_id)) {
                    sku = '（' + value.sku_name + '）';
                }
                html += '<li><span class="order-item-name">' + value.name + sku + '</span><span class="order-item-price">￥' + value.price + '</span><span class="order-item-amount">' + value.num + '份</span></li>';
            });
            $('#item-order-list ul').html(html);
        },
        beforeSend: function () {
            $('#page_tag_load').show();
        },
        complete: function () {
            $('#page_tag_load').hide();
        }

    });
}

var menuId = 0;
function changeMenu(obj, id, toggle) {
    $('.menuItem').removeClass("active");
    $(obj).addClass("active");

    menuId = id;
    if (toggle == 'toggle') {
        $('#types-dropdown').toggle();
        var ex = $(obj).html();
        var exClick = $(obj).attr("onclick");
        var more = $('#more-types').html();
        var moreClick = $('#more-types').attr("onclick");

        $('#more-types').html(ex);
        $('#more-types').attr("onclick", exClick);
        $(obj).html(more);
        $(obj).attr("onclick", moreClick);

        $('#more-types').addClass("active");
    }

    $.each($('#items').children(), function (index, value) {
        if ($(this).attr("label-cate") == id) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });

    if ($('#notification').length) {
        $('#notification').show();
    }

    backToTop();

    echo.render();
}

function doCart(obj, id, name, price, skuIs) {
    if ($('#itemsDetail').length > 0) {
        if (skuIs == "") {
            var flag = 0;
            $.each(cartData, function (index, value) {
                if (value.id == id) {
                    flag = 1;
                    value.num++;
                    return;
                }
            });
            if (flag == 0) {
                var current = '{"id":"' + id + '","name":"' + name + '","num":"' + 1 + '","price":"' + price + '"}';
                cartData.push(JSON.parse(current));
            }
        } else {
            if (sku.product_id != id) {
                alert("error");
                return;
            }

            var flag = 0;
            $.each(cartData, function (index, value) {
                if (value.id == id && value.sku_id == sku.sku_id) {
                    flag = 1;
                    value.num++;
                    return;
                }
            });
            if (flag == 0) {
                var current = '{"id":"' + id + '","name":"' + name + '","num":"' + 1 + '","price":"' + sku.price + '","sku_name":"' + sku.sku_name + '","sku_id":"' + sku.sku_id + '"}';
                cartData.push(JSON.parse(current));
            }
        }

        initProduct();
        return;
    } else {
        var flag = 0;
        $.each(cartData, function (index, value) {
            if (value.id == id) {
                flag = 1;
                value.num++;
                return;
            }
        });
        if (flag == 0) {
            var current = '{"id":"' + id + '","name":"' + name + '","num":"' + 1 + '","price":"' + price + '"}';
            cartData.push(JSON.parse(current));
        }
        initProduct();
        return;
    }
}
function initProduct() {
    $.each($('#items').children(), function (index, value) {
        $(this).find('.select-shadow').hide();
    });
    $.each(cartData, function (index, value) {
        $('#items').find('div[label-id="' + value.id + '"]').find('.select-shadow').show();
    });
    initCartDate();
}

function initCartDate() {
    totalNum = 0;
    totalPrice = 0;
    discount = 0;

    $.each(cartData, function (index, value) {
        totalNum += parseInt(value.num);
        totalPrice += parseFloat(value.price) * value.num;
    });
    totalPrice = (parseFloat(totalPrice) + parseFloat(data.config.freight)).toFixed(2);

    if (totalPrice > parseFloat(data.config.full)) {
        totalPrice = (totalPrice - parseFloat(data.config.discount)).toFixed(2);
        discount = parseFloat(data.config.discount);
    }

    $('#shopcart-tip').show();
    $('#shopcart-tip').html(totalNum);
    if (totalNum == 0) {
        $('#shopcart-tip').hide();
    }

    var cookie = {
        cartData: cartData,
        totalPrice: totalPrice,
        totalNum: totalNum,
    };
    $.cookie("load", JSON.stringify(cookie), {path: "/"});
}

function clickItemDetail(id) {
    tabTmpl("itemsDetail-container");
    backContainer = "product-container";
    $('.header-left').show();
    $('.header-title').html("商品详情");
    pushHistory();

    //attr = {};
    $.ajax({
        type: "get",
        url: data.baseUrl + "/App/Shop/getProduct",
        data: {
            id: id
        },
        success: function (res) {
            var json = eval(res);
            $('#itemsDetail .single-name').html(json.name);
            $('#itemsDetail .new-price').children().html(json.price);
            $('#itemsDetail .detail-title').next().html(json.detail);
            $('#itemsDetail .detail-score').children().html(json.score);
            $('#itemsDetail .addItem.btn-shopping').attr("onclick", 'doCart(this ,' + json.id + ',\'' + json.name + '\',' + json.price + ',\'\')');

            $('#product-attr').hide();

            if (json.status == 1) {
                $('#itemsDetail #addCartBtn').show();
                $('#itemsDetail .addItem.btn-shopping').attr("onclick", 'doCart(this ,' + json.id + ',\'' + json.name + '\',' + json.price + ','+json.sku.length+')');
            } else {
                $('#itemsDetail #soldOut').show();
            }

            if (json.sku.length) {
                var html = '';
                $.each(json.sku, function (index, value) {
                    html += '<span class="attr-btn" onclick="addAttr(this , ' + json.id + ' ,' + value.id + ' , \'' + value.name + '\', \'' + value.price + '\')">' + value.name + '</span>';
                });
                $('#itemsDetail #detail-attr-btn').html(html);
                $('#product-attr').show();
            }

            if (json.albums == "") {
                var topimage = [];
                topimage.push(JSON.parse('{"savename":"' + json.savename + '","savepath":"' + json.savepath + '"}'));
                json.albums = topimage;
            }

            var html = '';
            $.each(json.albums, function (index, value) {
                html += '<div class="swiper-slide" style="text-align: -webkit-center;"><img style="height: 200px" src="' + data.uploadsUrl + value.savepath + value.savename + '"></div>';
            });
            $('#itemsDetail .swiper-wrapper').html(html);

            if (res.comment != null) {
                json = eval(res.comment);
                var html = '';
                $.each(json, function (index, value) {
                    html += '<li><span class="commit_left">' + value.username + '</span><span class="commit_right">' + value.name + '</span></li>';
                });
                $('#commentList').html(html);
            } else {
                $('#commentList').html('');
            }
        },
        beforeSend: function () {
            $('#page_tag_load').show();
        },
        complete: function () {
            $('#page_tag_load').hide();

            var mySwiper = new Swiper('.swiper-container', {
                direction: 'horizontal',
                loop: true,

                // 如果需要分页器
                pagination: '.swiper-pagination',

                // 如果需要滚动条
                scrollbar: '.swiper-scrollbar'
            });

            $('.attr-btn').first().click();
        }

    });
}

var sku = {};
function addAttr(obj, product_id, sku_id, sku_name, price) {
    $('.attr-btn').css("background-color", "#ffffff");
    $('.attr-btn').css("color", "#000000");
    $(obj).css("background-color", "#ff6703");
    $(obj).css("color", "#ffffff");
    $('.new-price').children().html(price);

    sku.product_id = product_id;
    sku.sku_name = sku_name;
    sku.sku_id = sku_id;
    sku.price = price;
}

function addproductNum(obj, id, sku_id) {
    var productNum = 0;
    $.each(cartData, function (index, value) {
        if (sku_id == 0) {
            if (value.id == id) {
                productNum = value.num;
                value.num++;
                if (productNum == 1) {
                    $(obj).prev().prev().removeClass('disabled');
                }
            }
        } else {
            if (value.id == id && value.sku_id == sku_id) {
                productNum = value.num;
                value.num++;
                if (productNum == 1) {
                    $(obj).prev().prev().removeClass('disabled');
                }
            }
        }

    });
    productNum++;
    $(obj).prev().val(productNum);
    $(obj).parent().prev().find('.item-amount').html(productNum);
    initCartDate();
    $('#items-total-price').html(totalPrice);
}

function reduceproductNum(obj, id, sku_id) {
    var productNum = 0;
    $.each(cartData, function (index, value) {
        if (sku_id == 0) {
            if (value.id == id) {
                productNum = value.num;
                value.num--;
                if (value.num == 0) {
                    cartData.splice(index, 1);
                    $(obj).parent().parent().parent().remove();
                    initProduct();
                    $('#items-total-price').html(totalPrice);

                    if (cartData.length == 0) {
                        $('#nav-product').click();
                    }
                    return;
                }
                if (productNum == 1) {
                    $(obj).addClass('disabled');
                }
            }
        } else {
            if (value.id == id && value.sku_id == sku_id) {
                productNum = value.num;
                value.num--;
                if (value.num == 0) {
                    cartData.splice(index, 1);
                    $(obj).parent().parent().parent().remove();
                    initProduct();
                    $('#items-total-price').html(totalPrice);

                    if (cartData.length == 0) {
                        $('#nav-product').click();
                    }
                    return;
                }
                if (productNum == 1) {
                    $(obj).addClass('disabled');
                }
            }
        }
    });
    productNum--;
    $(obj).next().val(productNum);
    $(obj).parent().prev().find('.item-amount').html(productNum);
    initCartDate();
    $('#items-total-price').html(totalPrice);
}

function deleteProduct(obj, id, sku_id) {
    $.each(cartData, function (index, value) {
        if (sku_id == 0) {
            if (value.id == id) {
                cartData.splice(index, 1);
                $(obj).parent().parent().parent().remove();
                initProduct();
                $('#items-total-price').html(totalPrice);

                if (cartData.length == 0) {
                    $('#nav-product').click();
                }
                return;
            }
        } else {
            if (value.id == id && value.sku_id == sku_id) {
                cartData.splice(index, 1);
                $(obj).parent().parent().parent().remove();
                initProduct();
                $('#items-total-price').html(totalPrice);

                if (cartData.length == 0) {
                    $('#nav-product').click();
                }
                return;
            }
        }
    });
}

function cartNext() {
    if (cartData.length == 0) {
        alert("购物车为空,请先选择商品!");
        return;
    }

    tabTmpl("delivery-container");
    backContainer = "cart-container";
    $('.header-left').show();
    pushHistory();

    $('#balance-payment').click(function () {
        $('.payment-content').find('.radio').removeClass('selected');
        $(this).find('.radio').addClass('selected');
        payment = 0;
    });
    $('#wechat-payment').click(function () {
        $('.payment-content').find('.radio').removeClass('selected');
        $(this).find('.radio').addClass('selected');
        payment = 1;
    });
    $('#alipay-payment').click(function () {
        $('.payment-content').find('.radio').removeClass('selected');
        $(this).find('.radio').addClass('selected');
        payment = 2;
    });
    $('#cool-payment').click(function () {
        $('.payment-content').find('.radio').removeClass('selected');
        $(this).find('.radio').addClass('selected');
        payment = 3;
    });

    $.ajax({
        type: "get",
        url: data.baseUrl + "/App/User/getContactList",
        data: {
            getProvince: true
        },
        success: function (res) {
            if (res) {
                if (res.code == 0) {
                    openLogin();
                    return;
                }

                if (res.province != []) {
                    var html = '';
                    var city = eval(res.province);

                    if (city != null) {
                        $.each(city, function (index, value) {
                            html += '<option value="' + value.name + '" label="' + index + '">' + value.name + '</option>';
                        });
                        $('#hat_city').html(html);
                    }

                    var html = '';
                    if (city[0]["city"] != null) {
                        $.each(city[0]["city"], function (index, value) {
                            html += '<option value="' + value.name + '">' + value.name + '</option>';
                        });
                        $('#hat_area').html(html);
                    }

                    area = res.province;
                }

                var html = '';
                var deliveryTime = eval(data.config.delivery_time);
                $.each(deliveryTime, function (index, value) {
                    html += '<option value="' + value + '">' + value + '</option>';
                });
                $('#deliveryTime').html(html);

                if (res[0] != null) {
                    $('#username').val(res[0].name);
                    $('#id').val(res[0].id);
                    $('#tel').val(res[0].phone);
                    $('#hat_city').val(res[0].province);
                    $('#address').val(res[0].address);

                    var label = $('#hat_city').find("option:selected").attr("label");
                    if (label) {
                        var html = '';
                        $.each(city[label]['city'], function (index, value) {
                            html += '<option value="' + value.name + '">' + value.name + '</option>';
                            $('#hat_area').html(html);
                        });
                    }

                    $('#hat_area').val(res[0].city);
                }

            }
        },
        beforeSend: function () {
            $('#page_tag_load').show();
        },
        complete: function () {
            $('#page_tag_load').hide();
        }

    });
}

var submitFlag = true;
function submitOrder() {
    if (submitFlag == false) {
        alert("请不要重复操作!");
        return;
    }
    var name = $('#username').val();
    var id = $('#id').val();
    var phone = $('#tel').val();
    var province = $('#hat_city').val();
    var city = $('#hat_area').val();
    var address = $('#address').val();
    var note = $('#note').val();
    var deliveryTime = $('#deliveryTime').val();

    var contact = {
        "id": id,
        "name": name,
        "phone": phone,
        "province": province,
        "city": city,
        "address": address,
    }

    var order = {
        remark: note,
        delivery_time: deliveryTime,
        totalprice: totalPrice,
        payment: payment,
        discount: discount,
    }

    if (payment == -1) {
        alert("请选择支付方式!");
        return;
    }
    if (name.length == 0 || phone.length == 0 || address.length == 0) {
        alert("请核对输入的信息!");
        return;
    }
    submitFlag = false;
    $.ajax({
        type: "post",
        url: data.baseUrl + "/App/Order/addOrder",
        data: {
            contact: contact,
            cartData: cartData,
            order: order
        },
        success: function (res) {
            if (res) {
                tabTmpl('orderResult-container');

                $('#result-order-no').html(res.orderid);
                $('#items-order-result').find('.date').html(res.time);
                $('#items-order-result').find('.total').children().html(res.totalprice);
                $('#orderFreight').html(res.freight);
                $('#orderDiscount').html(res.discount);

                if (res.pay_status == 1) {
                    $('#status').html("支付成功");
                } else {
                    $('#status').html("未支付");
                }

                var json = eval(res.detail);
                var html = '';
                $.each(json, function (index, value) {
                    var attr = '';
                    if (value.sku_name) {
                        attr = '（' + value.sku_name + '）';
                    }
                    html += '<li><span class="order-item-name">' + value.name + attr + '</span><span class="order-item-price">￥' + value.price + '</span><span class="order-item-amount">' + value.num + '份</span></li>';
                });
                $('#item-order-list ul').html(html);

                cartData = [];
                totalNum = 0;
                totalPrice = 0;
                payment = -1;
                initProduct();

                if (typeof res.payUrl != "undefined") {
                    if (res.payUrlMent != 1) {
                        layer.open({
                            content: '请稍后,正在打开在线支付...',
                            //shade: false,
                            style: 'border-radius: 3px;text-align: center;border:0;',
                        });
                        window.location.href = res.payUrl;
                    } else {
                        var html = template("qrcodePay-container", {qrcode: res.payUrl});
                        $("#orderResult").append(html);
                    }
                }
            } else {
                alert('提交失败!余额不足或者商品已下架,请重新选购!');
            }
        },
        beforeSend: function () {
            $('#page_tag_load').show();
            backToTop();
        },
        complete: function () {
            $('#page_tag_load').hide();
            submitFlag = true;
        }

    });

}

function empty(id) {
    $('#' + id).val("");
}

function changeCity(obj) {
    var label = $(obj).find("option:selected").attr("label");
    $('#hat_area').html("");

    var html = '';
    $.each(area[label]['city'], function (index, value) {
        html += '<option value="' + value.name + '">' + value.name + '</option>';
        $('#hat_area').html(html);
    });
}

function cancelOrder(id) {
    $('#orderCancel-popup').show();
    $('#yesOrder').one('click', function () {
        $.ajax({
            type: "get",
            url: data.baseUrl + "/App/Order/updateOrder",
            data: {
                id: id,
                status: -1
            },
            success: function (data) {
                $('#nav-user').click();
                $('#orderCancel-popup').hide();
            },
            beforeSend: function () {
                $('#page_tag_load').show();
            },
            complete: function () {
                $('#page_tag_load').hide();
            }

        });
    });
    $('#noOrder').one('click', function () {
        $('#orderCancel-popup').hide();
    });
}

function commentOrder(id) {
    $('#orderComment-popup').show();
    $('#yesCommit').one('click', function () {
        if ($('#comment-text').val().length == 0) {
            alert("请核对输入的信息!");
            return;
        }
        $.ajax({
            type: "get",
            url: data.baseUrl + "/App/Order/commentOrder",
            data: {
                name: $('#comment-text').val(),
                id: id
            },
            success: function (data) {
                $('#orderComment-popup').hide();
                alert("评论成功!");
            },
            beforeSend: function () {
                $('#page_tag_load').show();
            },
            complete: function () {
                $('#page_tag_load').hide();
            }

        });
        $('#orderComment-popup').hide();
        $('#comment-text').val("");
    });
    $('#noCommit').one('click', function () {
        $('#orderComment-popup').hide();
        $('#comment-text').val("");
    });

}

function openLogin() {
    tabTmpl("login-container");
    $(".header-title").html("登录");
    $(".header-left").show();

    backContainer = "user-container";
}

function openRegister() {
    tabTmpl("register-container");
    $(".header-title").html("注册");
    $(".header-left").show();

    backContainer = "user-container";
}
function openForgetPassword() {
    tabTmpl("forgetPassword-container");
    $(".header-title").html("忘记密码");
    $(".header-left").show();

    backContainer = "login-container";
}

function login() {
    var phone = $('#loginPhone').val();
    var password = $('#loginPassword').val();

    if (phone.length == 0 || password.length == 0) {
        alert("请核对输入的信息!");
        return;
    }

    $.ajax({
        type: "post",
        url: data.baseUrl + "/App/User/login",
        data: {
            phone: phone,
            password: password
        },
        success: function (res) {
            if (res) {
                data.username = res.username;
                data.avater = res.image;
                $("#nav-user").click();
            } else {
                alert("登录失败!");
            }
        },
        beforeSend: function () {
            $('#page_tag_load').show();
        },
        complete: function () {
            $('#page_tag_load').hide();
        }

    });
}
function register() {
    var username = $('#registerUsername').val();
    var phone = $('#registerPhone').val();
    var password = $('#registerPassword').val();
    var password2 = $('#registerPassword2').val();

    if (password != password2) {
        alert("两次输入密码不相同!");
        return;
    }
    if (phone.length == 0 || password.length == 0) {
        alert("请核对输入的信息!");
        return;
    }

    $.ajax({
        type: "post",
        url: data.baseUrl + "/App/User/register",
        data: {
            phone: phone,
            password: password,
            username: username,
        },
        success: function (data) {
            if (data) {
                $('#nav-user').click();
            } else {
                alert("注册失败!");
            }
        },
        beforeSend: function () {
            $('#page_tag_load').show();
        },
        complete: function () {
            $('#page_tag_load').hide();
        }

    });
}

function resetPassword() {
    var username = $('#forgetUsername').val();
    var phone = $('#forgetPhone').val();
    var password = $('#forgetPassword').val();

    if (username.length == 0 || phone.length == 0 || password.length == 0) {
        alert("请核对输入的信息!");
        return;
    }

    $.ajax({
        type: "post",
        url: data.baseUrl + "/App/User/resetPassword",
        data: {
            username: username,
            phone: phone,
            password: password
        },
        success: function (data) {
            if (data) {
                alert("密码修改成功,请使用新密码登录!");
                tabTmpl("login-container");
                $(".header-title").html("注册");
            } else {
                alert("密码修改失败!");
            }
            $('#orderComment-popup').hide();
        },
        beforeSend: function () {
            $('#page_tag_load').show();
        },
        complete: function () {
            $('#page_tag_load').hide();
        }

    });
}

function payOrder(method, orderid) {
    if (method == 1) {
        window.location.href = data.baseUrl + "/App/Pay/wxPay/id/" + orderid;
    } else {
        window.location.href = data.baseUrl + "/App/Pay/alipay/id/" + orderid;
    }
}

function navSelect(o) {
    $('.navigation-item').removeClass("selected");
    $('.navigation-item').children().removeClass("selected");
    $(o).addClass("selected");
    $(o).children().addClass("selected");
}

function openAds(o) {
    navSelect(o);

    tabTmpl("ads-container");
    $(".header-title").html(data.config.name);
}

function tabTmpl(id) {
    var html = template(id, data);
    $("#main").html(html);

    $('.header-left').hide();

    echo.init({
        offset: 100,
        throttle: 250,
        unload: false,
        callback: function (element, op) {
        }
    });
    backToTop();

    menuId = 0;
}

function openProduct(o) {
    navSelect(o);

    var html = template("product-container", data);
    $("#main").html(html);
    $('.header-left').hide();

    echo.init({
        offset: 100,
        throttle: 250,
        unload: false,
        callback: function (element, op) {
        }
    });

    $(".header-title").html("全部商品");
    initProduct();

    $('.menuItem').first().click();

    var swiper = new Swiper('#swiper-container', {
        slidesPerView: 3,
        spaceBetween: 0
    });
}


function openCart(o) {
    navSelect(o);

    tabTmpl("cart-container");
    $(".header-title").html("购物车");

    //console.log(cartData);

    var html = '';
    $.each(cartData, function (index, value) {
        var sku = '';
        var sku_id = 0;
        if (value.sku_id) {
            sku = '（' + value.sku_name + '）';
            sku_id = value.sku_id;
        }
        html += '<li><div class="confirmation-item"><div class="item-info"><span class="item-name">' + value.name + sku + '<br></span><span class="item-price-info"><span><span class="item-single-price">' + value.price + '</span>×<span class="item-amount">' + value.num + '</span></span></span></div><div class="select-box"><span class="minus disabled" onclick="reduceproductNum(this,' + value.id + ',' + sku_id + ')">—</span><input class="amount" type="text" name="amount" value="' + value.num + '" autocomplete="off" readonly=""><span class="add" onclick="addproductNum(this,' + value.id + ',' + sku_id + ')">+</span></div><div class="delete"><a class="delete-btn" onclick="deleteProduct(this,' + value.id + ',' + sku_id + ')"><i class="ico ico-delete"></i></a></div></div><div class="divider"></div></li>';
    });
    $('#item-list ul').html(html);
    $('#items-total-price').html(totalPrice);
}

function openUser(o) {
    navSelect(o);

    if (data.user.length == 0) {
        openLogin();
        return;
    }

    tabTmpl("user-container");
    $(".header-title").html("我的中心");

    $.ajax({
        type: "get",
        url: data.baseUrl + "/App/User/getUser",
        data: {
            getOrder: true
        },
        success: function (res) {
            $('#balance').html("");
            if (res) {
                if (res.identity == 1) {
                    $('#identity').html('管理员');
                }
                $('#balance').html(res.money + '元');
                $('#score').html(res.score + '分');
                $('#items-order-result-list ul').html("");
                $('.myOrderList').hide();

                if (res.order != undefined) {
                    var json = eval(res.order);
                    if (json.length != 0) {
                        $('.myOrderList').show();
                        var html = '';
                        $.each(json, function (index, value) {
                            var htmlfirst = '';
                            var htmlcenter = '';
                            var htmlend = '';

                            var pay_status = '未付款';
                            if (value.pay_status == 1) {
                                pay_status = '已付款';
                            }

                            var order_status = '未处理';
                            if (value.status == 1) {
                                order_status = '正在配送';
                            } else if (value.status == 2) {
                                order_status = '已完成';
                            }
                            htmlfirst += '<li><div class="order-info"><span class="number">订单号：<span id="order-no">' + value.orderid + '</span></span><span class="date" style="float: right">' + value.time + '</span><span class="order-status">' + pay_status + ',' + order_status + '</span></div><div class="order-list" id="item-order-list"><ul>';
                            var jsoncenter = eval(value.detail);
                            $.each(jsoncenter, function (index, value) {
                                var sku = '';
                                if (parseInt(value.sku_id)) {
                                    sku = '（' + value.sku_name + '）';
                                }
                                htmlcenter += '<li><span class="order-item-name">' + value.name + sku + '</span><span class="order-item-price">￥' + value.price + '</span><span class="order-item-amount">' + value.num + '份</span></li>';
                            });

                            var pay_status = '';
                            var cancel_status = '';
                            var comment_status = '';
                            if (value.pay_status == 0) {
                                pay_status = '<span class="payOrder" onclick="payOrder(1,\'' + value.id + '\')">微信付款</span><span class="payOrder" onclick="payOrder(2,\'' + value.id + '\')">支付宝</span>';
                                cancel_status = '<span class="cancelOrder" onclick="cancelOrder(' + value.id + ')">取消</span>';
                            } else if (value.pay_status == 1) {
                                comment_status = '<span class="commitOrder" onclick="commentOrder(' + value.id + ')">评论</span>';
                            }
                            htmlend += '</ul><div class="mytotal-info"><span class="deliver">运费：' + value.freight + '元</span><span class="deliver">优惠：' + value.discount + '元</span><span class="total">共' + value.totalprice + '元</span></div></div><div class="order-footer">' + cancel_status + comment_status + pay_status + '<a class="dail-small" href="tel:' + data.config.tel + '"><span class="dail-ico"><i class="ico ico-phone"></i></span><span class="dail-text">拨打电话催一催</span></a></div><div class="divider"></div></li>';
                            html += htmlfirst + htmlcenter + htmlend;
                        });
                        $('#items-order-result-list ul').html(html);
                    }
                }

            }
        },
        beforeSend: function () {
            $('#page_tag_load').show();
        },
        complete: function () {
            $('#page_tag_load').hide();
        }
    });
}

function backToSale() {
    window.location.reload();
}

jQuery.fn.shake = function (times, offset, delay) {//次数,偏移,间隔
    this.stop().each(function () {
        var Obj = $(this);
        var marginLeft = parseInt(Obj.css('margin-left'));
        var delay = delay > 20 ? delay : 20;
        Obj.animate({'margin-left': marginLeft + offset}, delay, function () {
            Obj.animate({'margin-left': marginLeft}, delay, function () {
                times = times - 1;
                if (times > 0)
                    Obj.shake(times, offset, delay);
            })
        });

    });
    return this;
}

var backContainer = '';
function headerBack() {
    if (backContainer != '') {
        switch (backContainer) {
            case "product-container":
                $("#nav-product").click();
                backContainer = '';
                break;
            case "cart-container":
                $("#nav-cart").click();
                backContainer = '';
                break;
            case "user-container":
                $("#nav-user").click();
                backContainer = '';
                break;
            case "login-container":
                openLogin();
                break;
        }
    }
}

function pushHistory() {
    var state = {
        title: "title",
        url: "#"
    };
    window.history.pushState(state, "title", "");
}

//忽略webkit load popstate事件
pushHistory();
window.addEventListener('load', function () {
    setTimeout(function () {
        window.addEventListener('popstate', function (e) {
            var state = e.state;
            if (state) {
                headerBack();
            } else {
                close_wechat();
            }
        });
    }, 0);
});

function close_wechat() {
    if (window.confirm('你确定要离开吗?')) {
        WeixinJSBridge.call("closeWindow");
    } else {
        pushHistory();
    }
}
