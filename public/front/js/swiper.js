var swiper = new Swiper(".mySwiper1", {
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
        dynamicBullets: true,
    }

});

////
var swiper = new Swiper(".mySwiper", {
    slidesPerView: 1,
    spaceBetween: 10,
    speed: 400,
    spaceBetween: 100,
    autoplay: true,
    disableOnInteraction: true,
    breakpoints: {
        640: {
            slidesPerView: 2,
            spaceBetween: 20,
        },
        768: {
            slidesPerView: 4,
            spaceBetween: 40,
        },
        1024: {
            slidesPerView: 5,
            spaceBetween: 50,
        },
    },
});

// product.html slide
var swiper = new Swiper(".mySwiper-product", {
    spaceBetween: 30,
    centeredSlides: true,
    slidesPerView: 1,
    loop: true,
    speed: 3000,
    autoplay: {
      delay: 4000,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    }
  });