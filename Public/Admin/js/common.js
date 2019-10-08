//dom加载完成后执行的js
;$(function(){

    $(window).scroll(function(){
        img_lazyload();
    }).scroll();

    $('.btn-history-back').click(function(){
        /*window.history.back();*/
        window.location.href = $(this).attr('url');
    });

    $('.data-table tbody td img').parent().css(
        {
            'width':'80px'
        }
    );

	//全选的实现
	$(".check-all").click(function(){
		$(".ids").prop("checked", this.checked);
	});
	$(".ids").click(function(){
		var option = $(".ids");
		option.each(function(i){
			if(!this.checked){
				$(".check-all").prop("checked", false);
				return false;
			}else{
				$(".check-all").prop("checked", true);
			}
		});
	});

    //ajax get请求
    $('.ajax-get').click(function(){
        var target;
        var that = this;
        if ( $(this).hasClass('confirm') ) {
            if(!confirm('确认要执行该操作吗?')){
                return false;
            }
        }
        if ( (target = $(this).attr('href')) || (target = $(this).attr('url')) ) {
            $.get(target).success(function(data){
                if (data.status==1) {
                    if (data.url) {
                        updateAlert(data.info + ' 页面即将自动跳转~','alert-success');
                    }else{
                        updateAlert(data.info,'alert-success');
                    }
                    setTimeout(function(){
                        if (data.url) {
                            location.href=data.url;
                        }else if( $(that).hasClass('no-refresh')){
                            $('#top-alert').find('button').click();
                        }else{
                            location.reload();
                        }
                    },1500);
                }else{
                    updateAlert(data.info);
                    setTimeout(function(){
                        if (data.url) {
                            location.href=data.url;
                        }else{
                            $('#top-alert').find('button').click();
                        }
                    },1500);
                }
            });

        }
        return false;
    });

    //ajax post submit请求
    $('.ajax-post').click(function(){
        var target,query,form;
        var target_form = $(this).attr('target-form');
        var that = this;
        var nead_confirm=false;
        var _before = $(this).attr('data-before');

        if(typeof eval(_before) == 'function'){
            var res = eval(_before + '()');
            if(res === false){
                return false;
            }
        }

        if( ($(this).attr('type')=='submit') || (target = $(this).attr('href')) || (target = $(this).attr('url')) ){
            form = $('.'+target_form);

            if ($(this).attr('hide-data') === 'true'){//无数据时也可以使用的功能
                form = $('.hide-data');
                query = form.serialize();
            }else if (form.get(0)==undefined){
                return false;
            }else if ( form.get(0).nodeName=='FORM' ){
                if ( $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                if($(this).attr('url') !== undefined){
                    target = $(this).attr('url');
                }else{
                    target = form.get(0).action;
                }
                query = form.serialize();
            }else if( form.get(0).nodeName=='INPUT' || form.get(0).nodeName=='SELECT' || form.get(0).nodeName=='TEXTAREA') {
                form.each(function(k,v){
                    if(v.type=='checkbox' && v.checked==true){
                        nead_confirm = true;
                    }
                })
                if ( nead_confirm && $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                query = form.serialize();
            }else{
                if ( $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                query = form.find('input,select,textarea').serialize();
            }
            $(that).addClass('disabled').attr('autocomplete','off').prop('disabled',true);
            $.post(target,query).success(function(data){
                if (data.status==1) {
                    if (data.url) {
                        updateAlert(data.info + ' 页面即将自动跳转~','alert-success');
                    }else{
                        updateAlert(data.info ,'alert-success');
                    }
                    setTimeout(function(){
                        $(that).removeClass('disabled').prop('disabled',false);
                        if (data.url) {
                            location.href=data.url;
                        }else if( $(that).hasClass('no-refresh')){
                            $('#top-alert').find('button').click();
                        }else{
                            location.reload();
                        }
                    },1500);
                }else{
                    updateAlert(data.info);
                    setTimeout(function(){
                        $(that).removeClass('disabled').prop('disabled',false);
                        if (data.url) {
                            location.href=data.url;
                        }else{
                            $('#top-alert').find('button').click();
                        }
                    },1500);
                }
            });
        }
        return false;
    });

	/**顶部警告栏*/
	var content = $('#main');
	var top_alert = $('#top-alert');
	top_alert.find('.close').on('click', function () {
		top_alert.removeClass('block').slideUp(200);
		// content.animate({paddingTop:'-=55'},200);
	});

    window.updateAlert = function (text,c) {
		text = text||'default';
		c = c||false;
		if ( text!='default' ) {
            top_alert.find('.alert-content').text(text);
			if (top_alert.hasClass('block')) {
			} else {
				top_alert.addClass('block').slideDown(200);
				// content.animate({paddingTop:'+=55'},200);
			}
		} else {
			if (top_alert.hasClass('block')) {
				top_alert.removeClass('block').slideUp(200);
				// content.animate({paddingTop:'-=55'},200);
			}
		}
		if ( c!=false ) {
            top_alert.removeClass('alert-error alert-warn alert-info alert-success').addClass(c);
		}
	};

    //按钮组
    (function(){
        //按钮组(鼠标悬浮显示)
        $(".btn-group").mouseenter(function(){
            var userMenu = $(this).children(".dropdown ");
            var icon = $(this).find(".btn i");
            icon.addClass("btn-arrowup").removeClass("btn-arrowdown");
            userMenu.show();
            clearTimeout(userMenu.data("timeout"));
        }).mouseleave(function(){
            var userMenu = $(this).children(".dropdown");
            var icon = $(this).find(".btn i");
            icon.removeClass("btn-arrowup").addClass("btn-arrowdown");
            userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
            userMenu.data("timeout", setTimeout(function(){userMenu.hide()}, 100));
        });

        //按钮组(鼠标点击显示)
        // $(".btn-group-click .btn").click(function(){
        //     var userMenu = $(this).next(".dropdown ");
        //     var icon = $(this).find("i");
        //     icon.toggleClass("btn-arrowup");
        //     userMenu.toggleClass("block");
        // });
        $(".btn-group-click .btn").click(function(e){
            if ($(this).next(".dropdown").is(":hidden")) {
                $(this).next(".dropdown").show();
                $(this).find("i").addClass("btn-arrowup");
                e.stopPropagation();
            }else{
                $(this).find("i").removeClass("btn-arrowup");
            }
        })
        $(".dropdown").click(function(e) {
            e.stopPropagation();
        });
        $(document).click(function() {
            $(".dropdown").hide();
            $(".btn-group-click .btn").find("i").removeClass("btn-arrowup");
        });
    })();

    // 独立域表单获取焦点样式
    $(".text").focus(function(){
        $(this).addClass("focus");
    }).blur(function(){
        $(this).removeClass('focus');
    });
    $("textarea").focus(function(){
        $(this).closest(".textarea").addClass("focus");
    }).blur(function(){
        $(this).closest(".textarea").removeClass("focus");
    });
});

/* 上传图片预览弹出层 */
$(function(){
    $(window).resize(function(){
        var winW = $(window).width();
        var winH = $(window).height();
        $(".upload-img-box").click(function(){
        	//如果没有图片则不显示
        	if($(this).find('img').attr('src') === undefined){
        		return false;
        	}
            // 创建弹出框以及获取弹出图片
            var imgPopup = "<div id=\"uploadPop\" class=\"upload-img-popup\"></div>"
            var imgItem = $(this).find(".upload-pre-item").html();

            //如果弹出层存在，则不能再弹出
            var popupLen = $(".upload-img-popup").length;
            if( popupLen < 1 ) {
                $(imgPopup).appendTo("body");
                $(".upload-img-popup").html(
                    imgItem + "<a class=\"close-pop\" href=\"javascript:;\" title=\"关闭\"></a>"
                );
            }

            // 弹出层定位
            var uploadImg = $("#uploadPop").find("img");
            var popW = uploadImg.width();
            var popH = uploadImg.height();
            var left = (winW -popW)/2;
            var top = (winH - popH)/2;// + 50;
            $(".upload-img-popup").css({
                "max-width" : winW * 0.9,
                "left": left,
                "top": top
            });
        });

        // 关闭弹出层
        $("body").on("click", "#uploadPop .close-pop", function(){
            $(this).parent().remove();
        });
    }).resize();

    // 缩放图片
    function resizeImg(node,isSmall){
        if(!isSmall){
            $(node).height($(node).height()*1.2);
        } else {
            $(node).height($(node).height()*0.8);
        }
    }

    // $('select[name=aci_sign]').change(function(){
    //     var $aci_sign = $(this).val();
    //     if($aci_sign==5){
    //         $('input[name=min_aci]').css({"display":""});
    //     }
    //     else{
    //         $('input[name=min_aci]').css({"display":"none"});
    //     }
    // });

    
})

//标签页切换(无下一步)
function showTab() {
    /*$(".tab-nav li").click(function(){
        var self = $(this), target = self.data("tab");
        self.addClass("current").siblings(".current").removeClass("current");
        window.location.hash = "#" + target.substr(3);
        $(".tab-pane.in").removeClass("in");
        $("." + target).addClass("in");
    }).filter("[data-tab=tab" + window.location.hash.substr(1) + "]").click();*/
    $(".tab-nav li").click(function(){
        var self = $(this);
        self.addClass("current").siblings(".current").removeClass("current");
        var index = $(this).index();
        $(".tab-pane").eq(index).addClass('in').siblings(".in").removeClass('in');
    });
}

//标签页切换(有下一步)
function nextTab() {
     $(".tab-nav li").click(function(){
        var self = $(this), target = self.data("tab");
        self.addClass("current").siblings(".current").removeClass("current");
        window.location.hash = "#" + target.substr(3);
        $(".tab-pane.in").removeClass("in");
        $("." + target).addClass("in");
        showBtn();
    }).filter("[data-tab=tab" + window.location.hash.substr(1) + "]").click();

    $("#submit-next").click(function(){
        $(".tab-nav li.current").next().click();
        showBtn();
    });
}

// 下一步按钮切换
function showBtn() {
    var lastTabItem = $(".tab-nav li:last");
    if( lastTabItem.hasClass("current") ) {
        $("#submit").removeClass("hidden");
        $("#submit-next").addClass("hidden");
    } else {
        $("#submit").addClass("hidden");
        $("#submit-next").removeClass("hidden");
    }
}

//导航高亮
function highlight_subnav(url){
    $('.side-sub-menu').find('a[href="'+url+'"]').closest('li').addClass('current');

     /*隐藏所有除了高亮显示的左边菜单*/
     $('.side-sub-menu li.current').parent().siblings(".side-sub-menu").
     prev("h3").find("i").addClass("icon-fold").end().end().hide();
}


function checkNum(obj) {  
    //先把非数字的都替换掉，除了数字和.  
    obj.value = obj.value.replace(/[^\d.]/g,"");  
    //必须保证第一个为数字而不是.  
    obj.value = obj.value.replace(/^\./g,"");  
    //保证只有出现一个.而没有多个.  
    obj.value = obj.value.replace(/\.{2,}/g,".");  
    //保证.只出现一次，而不能出现两次以上  
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");  
}

function fmoney(s, n) {  
    n = n > 0 && n <= 20 ? n : 2;  
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";  
    var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];  
    t = "";  
    for (i = 0; i < l.length; i++) {  
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");  
    }  
    return t.split("").reverse().join("") + "." + r;  
} 

/*延迟加载图片*/
var img_lazyload = function(){
    $('.img-lazyload').each(function(i,item){
        var src = $(this).attr('data-src'),
            type = $(this).attr('data-lazy-type');
        var t = $(window).scrollTop() + $(window).height();
        var _this_t = $(item).offset().top;

        if(_this_t - 200 > t){
            return false;
        }

        if(src){
            switch(type){
                case 'bg':
                    //$(item).css('background-image','url(' + src + ')');
                    setTimeout(function(){
                       //$(item).attr('src',src);
                       $(item).css('background-image','url(' + src + ')');
                    },400);
                    break;
                default:
                    setTimeout(function(){
                       $(item).attr('src',src);
                    },400);
            }
            $(item).removeAttr('data-src');
        }
    });
}


$(function(){

    var poptop_alert = $('#poptop-alert');
    poptop_alert.find('.close').on('click', function () {
        poptop_alert.removeClass('block').slideUp(200);        
    });

    window.updatePopAlert = function (text,c) {
        text = text||'default';
        c = c||false;
        if ( text!='default' ) {
            poptop_alert.find('.alert-content').text(text);
            if (poptop_alert.hasClass('block')) {
            } else {
                poptop_alert.addClass('block').slideDown(200);
            }
        } else {
            if (poptop_alert.hasClass('block')) {
                poptop_alert.removeClass('block').slideUp(200);
            }
        }
        if ( c!=false ) {
            poptop_alert.removeClass('alert-error alert-warn alert-info alert-success').addClass(c);
        }
    };


    $('.ajax-pop').click(function(){
        var target,query,form;
        var target_form = $(this).attr('target-form');
        var that = this;
        var nead_confirm=false;
        var _before = $(this).attr('data-before');
        if(typeof eval(_before) == 'function'){
            var res = eval(_before + '()');
            if(res === false){
                return false;
            }
        }
        
        if( ($(this).attr('type')=='submit') || (target = $(this).attr('href')) || (target = $(this).attr('url')) ){
            form = $('.'+target_form);

            if ($(this).attr('hide-data') === 'true'){//无数据时也可以使用的功能
                form = $('.hide-data');
                query = form.serialize();
            }else if (form.get(0)==undefined){
                return false;
            }else if ( form.get(0).nodeName=='FORM' ){
                if ( $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                if($(this).attr('url') !== undefined){
                    target = $(this).attr('url');
                }else{
                    target = form.get(0).action;
                }
                query = form.serialize();
            }else if( form.get(0).nodeName=='INPUT' || form.get(0).nodeName=='SELECT' || form.get(0).nodeName=='TEXTAREA') {
                form.each(function(k,v){
                    if(v.type=='checkbox' && v.checked==true){
                        nead_confirm = true;
                    }
                })
                if ( nead_confirm && $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                query = form.serialize();
            }else{
                if ( $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                query = form.find('input,select,textarea').serialize();
            }
            $(that).addClass('disabled').attr('autocomplete','off').prop('disabled',true);
            $.post(target,query).success(function(data){
                if (data.status==1) {
                    
                    location.href=data.url;
                }else{
                    updatePopAlert(data.info);
                    setTimeout(function(){
                        $(that).removeClass('disabled').prop('disabled',false);
                        if (data.url) {
                            location.href=data.url;
                        }else{
                            $('#poptop-alert').find('button').click();
                        }
                    },1500);
                }
            });
        }
        return false;
    });

    var _move=false;//移动标记  
    var _x,_y;//鼠标离控件左上角的相对位置  
    $(".mainframe .modal-header").click(function(){  
                //alert("click");//点击（松开后触发）  
                }).mousedown(function(e){  
                _move=true;  
                _x=e.pageX-parseInt($(".mainframe .modal-dialog").css("left"));  
                _y=e.pageY-parseInt($(".mainframe .modal-dialog").css("top"));  
                $(".mainframe .modal-dialog").fadeTo(20, 0.5);//点击后开始拖动并透明显示  
            });  
            $(document).mousemove(function(e){  
                if(_move){  
                    var x=e.pageX-_x;//移动时根据鼠标位置计算控件左上角的绝对位置  
                    var y=e.pageY-_y;  
                    $(".mainframe .modal-dialog").css({top:y,left:x});//控件新位置  
                }  
            }).mouseup(function(){  
            _move=false;  
            $(".mainframe .modal-dialog").fadeTo("fast", 1);//松开鼠标后停止移动并恢复成不透明  
    }); 

    var move=false;//移动标记  
    var x,y;//鼠标离控件左上角的相对位置  
    $(".viceframe .modal-header").click(function(){  
                //alert("click");//点击（松开后触发）  
                }).mousedown(function(e){  
                move=true;  
                x=e.pageX-parseInt($(".viceframe .modal-dialog").css("left"));  
                y=e.pageY-parseInt($(".viceframe .modal-dialog").css("top"));  
                $(".viceframe .modal-dialog").fadeTo(20, 0.5);//点击后开始拖动并透明显示  
            });  
            $(document).mousemove(function(e){  
                if(move){  
                    var m=e.pageX-x;//移动时根据鼠标位置计算控件左上角的绝对位置  
                    var n=e.pageY-y;  
                    $(".viceframe .modal-dialog").css({top:n,left:m});//控件新位置  
                }  
            }).mouseup(function(){  
            move=false;  
            $(".viceframe .modal-dialog").fadeTo("fast", 1);//松开鼠标后停止移动并恢复成不透明  
    });

    /*菜单导航*/
    $(".tab-head li").click(function(){
        var self = $(this);
        self.addClass("current").siblings(".current").removeClass("current");
        var index = $(this).index();
        self.parents('.menu_body').find(".tab_panel").eq(index).addClass('active').siblings(".active").removeClass('active');
    }); 
    
    $('body').on('click','.form-horizontal .multi_img .item a.del',function(event){
        $(this).parents('.item').remove();
        /*event.stopPropagation();*/
        /*if (e && e.stopPropagation)
            e.stopPropagation();
        else
            window.event.cancelBubble=true;*/
    });
    
});


