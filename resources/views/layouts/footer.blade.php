<footer>
        <div class="foot-logo">
            <img src="./img/mgm_logo_ag.png">
        </div>
        <div class="foot">
            <div class="box">
                <h3>Продукты</h3>
                <p><a href="#">Видеокамеры İP</a></p>
                <p><a href="#">Видeо Аналитика</a></p>
                <p><a href="#">Металлоискатели</a></p>
                <p><a href="#">Турникеты </a></p>
                <p><a href="#">Электронные замки </a></p>
            </div>
            <div class="box">
                <h3>Cервис и Услуги </h3>
                <p><a href="#">Установка</a></p>
                <p><a href="#">Сервис</a></p>
                <p><a href="#">Гарантия</a></p>
            </div>
            <div class="box">
                <h3>Контакты</h3>
                <p><a href="tel:(+994 12) 480 18 12">Tel.: (+994 12) 480 18 12</a></p>
                <p><a href="tel:+994 (50) 444 93 33">Mob.: (+994 50) 444 93 33</a></p>
                <p><a href="mailto: info@mgmgroup.az"> info@mgmgroup.az</a></p>
            </div>
            <div class="box">
                <h3>Место положение</h3>
                <p><a target="_blank"
                        href="http://maps.google.com/maps?q=Bakı, AZ1025, Heydər Əliyev prospekti 115"><span><i
                                class="fas fa-map-marker-alt"></i></span> Bakı, AZ1025, Heydər Əliyev prospekti 115</a>
                </p>
                <div class="mapouter">
                    <div class="gmap_canvas">
                        <iframe id="gmap_canvas"
                            src="https://maps.google.com/maps?q=Bak%C4%B1,%20AZ1025,%20Heyd%C9%99r%20%C6%8Fliyev%20prospekti%20115&t=&z=9&ie=UTF8&iwloc=&output=embed">
                        </iframe>
                    </div>
                </div>
                <div class="icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p></p>
        </div>
    </footer>
</body>

</html>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="{{asset('front/')}}/js/script.js"></script>
<script src="{{asset('front/')}}/js/swiper.js"></script>
<script src="{{asset('front/')}}/js/jquery.js"></script>
<script src="{{asset('front/')}}/js/modal-video.js"></script>
@yield('js')
<script type="text/javascript">

    $('.lang').click(function(){

        let lang = $(this).attr('id');
        console.log(lang);
        let url = window.location.href;
        console.log(lang);
        $.ajax({
          url: "/lang",
          method: "GET",
          data: {
            lang:lang,
            url:url,
          },
          success: function(data) {
            console.log(data);
            window.location.replace(data);
          }
        });
    });
</script>