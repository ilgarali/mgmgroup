
    /* Data VidUp */

    /* Get all elements with data-vidup */
    const vidupElements = document.querySelectorAll('[data-vidup]');

    const modal = document.getElementById('modal');
    const modalVideo = document.getElementById('modal-video');
    const mdc = document.getElementById('mdc');
    const close = document.getElementById('close');

    function closeModal() {
        // mdc.style.width = "0";
        mdc.style.transform = "scale(0)";
        setTimeout(() => {
            modal.style.visibility = "hidden";
            modal.style.opacity = "0";
            modalVideo.src = "";
        }, 500);
    }

    function showModal(element) {
        modal.style.visibility = "visible";
        modal.style.opacity = "1";
        modal.style.background = "#4d4f53";
        modalVideo.src = element.href;
        mdc.style.width = "100%";


        setTimeout(() => {
            mdc.style.transform = "scale(1)";
        }, 300);

    }

    /* Foreach element add an eventlistener and show the popup when clicked and add the src in the link */
    vidupElements.forEach(element => {
        element.addEventListener("click", (e) => {

            e.preventDefault();
            showModal(element);
        });
    });

    if (close) {
        
        close.addEventListener('click', (e) => {
            closeModal();
        });
    
        mdc.addEventListener('click', () => {
            closeModal();
        });
    
        modal.addEventListener('click', () => {
            closeModal();
        });
    }



///swiper
        var swiper = new Swiper(".mySwiper5", {
        slidesPerView: 1,
        spaceBetween: 30,
        breakpoints: {
            600: {
                slidesPerView: 1,
                spaceBetween: 20,
            },
            768: {
                slidesPerView: 2,
                spaceBetween: 30,
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 40,
            },
            1650: {
                slidesPerView: 4,
                spaceBetween: 50,
            }
        },
    });
