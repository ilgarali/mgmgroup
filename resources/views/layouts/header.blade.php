<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    @yield('css')
    <link rel="stylesheet" href="{{asset('front/')}}/css/allheader.css">
   
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- fonts -->
    <!-- <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet"> -->
    <!-- <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet"> -->
    <!--  -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
</head>

<body>
    <header>
        <div class="header-top">
            <ul class="left-head">
                <div class="logo">
                    <a href="index.html">
                        <img src="./img/mgm_logo_ag.png">
                    </a>
                </div>
                @foreach ($slugs as $slug)
                  
                    <li   @if ($slug->widget == 'product') class="dropbtn"     @endif>
                        <a href="{{url($slug->getTranslatedAttribute('slug'))}}">{{$slug->getTranslatedAttribute('menu')}}
                            @if ($slug->widget == 'product')    <span><i class="fas fa-chevron-down"></i></span>@endif
                        </a>
                        @if ($slug->widget == 'product')
                        <ul class="dropdown">
                            @foreach ($categories as $cat)
                            <li>
                                <a href="{{ url($slug->getTranslatedAttribute('slug') . '/' . $cat->getTranslatedAttribute('slug')) }}">{{$cat->getTranslatedAttribute('category')}}</a>
                            </li>
                            @endforeach
                          
                         
                        </ul>
                        @endif
                    </li>
                
                @endforeach
              
             
               
            </ul>
            <div class="mobil-logo">
                <a href="index.html">
                    <img src="./img/mgm_logo_ag.png">
                </a>
            </div>
            <div class="right-head">
                <ul>
                    <li class="right-line">
                        <div class="number"><span>2</span></div>
                        <a href="#">
                            <svg width="24" height="24" viewBox="0 0 19 19" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0)">
                                    <path
                                        d="M6.57658 11.1995H0.267578V12.9995H6.57658V15.6995L10.1676 12.0995L6.57658 8.49951V11.1995Z"
                                        fill="white" />
                                    <path
                                        d="M11.9587 5.79961V3.09961L8.36768 6.69962L11.9587 10.2996V7.59962H18.2677V5.79961H11.9587Z"
                                        fill="white" />
                                </g>
                                <defs>
                                    <clipPath id="clip0">
                                        <rect width="18" height="18" fill="white"
                                            transform="translate(0.267578 0.399902)" />
                                    </clipPath>
                                </defs>
                            </svg>
                        </a>
                        <div class="compare-basket">
                            <div class="compare-cards">
                                <div class="product-card">
                                    <div class="text-card">
                                        <span><i class="far fa-times-circle"></i></span>
                                        <h4>DC-B1803</h4>
                                        <p>8-мегапиксельная корпусная видеокамера</p>
                                    </div>
                                    <div class="img-card">
                                        <img src="./img/about-us2.png">
                                    </div>
                                </div>
                                <div class="product-card">
                                    <div class="text-card">
                                        <span><i class="far fa-times-circle"></i></span>
                                        <h4>DC-B1803</h4>
                                        <p>8-мегапиксельная корпусная видеокамера</p>
                                    </div>
                                    <div class="img-card">
                                        <img src="./img/about-us2.png">
                                    </div>
                                </div>
                            </div>
                            <div class="card-btn">
                                <a href="comparetion.html">сравнить</a>
                            </div>
                        </div>
                    </li>
                    <li class="hover-language">
                       
                        @if (Session::get('locale') == 'ru')
                        <a style="padding-bottom: 20px;">ru <span
                            style="font-size: 12px; margin-left: 2px; font-weight: 100;"><i
                                class="fas fa-chevron-down"></i></span></a> 
                        @elseif(Session::get('locale') == 'az')
                        <a style="padding-bottom: 20px;">az <span
                            style="font-size: 12px; margin-left: 2px; font-weight: 100;"><i
                                class="fas fa-chevron-down"></i></span></a> 
                        @elseif(Session::get('locale') == 'en')
                        <a style="padding-bottom: 20px;">en <span
                            style="font-size: 12px; margin-left: 2px; font-weight: 100;"><i
                                class="fas fa-chevron-down"></i></span></a>
                        @endif
                    
                     
                                        
                        <ul class="dropdown-language">
                            @if (Session::get('locale') !== 'en')
                            <li>
                                <a class="lang"  id="en" href="#">en</a>
                            </li>
                            @endif
                            @if (Session::get('locale') !== 'ru')
                            <li>
                                <a class="lang"  id="ru" href="#">ru</a>
                            </li>
                            @endif
                            @if (Session::get('locale') !== 'az')
                            <li>
                                <a class="lang" id="az" href="#">az</a>
                            </li>
                            @endif
                        </ul>
                    </li>
                    <li class="bar">
                        <a>
                            <i class="fas fa-bars"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="openmenu">
            <div class="header-left-mobil">
                <ul>
                    <li>
                        <a href="index.html">Главная страница</a>
                    </li>
                    <li class="limenu">
                        <a href="cataloge.html">Продукты</a>
                        <a class="angle"><i class="fas fa-angle-down"></i></a>
                    </li>
                    <ul class="ulmenu">
                        <li>
                            <a href="#">Видеокамеры İP</a>
                        </li>
                        <li>
                            <a href="#">Видеокамеры HD-TVI</a>
                        </li>
                        <li>
                            <a href="#">Видeо Аналитика</a>
                        </li>
                        <li>
                            <a href="#">Металлоискатели </a>
                        </li>
                        <li>
                            <a href="#">ТУРНИКЕТЫ</a>
                        </li>
                        <li>
                            <a href="#"> ЭЛЕКТРОННЫЕ ЗАМКИ</a>
                        </li>
                        <li>
                            <a href="#">Аудио Системы </a>
                        </li>
                        <li>
                            <a href="#">Сетевое оборудование </a>
                        </li>
                        <li>
                            <a href="#"> Телефония</a>
                        </li>
                        <li>
                            <a href="#">Агро Промышенное
                                оборудование</a>
                        </li>
                        <li>
                            <a href="#"> Система Аблой Клик </a>
                        </li>
                        <li>
                            <a href="#"> Контроль доступа</a>
                        </li>
                    </ul>
                    <li>
                        <a href="about.html">О компании </a>
                    </li>
                    <li>
                        <a href="project.html">Наши проекты </a>
                    </li>
                    <li>
                        <a href="service.html">сервис и Услуги</a>
                    </li>
                    <li>
                        <a href="contact.html">Контакты</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>