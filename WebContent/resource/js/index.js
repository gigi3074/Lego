$(function(){
    // 각각 목록 내려오기
    $(".nav>li").mouseover(function(){
        $(this).children(".submenu").stop().slideDown();
    });
    $(".nav>li").mouseout(function(){
        $(this).children(".submenu").stop().slideUp();
    });
    
    // $(".nav>li").mouseover(function(){
    //     $(".submenu").stop().slideDown();
    // });
    // $(".nav>li").mouseout(function(){
    //     $(".submenu").stop().slideUp();
    // });

    // 이미지 왼쪽으로 슬라이드

    setInterval(slide, 2000);
    let x = $("#imgslide>img");
    let y = 3;

    function slide(){
        y--;
        if(y==0){
            x.fadeIn();
            y=3;
        }else{
            x.eq(y).fadeOut();
        }
    }



}) // 메인