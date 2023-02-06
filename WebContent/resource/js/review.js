    
$(function(){
    //좋아싫어버튼
    $(".like_btn i").click(function() {
      $(this).toggleClass("done");
    })
    // 싫어버튼
    $(".dislike_btn i").click(function() {
      $(this).toggleClass("done");
    })
});


