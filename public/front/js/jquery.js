
    $(".product-top button").on('click', function () {
        $(this).siblings().removeClass('active-btn')
        $(this).addClass('active-btn');
    })

    $(".milasight").on("click", function () {
        $(".img2").fadeIn()
        $(".img1").fadeOut()
    })

    $(".idis").on("click", function () {
        $(".img1").fadeIn()
        $(".img2").fadeOut()
    })



//// bar click
$(".bar").on("click",function(){
    $(".openmenu").slideDown("slow")
})
$("main").on("click",function () {
    $(".openmenu").slideUp("slow")
})
let a=true;
$(".angle").on("click",function(){
    if(a==true){
        $(".angle i").css({ "transform": "rotate(180deg)", "transition": "0.1s" });
        $(".ulmenu").slideDown("slow")
        a=false
    }else{
        $(".angle i").css({ "transform": "rotate(0deg)", "transition": "0.1s" });
        $(".ulmenu").slideUp("slow");
        a=true
    }  
})


// about and video click product-detail.html
$(".productvideo").css({
    display:"none"
})
$("#video").on("click",function(){
    $(".productvideo").show()
    $(".productAbout").hide()
    $(".changetitle").text("ВИДЕО")
})
$("#about").on("click",function(){
     $(".productAbout").show()
     $(".productvideo").hide()
     $(".changetitle").text("ХАРАКТЕРИСТИКИ")
})



