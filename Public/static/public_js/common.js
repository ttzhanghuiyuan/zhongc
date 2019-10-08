$(function() {
    // 手机导航
    var doNavM = $(".do-nav-m"),
        doHeader = $(".do-header"),
        body = $("body");
        do_nav_btn_flag = true;

    $(".do-nav-btn").click(function(){
        if (!do_nav_btn_flag ) {
            return;
        }
        if (!body.hasClass("navOpen")) {
            body.addClass("navOpen");
//                    document.getElementById('do-m-menustate-label').click();
            $('#do-m-menustate-label').click();
//                    $('#do-m-menustate-checkbox2').attr('checked',true)
        } else {
            body.removeClass("navOpen");
//                    document.getElementById('do-m-menustate-label').click();
            $('#do-m-menustate-label').click();
//                    $('#do-m-menustate-checkbox2').attr('checked',false)
        }

        do_nav_btn_flag = false;
        setTimeout(function () {
            do_nav_btn_flag = true;
        },500)
    });

    $(".block_container").css('padding','0');

    document.body.addEventListener('touchstart', function () { });
        $('#main').css('margin-top',$('nav')[0].offsetHeight+'px');
    window.onresize = function(){
        $('#main').css('margin-top',$('nav')[0].offsetHeight+'px');
    };


    $('#weixinbtn').click(function () {
        $('.layer_notice').css('width','260px');
        $('.layer_notice').css('height','260px');
        $('.layer_notice').show();
        $('.layer_notice').children('img').show();
        layer.open({
            type: 1,
            shade: 0.3,
            title: false, //不显示标题
            area: ['260px', '260px'], //宽高
            content: $('.layer_notice'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            cancel: function(){
                $('.layer_notice').css('display','none');
                $('.layer_notice').css('width','0px');
                $('.layer_notice').css('height','0px');
                $('.layer_notice').children('img').css('display','none');

            }
        });
    })

})