$(function(){
    // 각각 목록 내려오기
    $(".gnb>li").mouseover(function(){
        $(this).children(".submenu").stop().slideDown();
    });
    $(".gnb>li").mouseout(function(){
        $(this).children(".submenu").stop().slideUp();
    });

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

    // 사이드 메뉴의 서브 메뉴 - 1024ver
    $(function(){
        $('.btn>a').click(function(){
            let nextP = $(this).next(".menuitemsr");
            if(nextP.is(":visible")){
                nextP.slideUp();
            }else{
                nextP.slideDown();
            }
        })    
            $('.menuitemsr02>a').click(function(){
                let subnext = $(this).next(".menu_submenu2_1");
                if(subnext.is(":visible")){
                    subnext.slideToggle();
                }else{
                    subnext.slideDown();
                }
            })
            $('.menuitemsr03>a').click(function(){
                let subnext = $(this).next(".menu_submenu3_1");
                if(subnext.is(":visible")){
                    subnext.slideToggle();
                }else{
                    subnext.slideDown();
                }
            })
    })

}) // 메인