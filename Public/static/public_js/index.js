 

 var swiper = new Swiper('.swiper-container', {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    height: (31.25*100*document.body.clientWidth)/10000,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
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
        if (typeof swiper_news != 'undefined') {
            if ( swiper_news_flag == 'more') {
                return;
            }
        }
        swiper_news = new Swiper('.swiper-container2', {
            slidesPerView: 1,
            spaceBetween: 0,
            loop: false,
            noSwiping : false,
            direction : 'horizontal',
            observer:true,
            observeParents:true
        });
        swiper_news.update();
        swiper_news_flag = 'more';
        $('.swiper-container2').find('.col-lg-3').removeClass('swiper-no-swiping');

    }else{
        if (typeof swiper_news != 'undefined') {
            if ( swiper_news_flag == 'less') {
                return;
            }
        }
        swiper_news = new Swiper('.swiper-container2', {
            slidesPerView: 1,
            spaceBetween: 0,
            loop: false,
            noSwiping : true,
            observer:true,
            observeParents:true
        });
        swiper_news.update();
        swiper_news_flag = 'less';
        $('.swiper-container2').find('.col-lg-3').addClass('swiper-no-swiping')
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
