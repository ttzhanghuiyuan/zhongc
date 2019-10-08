/*(function($){
        $.fn.extend({
            addOne: function(options) {
                options = $.extend({
                    str: "",
                    startSize: "12px",
                    endSize: "40px",
                    interval: 500,
                    color: "red",
                    style: "",
                    callback: function() {}
                }, options);
                $("body").append("<span class='tips_box' style='"+ options.style +"'>"+ options.str +"</span>");
                var box = $(".tips_box");
                var self = $(this);
                var top = self.offset().top;
                var left = self.offset().left + self.width() / 2 - box.width() / 2;
                    box.css({
                        "position": "absolute",
                        "top": top,
                        "left": left,
                        "font-size": options.startSize,
                        "color": options.color
                    });
                    box.animate({
                        "top": top - self.height() / 2,
                        "opacity": 0,
                        "font-size": options.endSize
                    }, options.interval, function() {
                        box.remove();
                        options.callback();
                    });
                }
            });
})(jQuery);*/

/*(function($){
    $.fn.extend({
        center: function () {
            return this.each(function() {
                var top = ($(window).height() - $(this).outerHeight()) / 2;
                var left = ($(window).width() - $(this).outerWidth()) / 2;
                $(this).css({position:'fixed', margin:0, top: (top > 0 ? top : 0)+'px', left: (left > 0 ? left : 0)+'px'});
            });
        }
    }); 
})(jQuery);*/

/*$(window).resize(function(){ 
    $('#top-alert').css({ 
        position:'fixed', 
        left: ($(window).width() - $('#top-alert').outerWidth())/2, 
        top: ($(window).height() - $('#top-alert').outerHeight())/2 + $(document).scrollTop() 
    }); 
}); */
/*placeholder for ie*/
(function($){
    $(document).ready(function(){
      $.fn.center=function(){
        return this.each(function(){
          var $this=$(this),
            parent=$this.parent(),
            topPos,
            topMargin,
            leftMargin,
            resizeTimeout;
          if(parent.is("body:not(.root-height-set)")){
            $("html,body").css("height","100%").addClass("root-height-set");
          }
          if($this.css("position")==="absolute" || $this.css("position")==="fixed"){
            topPos="50%";
            topMargin="-"+Math.round($this.outerHeight()/2)+"px";
            leftMargin="-"+Math.round($this.outerWidth()/2)+"px";
            $this.css({"left":"50%","margin-left":leftMargin});
          }else{
            topPos=Math.floor((parent.height()-$this.outerHeight())/2);
            topMargin="auto";
            $this.css({"position":"relative","margin-left":"auto","margin-right":"auto"});
          }
          $this.css({"top":topPos,"margin-top":topMargin});
          $(window).resize(function(){
            if(resizeTimeout){
              clearTimeout(resizeTimeout);
            }
            resizeTimeout=setTimeout(function(){
              if($this.css("position")==="absolute"){
                topMargin="-"+Math.round($this.outerHeight()/2)+"px";
                leftMargin="-"+Math.round($this.outerWidth()/2)+"px";
                $this.css({"margin-left":leftMargin,"margin-top":topMargin});
              }else{
                topPos=Math.floor((parent.height()-$this.outerHeight())/2);
                $this.css("top",topPos);
              }
            },150);
          });
        });
      }
    });
  })(jQuery);
var common = {
	input:function(){
		    var doc=document,
		    inputs =doc.getElementsByTagName('input'),
		    supportPlaceholder='placeholder'in doc.createElement('textarea'),
		    placeholder=function(input){
			     var text=input.getAttribute('placeholder'),
			     defaultValue=input.defaultValue;
			     if(defaultValue==''){
			        input.value=text;
			     }
			     origin = input.style.color;
                 input.style.color = '#B6B4B4';
			     input.onfocus=function(){
			     	input.style.color = origin;
			        if(input.value===text)
			        {
			            this.value='';
			        }
			      };
			     input.onblur=function(){
			        if(input.value===''){
			        	input.style.color = '#B6B4B4';
			            this.value=text;
			        }
			      }
		 	 };
 
		  if(!supportPlaceholder){
		     for(var i=0,len=inputs.length;i<len;i++){
		          var input=inputs[i],
		          text=input.getAttribute('placeholder');
		          if(text){
		             placeholder(input);
		          }
		      }
		}
	}
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

var HG = {};
/*只能输入数字*/
 HG.isNumberKey = function(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)){
        return false;
    }else{      
        return true;
    }
 } 

 /*修改购买数量*/
 function changebuynum(flag){
    var num = parseInt($("#buy-num").val(),10);
    var num = num?num:1;
    if(flag==1){
        if(num>1)num = num-1;
    }else if(flag==2){
        num = num+1;
    }
    var maxVal = parseInt($("#buy-num").attr('maxVal'),10);
    if(maxVal<=num)num=maxVal;
    $("#buy-num").val(num);

    var unit_price = $('input[name=good_price]').val();
    $("input[name=good_nums]").val(num);

    var total_price = parseFloat(unit_price) * num;
    $("span.total_price").text(fmoney(total_price,2));
}
//再次购买修改购买数量
function changebuynums(flag,input_name){
    //alert(input_name);

    var num = parseInt($("#buy-num"+input_name).val(),10);
    var num = num?num:1;
    if(flag==1){
        if(num>1)num = num-1;
    }else if(flag==2){
        num = num+1;
    }
    var maxVal = parseInt($("#buy-num"+input_name).attr('maxVal'),10);
    if(maxVal<=num)num=maxVal;
    $("#buy-num"+input_name).val(num);

    /*var unit_price = $('input[name=good_price]').val();*/

    $(".input_buy"+input_name).val(num);

    /*var total_price = parseFloat(unit_price) * num;
    $("span.total_price").text(fmoney(total_price,2));*/
}
function changenum(obj){
    var num = parseInt($(obj).val(),10);
    var num = num?num:1;
    var maxVal = parseInt($(obj).attr('maxVal'),10);
    if(maxVal<=num)num=maxVal;
    $(obj).val(num);
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
                    $(item).css('background-image','url(' + src + ')');
                    /*setTimeout(function(){
                        $(item).css('background-image','url(' + src + ')');
                    },400);*/  
                    break;
                default:
                    $(item).attr('src',src);
                    /*setTimeout(function(){
                       $(item).attr('src',src);
                    },400); */ 
            }
            //$(item).removeAttr('data-src');
        }
    });
}

/*焦点图函数*/
function autoChange(){
	var c = $(".slideBtn").find(".curr");
	c.removeClass("curr");
	if(c.next().length==0){
		$(".slideBtn").find("span:first").addClass("curr");
	}
	else{
		c.next().addClass("curr");
	}
	var nth = $(".slideBtn").find(".curr").prevAll().length;
	$(".slideBox").find("li.show").removeClass("show");
	$(".slideBox").find("li").eq(nth).addClass("show");
}

/*最新交易条目更新*/
function updateItem(){
	var timeslot = 6000;
	var i =0;
	var update = setInterval(function(){
		var item = $(".items_container.yichi").find("li:last");
		var height = item.height();
		item.parent().prepend(item);
		item.css('opacity',0);
		item.parent().css('top',-height);
		item.parent().animate({'top':'0px'},500);
		setTimeout(function(){
			fadeIn(item);
		},1000);
		
		i++;
	},timeslot);
}
function fadeIn(obj){
	var item = obj;
	opa = 0;
	var fade = setInterval(function(){
		if(opa<1){
			opa += 0.005;
			$(item).css("opacity",opa);
		}
		else{
			clearInterval(fade);
		}
	},10);
}

/*产品分类导航*/
function MenuHover(){
    $('.SubMenu .item-nav').hover(function(){
        $(this).addClass('active');
        
    },function(){
        $(this).removeClass('active');
    });
}

/*function showmenu(){
    $('li#cates').hover(function(){
        $(this).addClass('selected');
    },function(){
        $(this).removeClass('selected');
    });
}*/

$(function(){

    $(window).scroll(function(){
        //console.log('1');
        img_lazyload();
    }).scroll();

    

    var $window = $(window);

    var foot_height = $('.FooterBox').height();
    var service_height = $('.i_service').height();
    var header_height = $('#header').height();

    var height = $('body').height() - foot_height - service_height - header_height -$("#wraper").height();
    var halfheight = height /2;

    $window.resize(function(){
        $(".webBox").css("min-height", $window.height() - foot_height - service_height-header_height -2);

        /*$('#wraper').parent().css("position","relative");*/
        
        $('#wraper').css({
            "margin-top" : halfheight,
            "margin-bottom" : halfheight
        }); 



    }).resize();
    


    MenuHover();

	updateItem();


    $('a.hd_menu_tit,span.minicart,s.arrow,div.hd_submenu').hover(function(){
        $(this).parent('li').addClass('hd_menu_hover');
    },function(){
        $(this).parent('li').removeClass('hd_menu_hover');
    });
    
	//图标隐藏菜单
	/*$(".entrance").hover(function(){
		$(this).children(".user-menu").show();
	},function(){
		$(this).children(".user-menu").hide();
	});

	$('.action .detailed').each(function(){
		$(this).click(function() {
        	detailed_content();
        	return false;
        });
  	});

	$('.action .thinkbox-image').each(function(){
		$(this).click(function() {
        	thinkbox_image();
        	return false;
        });
  	});

	(function(){
		var $nav = $("#nav"), $current = $nav.children("[data-key=" + $nav.data("key") + "]");
		if($nav.length){
			$current.addClass("current");
		} else {
			$("#nav").children().first().addClass("current");
		}
	})();*/

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
                    },2500);
                }else{
                    updateAlert(data.info);
                    setTimeout(function(){
                        if (data.url) {
                            location.href=data.url;
                        }else{
                            $('#top-alert').find('button').click();
                        }
                    },2500);
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
                /*alert('1');*/
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
                    },2500);
                }else{
                    updateAlert(data.info);
                    setTimeout(function(){
                        $(that).removeClass('disabled').prop('disabled',false);
                        if (data.url) {
                            location.href=data.url;
                        }else{
                            $('#top-alert').find('button').click();
                        }
                    },2500);
                }
            });
        }
        return false;
    });

	//顶部警告栏
	//var content = $('#main');
	var top_alert = $('#top-alert');
	top_alert.find('.close').on('click', function () {
		top_alert.removeClass('block').slideUp(200);
		// content.animate({paddingTop:'-=55'},200);
	});



    window.updateAlert = function (text,c) {

        var top = ($(window).height() - top_alert.height()-160)/2;   
        var left = ($(window).width() - top_alert.width())/2;   
       /* var scrollTop = $(document).scrollTop();   
        var scrollLeft = $(document).scrollLeft();   */

        top_alert.css({ 
            position:'fixed', 
            left: left +"px", 
            top:  top +"px"
        }); 

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

    var addr = $('.addr');
    addr.find('.close').on('click', function () {
        addr.removeClass('block').slideUp(200);
    });
    
    window.showaddr = function(data){
        var top = ($(window).height() - addr.height())/2;   
        var left = ($(window).width() - addr.width())/2; 
        addr.css({
            //display:'', 
            position:'fixed', 
            left: left +"px", 
            top:  top +"px"
        }); 
        addr.find('.person').text(data.recipients);
        addr.find('.phone').text(data.recipient_phone);
        addr.find('.addresss').text(data.address);
        addr.find('.zip').text(data.zip_code);
        addr.addClass('block');
    }

    var require = $('.require');
    require.find('.close').on('click',function(){
        require.removeClass('block').slideUp(200);
    });

    window.require = function(){
        var top = ($(window).height() -require.height() )/2;   
        var left = ($(window).width() - require.width())/2; 
        require.css({
            //display:'', 
            position:'fixed', 
            left: left +"px", 
            top:  top +"px"
        }); 
        require.addClass('block');
    }


    /*焦点图begin*/

	$(".slideBtn").find("span").on({//鼠标点击轮转条时停止轮转，切换图片
		click:function(){
			if($(this).hasClass("curr")){
				return;
			}
			else{
				$(this).siblings("span").removeClass("curr");
				$(this).addClass("curr");
				var nth = $(this).prevAll("span").length;
				$(".slideBox").find("li.show").removeClass("show");
				$(".slideBox").find("li").eq(nth).addClass("show");
			}
		}
	})
	var timeslot = 4000;//轮循事件间隔
	var changepic = setInterval(function(){autoChange();},timeslot);//首页图片自动轮转
	$(".slideBtn").find("span").hover(//鼠标浮动到轮转条时停止轮转，切换图片
		function(){
			if(!$(this).hasClass("curr")){
				$(this).siblings("span").removeClass("curr");
				$(this).addClass("curr");
				var nth = $(this).prevAll("span").length;
				$(".slideBox").find("li.show").removeClass("show");
				$(".slideBox").find("li").eq(nth).addClass("show");
			}
			clearInterval(changepic);
		},
		function(){
			changepic = setInterval(function(){autoChange();},timeslot);
		}
	)
	$(".slideBox ul").hover(//鼠标浮动到图片时停止轮转
		function(){
			clearInterval(changepic);
		},
		function(){
			changepic = setInterval(function(){autoChange();},timeslot);
		}
	)
	/*焦点图end*/

    /*$('a.a_sample').click(function(){

        var target = $(this).attr('href');
        var tip=$(this).children('span.tip');

        $.get(target).success(function(data){
            if(data.status){
                    tip.addOne({
                        str: data.info,
                        style: 'font-weight:600;',
                        endSize: "24px",
                        color: "",
                        interval:800
                    });
                }
                else{
                    if(data.url){

                        alert(data.info);
                        window.location = data.url;
                    }
                    else{
                        //var tip = $(this).children('span.tip');
                        tip.addOne({
                            str: data.info,
                            style: 'font-weight:600;',
                            endSize: "24px",
                            interval:800
                        });
                    }
                }
            });
        return false;
    });*/



    $(".check-all").click(function(){
        $(".ids").prop("checked", this.checked);
        getTotal();
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
        getTotal();
    });

    function getTotal(){
        var totalmoney =0, totalweight=0;

        var option = $("input[class='ids']:checked");

        option.each(function(i){
            //alert($(this).parents('tr').children('td').eq(2).text());
            //totalmoney+=parseFloat($(this).parent('tr').children('td').eq(7).text().replace(",",""));
            totalmoney  += parseInt($(this).parents('tr').children('td').eq(2).text())*parseFloat($(this).parents('tr').children('td').eq(4).text().replace(",",""));
            totalweight += parseInt($(this).parents('tr').children('td').eq(2).text())*parseFloat($(this).parents('tr').children('td').eq(6).text());
        });

        $('#totalmoney').text(fmoney(totalmoney,2));
        $('#totalweight').text(fmoney(totalweight,2));
    }



	$('.exact_search').click(function(){

		var val=$('.base_search_form').find('input[name=cate]').val();

		if(val==''){
			alert('请输入搜索词');
            return false;
         }
         else{

         	var target_form = $(this).attr('target-form');
         	var form = $('.'+target_form);
         	
         	var target = $(this).attr('url') ,query = form.serialize(),query = "flag=1&"+query;

            $.post(target,query).success(function(data){
                window.location = data.url;
            });

            return false;
        }
	});
    


});

function highlight_subnav(url){
    $('.menu-catalog').find('a[href="'+url+'"]').closest('li').addClass('selected');

    $('.user-head').find('.a-item').text($('.menu-catalog').find('a[href="'+url+'"]').text());
}

function highlight_nav(url){
     $('.Menu ul').find('a[href="'+url+'"]').addClass('current');
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

function turnItem(obj){
    var timeslot = 6000;
    var i =0;
    var update = setInterval(function(){
        var item = $(".items_container."+obj).find("li:last");
        var height = item.height();
        item.parent().prepend(item);
        item.css('opacity',0);
        item.parent().css('top',-height);
        item.parent().animate({'top':'0px'},500);
        setTimeout(function(){
            fadeIn(item);
        },1000);
        
        i++;
    },timeslot);
}




