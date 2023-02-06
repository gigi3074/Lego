
// 별점
const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
}
// 사진 업로드 미리보기

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}