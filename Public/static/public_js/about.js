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
            speed:1000
        });
    }else{
        var swiper_about = new Swiper('.swiper-container4', {
            slidesPerView: 3,
            spaceBetween: 0,
            loop: true,
            noSwiping : true,
            autoplay:true,
            speed:1000
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

    $('.element-article-display').click(function () {
        swiper2.slideTo($('.element-article-display').index(this)-2, 100, false);//切换到第一个slide，速度为1秒
       $('.element-swiperImgPreview').fadeIn();
    })

    $('.element-swiper-button-close').click(function () {
        $('.element-swiperImgPreview').fadeOut();
    })


}

 var swiper2 = new Swiper('.swiper-container5', {
     pagination: {
         el: '.swiper-pagination',
     },
 });



$('.element-swiperImgPreview').css('display','none')
