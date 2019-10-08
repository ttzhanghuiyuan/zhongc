var swiper = new Swiper('.swiper-container', {
    slidesPerView: 1,
    spaceBetween: 0,
    loop: false,
    noSwiping : true
});


//加载页面时执行一次
changeMargin();
//监听浏览器宽度的改变
window.onresize = function(){
    changeMargin();
};
function changeMargin(){
    //获取网页可见区域宽度
    var docWidth = document.body.clientWidth;
    if(docWidth <= 992){
        var swiper_about = new Swiper('.swiper-container4', {
            slidesPerView: 2,
            spaceBetween: 0,
            loop: true,
            noSwiping : true,
            autoplay:false,
            speed:1500
        });
    }else{
        var swiper_about = new Swiper('.swiper-container4', {
            slidesPerView: 3,
            spaceBetween: 0,
            loop: true,
            noSwiping : true,
            autoplay:true,
            speed:1500
        });
    }

    if(docWidth <= 992){
        var swiper_about_team = new Swiper('.swiper-container3', {
            slidesPerView: 1,
            spaceBetween: 0,
            loop: true,
            noSwiping : true,
            autoplay:false,
            speed:1500
        });
    }else{
        var swiper_about_team = new Swiper('.swiper-container3', {
            slidesPerView: 4,
            spaceBetween: 0,
            loop: true,
            noSwiping : true,
            autoplay:true,
            speed:1500
        });
    }
}

var qrcode = new QRCode(document.getElementById("qrcode"), {
    width : 256,
    height : 256
});

qrcode.makeCode(location.href);


$('#weixin_share').click(function () {
    console.log($('.detail_article_news_img').children('.block'))
    content: $('.detail_article_news_img').children('.block').css('padding-top','0')
    layer.open({
        type: 1,
        shade: 0.3,
        title: false, //不显示标题
        content: $('.detail_article_news_img').children('.block'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
        cancel: function(){
            content: $('.detail_article_news_img').children('.block').css('padding-top','40px')
        }
    });
})
