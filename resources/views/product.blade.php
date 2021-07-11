@extends('layouts.master')
@section('css')
<link rel="stylesheet" href="{{asset('front/')}}/css/product.css">


@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
    
<main>
    <div class="swiper-container mySwiper-product">
        <div class="swiper-wrapper">
            @foreach ($productSlides  as $productSlide)
                 
            <div class="swiper-slide"> 
              <div class="container">
                  <div class="items">
                      <div class="left">
                          <h2>{{$productSlide->getTranslatedAttribute('title')}}</h2>
                          <p>{{$productSlide->getTranslatedAttribute('description')}}</p>
                      </div>
                      <div class="right">
                          <img src="{{asset('storage/' . $productSlide->image)}}">
                      </div>
                  </div>
              </div>
            </div>
            @endforeach   
        </div>
        <!-- <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div> -->
    </div>
    <div class="container2">
        <div class="overlay"></div>
        <div class="filter">
            <div class="filter-check">
                <div class="box">
                    <h3>Бренд</h3>

                    @foreach ($brends as $brend)
                    <p>
                        <input type="checkbox">
                        <span>{{$brend->brend}} </span>
                    </p>
                    @endforeach
                   
                 
                </div>
                <div class="box">
                    <h3>HD-Format</h3>
                    @foreach ($formats as $format)
                        
                    <p>
                        <input type="checkbox">
                        <span>{{$format->format}} </span>
                    </p>
                    @endforeach
                 
                </div>
            </div>
            <div class="filter-search">
                <div class="text-search">
                    <h2>IP-видеокамеры</h2>
                    <p> <input type="text" placeholder="искать"> <span><i class="fas fa-search"></i></span></p>
                </div>
                <div class="products">
                    <div class="box">
                        <div class="top-image">
                            <img src="img/kamera-shadowsuz.png">
                        </div>
                        <div class="down-bottom">
                            <h3><a href="product-detail.html">DC-B1803</a></h3>
                            <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в
                                термокожухе</p>
                            <div class="btn">
                                <a class="blue">ЗАПРОС ЦЕНЫ</a>
                                <a class="btn-right" href="#">сравнить</a>
                            </div>
                        </div>
                        <div class="openmenu2">
                            <h3>ЗАПРОС ЦЕНЫ</h3>
                            <p>Milasight 4k DC-3450</p>
                            <form>
                                <div class="form-group">
                                    <label>имя</label>
                                    <input type="text" placeholder="alex mason">
                                </div>
                                <div class="form-group">
                                    <label>телефон</label>
                                    <input type="text" placeholder="+994xx">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" placeholder="@">
                                </div>
                                <div class="form-group">
                                    <label>сообщение</label>
                                    <textarea  rows="4"></textarea>
                                </div>
                                <button type="submit">Отправить</button>
                            </form>
                        </div>
                    </div>
                    <div class="box">
                        <div class="top-image">
                            <img src="img/kamera-shadowsuz.png">
                        </div>
                        <div class="down-bottom">
                            <h3><a href="product-detail.html">DC-B1803</a></h3>
                            <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в
                                термокожухе</p>
                            <div class="btn">
                                <a class="blue">ЗАПРОС ЦЕНЫ</a>
                                <a class="btn-right" href="#">сравнить</a>
                            </div>
                        </div>
                        <div class="openmenu2">
                            <h3>ЗАПРОС ЦЕНЫ</h3>
                            <p>Milasight 4k DC-3450</p>
                            <form>
                                <div class="form-group">
                                    <label>имя</label>
                                    <input type="text" placeholder="alex mason">
                                </div>
                                <div class="form-group">
                                    <label>телефон</label>
                                    <input type="text" placeholder="+994xx">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" placeholder="@">
                                </div>
                                <div class="form-group">
                                    <label>сообщение</label>
                                    <textarea  rows="4"></textarea>
                                </div>
                                <button type="submit">Отправить</button>
                            </form>
                        </div>
                    </div>
                    <div class="box">
                        <div class="top-image">
                            <img src="img/kamera-shadowsuz.png">
                        </div>
                        <div class="down-bottom">
                            <h3><a href="product-detail.html">DC-B1803</a></h3>
                            <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в
                                термокожухе</p>
                            <div class="btn">
                                <a class="blue">ЗАПРОС ЦЕНЫ</a>
                                <a class="btn-right" href="#">сравнить</a>
                            </div>
                        </div>
                        <div class="openmenu2">
                            <h3>ЗАПРОС ЦЕНЫ</h3>
                            <p>Milasight 4k DC-3450</p>
                            <form>
                                <div class="form-group">
                                    <label>имя</label>
                                    <input type="text" placeholder="alex mason">
                                </div>
                                <div class="form-group">
                                    <label>телефон</label>
                                    <input type="text" placeholder="+994xx">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" placeholder="@">
                                </div>
                                <div class="form-group">
                                    <label>сообщение</label>
                                    <textarea  rows="4"></textarea>
                                </div>
                                <button type="submit">Отправить</button>
                            </form>
                        </div>
                    </div>
                    <div class="box">
                        <div class="top-image">
                            <img src="img/kamera-shadowsuz.png">
                        </div>
                        <div class="down-bottom">
                            <h3><a href="product-detail.html">DC-B1803</a></h3>
                            <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в
                                термокожухе</p>
                            <div class="btn">
                                <a class="blue">ЗАПРОС ЦЕНЫ</a>
                                <a class="btn-right" href="#">сравнить</a>
                            </div>
                        </div>
                        <div class="openmenu2">
                            <h3>ЗАПРОС ЦЕНЫ</h3>
                            <p>Milasight 4k DC-3450</p>
                            <form>
                                <div class="form-group">
                                    <label>имя</label>
                                    <input type="text" placeholder="alex mason">
                                </div>
                                <div class="form-group">
                                    <label>телефон</label>
                                    <input type="text" placeholder="+994xx">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" placeholder="@">
                                </div>
                                <div class="form-group">
                                    <label>сообщение</label>
                                    <textarea  rows="4"></textarea>
                                </div>
                                <button type="submit">Отправить</button>
                            </form>
                        </div>
                    </div>
                    <div class="box">
                        <div class="top-image">
                            <img src="img/kamera-shadowsuz.png">
                        </div>
                        <div class="down-bottom">
                            <h3><a href="product-detail.html">DC-B1803</a></h3>
                            <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в
                                термокожухе</p>
                            <div class="btn">
                                <a class="blue">ЗАПРОС ЦЕНЫ</a>
                                <a class="btn-right" href="#">сравнить</a>
                            </div>
                        </div>
                        <div class="openmenu2">
                            <h3>ЗАПРОС ЦЕНЫ</h3>
                            <p>Milasight 4k DC-3450</p>
                            <form>
                                <div class="form-group">
                                    <label>имя</label>
                                    <input type="text" placeholder="alex mason">
                                </div>
                                <div class="form-group">
                                    <label>телефон</label>
                                    <input type="text" placeholder="+994xx">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" placeholder="@">
                                </div>
                                <div class="form-group">
                                    <label>сообщение</label>
                                    <textarea  rows="4"></textarea>
                                </div>
                                <button type="submit">Отправить</button>
                            </form>
                        </div>
                    </div>
                    <div class="box">
                        <div class="top-image">
                            <img src="img/kamera-shadowsuz.png">
                        </div>
                        <div class="down-bottom">
                            <h3><a href="product-detail.html">DC-B1803</a></h3>
                            <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в
                                термокожухе</p>
                            <div class="btn">
                                <a class="blue">ЗАПРОС ЦЕНЫ</a>
                                <a class="btn-right" href="#">сравнить</a>
                            </div>
                        </div>
                        <div class="openmenu2">
                            <h3>ЗАПРОС ЦЕНЫ</h3>
                            <p>Milasight 4k DC-3450</p>
                            <form>
                                <div class="form-group">
                                    <label>имя</label>
                                    <input type="text" placeholder="alex mason">
                                </div>
                                <div class="form-group">
                                    <label>телефон</label>
                                    <input type="text" placeholder="+994xx">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" placeholder="@">
                                </div>
                                <div class="form-group">
                                    <label>сообщение</label>
                                    <textarea  rows="4"></textarea>
                                </div>
                                <button type="submit">Отправить</button>
                            </form>
                        </div>
                    </div>
                    <div class="box">
                        <div class="top-image">
                            <img src="img/kamera-shadowsuz.png">
                        </div>
                        <div class="down-bottom">
                            <h3><a href="product-detail.html">DC-B1803</a></h3>
                            <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в
                                термокожухе</p>
                            <div class="btn">
                                <a class="blue">ЗАПРОС ЦЕНЫ</a>
                                <a class="btn-right" href="#">сравнить</a>
                            </div>
                        </div>
                        <div class="openmenu2">
                            <h3>ЗАПРОС ЦЕНЫ</h3>
                            <p>Milasight 4k DC-3450</p>
                            <form>
                                <div class="form-group">
                                    <label>имя</label>
                                    <input type="text" placeholder="alex mason">
                                </div>
                                <div class="form-group">
                                    <label>телефон</label>
                                    <input type="text" placeholder="+994xx">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" placeholder="@">
                                </div>
                                <div class="form-group">
                                    <label>сообщение</label>
                                    <textarea  rows="4"></textarea>
                                </div>
                                <button type="submit">Отправить</button>
                            </form>
                        </div>
                    </div>
                    <div class="box">
                        <div class="top-image">
                            <img src="img/kamera-shadowsuz.png">
                        </div>
                        <div class="down-bottom">
                            <h3><a href="product-detail.html">DC-B1803</a></h3>
                            <p>8-мегапиксельная корпусная видеокамера для установки внутри помещений или в
                                термокожухе</p>
                            <div class="btn">
                                <a class="blue">ЗАПРОС ЦЕНЫ</a>
                                <a class="btn-right" href="#">сравнить</a>
                            </div>
                        </div>
                        <div class="openmenu2">
                            <h3>ЗАПРОС ЦЕНЫ</h3>
                            <p>Milasight 4k DC-3450</p>
                            <form>
                                <div class="form-group">
                                    <label>имя</label>
                                    <input type="text" placeholder="alex mason">
                                </div>
                                <div class="form-group">
                                    <label>телефон</label>
                                    <input type="text" placeholder="+994xx">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" placeholder="@">
                                </div>
                                <div class="form-group">
                                    <label>сообщение</label>
                                    <textarea  rows="4"></textarea>
                                </div>
                                <button type="submit">Отправить</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="pagination">
                    <ul class="ul-left">
                        <li>
                            <a class="activebtn" href="#">1</a>
                        </li>
                        <li>
                            <a href="#">2</a>
                        </li>
                        <li>
                            <a href="#">3</a>
                        </li>
                        <li>
                            <a href="#">4</a>
                        </li>
                    </ul>
                    <ul class="ul-right">
                        <li style="font-size: 16px; color: rgba(0, 0, 0, 1); margin-right:5px;">
                            Количество на странице:
                        </li>
                        <li>
                            <a class="activebtn" href="#">20</a>
                        </li>
                        <li>
                            <a href="#">40</a>
                        </li>
                        <li>
                            <a href="#">60</a>
                        </li>
                        <li>
                            <a href="#">80</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</main>

@endsection