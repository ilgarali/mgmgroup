@extends('layouts.master')
@section('css')
<link rel="stylesheet" href="{{asset('front/')}}/css/index.css">


@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
    
    <main>
        <div class="slideshow">
            <div class="swiper-container slideContainer mySwiper1">
                <div class="swiper-wrapper">
                    @foreach ($slides as $slide)
                        
                    <div class="swiper-slide slider1">
                        <div class="left-text">
                            <h2>{{$slide->getTranslatedAttribute('title')}}</h2>
                            <p>{{$slide->getTranslatedAttribute('description')}}
                            </p>
                            <a href="#">{{setting('site.read_more_' . $lang)}}</a>
                        </div>
                        <div class="right-img">
                            <p> <img src="{{asset('storage/' . $slide->image)}}"></p>
                        </div>
                    </div>
                    @endforeach
                
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="about">
            <div class="about-top">
                <div class="line"></div>
                <p>{{setting('site.about_us_' . $lang)}}</p>
            </div>
            <div class="about-bottom">
                @php
                    $i = 1;
                @endphp
                @foreach ($about as $a)
                    
               
                <div class="box ">
                    <div class=box-top>
                        <span class="line2"></span>
                        <span class="number">0{{$i}}</span>
                    </div>
                    <h3>{{$a->getTranslatedAttribute('title')}}</h3>
                    <p>{{$a->getTranslatedAttribute('description')}}
                    </p>
                </div>
                @php
                    $i++;
                @endphp
                @endforeach
            </div>
        </div>
        <div class="container">
            @foreach ($services as $service)
                <div class="item">
                    <p><img src="{{asset('storage/' . $service->icon)}}"></p>
                    <h3>{{$service->getTranslatedAttribute('title')}}</h3>
                    <p>{{$service->getTranslatedAttribute('description')}}</p>
                </div>
            @endforeach
            
          
        </div>
        <div class="videoslide">
            <p>Video Galery</p>
            <div class="onevideo">
                @php
                $fVideo = json_decode($featuredVideo->video);
      
            @endphp
                <video id="my-video" class="video-js" controls preload="auto" poster="{{asset('storage/' . $featuredVideo->image)}}"
                    data-setup='' loop>
                    <source src="{{asset('storage/' . $fVideo[0]->download_link)}}"
                        type='video/mp4'>
                </video>
            </div>
            <div class="swiper-container mySwiper5">
                <div class="modal" id="modal">
                    <div class="close"><span class="close" id="close">&times;</span></div>
                    <div class="modal-video-container" id="mdc">
                        <iframe class="video-popup" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen
                            id="modal-video"></iframe>
                    </div>

                </div>
                <div class="swiper-wrapper">
                    @foreach ($videoGalleries as $videoGallery)
                    @php
                        $decode = json_decode($videoGallery->video);
                      
                    @endphp
                    <div class="swiper-slide"><a class="video-banner-link"
                        href="{{asset('storage/' . $decode[0]->download_link)}}"
                        data-vidup>
                        <video class="video-banner"
                            src="{{asset('storage/' . $decode[0]->download_link)}}"
                            autoplay muted replay>
                        </video>
                    </a>
                  </div>
                    @endforeach
                
                
                </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="product-camera">
            <div class="product-top">
                <button type="button" class="active-btn idis">IDIS</button>
                <button type="button" class="milasight">Milasight</button>
            </div>
            <div class="camera-text">
                <h3>Наши бренды</h3>
            </div>
            <div class="product-image">
                <div class="box">
                    <div class="top-img">
                        <img class="img1" src="./img/kamera.png">
                        <img class="img2" src="img/about-us2.png">
                    </div>
                    <div class="down-text">
                        <h3>DC-B1803</h3>
                        <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в термокожухе</p>
                    </div>
                </div>
                <div class="box">
                    <div class="top-img">
                        <img class="img1" src="./img/kamera.png">
                        <img class="img2" src="img/kontakt_shekil.png">
                    </div>
                    <div class="down-text">
                        <h3>DC-B1803</h3>
                        <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в термокожухе</p>
                    </div>
                </div>
                <div class="box">
                    <div class="top-img">
                        <img class="img1" src="./img/kamera.png">
                        <img class="img2" src="img/proyektler3.png">
                    </div>
                    <div class="down-text">
                        <h3>DC-B1803</h3>
                        <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в термокожухе</p>
                    </div>
                </div>
            </div>
            <div class="more">
                <a href="product.html">ПОКАЗАТЬ ВСЕ</a>
            </div>
        </div>
        <div class="partners">
            <div class="text">
                <span></span>
                <p>наши партнеры</p>
            </div>
            <div class="partners-slide">
                <div class="swiper-container mySwiper ">
                    <div class="swiper-wrapper">
                        @foreach ($partners as $partner)
                            
                        <div class="swiper-slide ">
                            <img src="{{asset('storage/' . $partner->image)}}">
                        </div>
                        @endforeach
                       
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </div>
        <div class="our-products">
            <div class="content">
                <div class="left-text">
                    <h3>{{$homeData->getTranslatedAttribute('title')}}</h3>
                    <p>{{$homeData->getTranslatedAttribute('title')}}</p>
                    <a href="cataloge.html">Продукты</a>
                </div>
                <div class="right-image">
                    <img src="{{asset('storage/' . $homeData->image)}}">
                </div>
            </div>
        </div>
    </main>
@endsection
