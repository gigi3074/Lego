$(function(){
    // 좋아요 버튼!
    $(".btnlike i").click(function() {
        $(this).toggleClass("done");
    })
    // 장바구니 버튼!
    $(".btn-ket i").click(function() {
        $(this).toggleClass("done");
    });
    //좋아싫어 좋아 버튼
    $(".like_btn i").click(function() {
      $(this).toggleClass("done");
    })
    // 싫어버튼
    $(".dislike_btn i").click(function() {
      $(this).toggleClass("done");
    })
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
    // 별점
    //   // JQUERY CODE
    //   const drawStar = (target) => {
    //     $(`.star span`).css({ width: `${target.value * 10}%` });
//   }
// 리뷰 버튼 회전
$("re_btn").click(function(){
    $("re_btn i").rotate( 180 );
});



}) // JQUERY

// 상품이미지 클릭시 변경
var big = document.querySelector("#big_img");
var life = document.querySelectorAll(".small");
for(var i =0; i<life.length; i++){
	life[i].addEventListener('click', function(){
		big.setAttribute('src', this.src);
	})
}


// 별점
// JAVASCRIPT CODE
/*var drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
} */   







