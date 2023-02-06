$(function(){
    // 좋아요 버튼!
    $(".btn_like i").click(function() {
        $(this).toggleClass("done");
    })
    // 장바구니 버튼!
    $(".btn-ket i").click(function() {
        $(this).toggleClass("done");
    });
    //별점
/*    $(".like_star i").click(function() {
      $(this).toggleClass("done");
    })*/

    // 추천상품 - 슬릭 이미지 슬라이드
    $('.re_slider').slick({
        dots: true,
        infinite: false,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
        ]
      });
    // 본문 접기 펼치기
    // 제품상세정보
    $(".item_btn").click(function(e){
        e.preventDefault();
        $(".item_details").slideToggle();
        $(".item_btn").toggleClass("open");

        if($(".item_btn").hasClass("open")){
            $(".item_btn").find("i").attr("class","fa fa-solid fa-plus")
        }else{
            $(".item_btn").find("i").attr("class","fa-solid fa-minus");
        }
    });
    // 리뷰
    $(".re_btn").click(function(e){
        e.preventDefault();
        $(".review").slideToggle();
        $(".re_btn").toggleClass("open");

        if($(".re_btn").hasClass("open")){
            $(".re_btn").find("i").attr("class","fa fa-solid fa-plus")
        }else{
            $(".re_btn").find("i").attr("class","fa-solid fa-minus");
        }
    });
    // ?
$(window).resize(function(){
    var wWidth = $(window).width();
    if(wWidth > 600){
        $(".nav").removeAttr("style");
    }
});

// 이미지 썸네일
$(function(){
  $(".small").click(function(){           
      var imgPath = $(this).attr("src");     
      $("#big_img").attr({src:imgPath})   
      .hide()                                 
      .fadeIn();                              
      return false;                           
  });
});



}) // JQUERY


// 좋아요 DB연결
/* function likeCheck() {

        var query = {idx : ${vo.idx}}
        
        $.ajax({
            url : "${contextPath}/bGood.bo",
            type: "get",
            data: query,
            success:function(data) {
                location.reload();
            }
        });*/



