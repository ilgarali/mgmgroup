///footer date time
    let date=new Date().getFullYear();
    document.querySelector(".copyright p").textContent=`(c) ${date} MGM Security, Bütün haqqlar qorunur.`

////product-detail
const images = document.getElementsByClassName("picture");
const boxlist = document.getElementsByClassName("box")
var count = 0;
function galery(indis) {
    count = indis;
    if (count >= images.length) {
        count = 0;
    }
    else if (count < 0) {
        count = images.length - 1;
    }
    for (i = 0; i < images.length; i++) {
        images[i].classList.remove("activePicture");
        boxlist[i].classList.remove("activeSmall");
    }
    images[count].classList.add("activePicture");
    boxlist[count].classList.add("activeSmall")
}

function sonraki() {
    count++;
    galery(count)
}

////product overlay
let abtn = document.querySelectorAll(".box .btn .blue");
let body = document.querySelector(".overlay")
for (var i = 0; i < abtn.length; i++) {
    const allBtn = abtn[i];
    allBtn.addEventListener("click", function (e) {
        let downBottom = e.target.parentElement.parentElement;
        let topImage = e.target.parentElement.parentElement.previousElementSibling;
        let openMenu2 = e.target.parentElement.parentElement.nextElementSibling;
        openMenu2.style.display = "block"
        openMenu2.style.transition="0.1s"
        body.style.transition="0.1s"
        body.style.display = "block"
        document.querySelector("body").style.overflow = "hidden";

        body.addEventListener("click", function () {
            body.style.display = 'none';
            openMenu2.style.display="none";
            document.querySelector("body").style.overflow = "auto";
        })
        document.querySelector("footer").addEventListener("click",function(){
            body.style.display = 'none';
            openMenu2.style.display="none";
            document.querySelector("body").style.overflow = "auto";
        })
    })

}

////
