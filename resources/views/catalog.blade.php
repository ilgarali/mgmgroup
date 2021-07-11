@extends('layouts.master')
@section('css')
<link rel="stylesheet" href="{{asset('front/')}}/css/cataloge.css">

<link rel="stylesheet" type="text/css" href="{{asset('front/')}}/dist/zoomslider.css" />
<script type="text/javascript" src="{{asset('front/')}}/dist/modernizr-2.6.2.min.js"></script>

@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
    
<main>
    <div class="content">
       
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
    </div>
    <div class="category">
        @foreach ($categories as $category)
            
        
        <div class="box">
            <div class="top-image">
                  <img src="{{asset('storage/' . $category->image)}}">
            </div>
            <div class="down-text">
                <h3>{{$category->getTranslatedAttribute('category')}}</h3>
                <p>{{$category->getTranslatedAttribute('description')}}</p>
                <a href="{{url($productSlug->getTranslatedAttribute('slug') . '/' . $category->getTranslatedAttribute('slug'))}}">подробнее <span><i class="fas fa-chevron-right"></i></span></a>
            </div>
        </div>
    @endforeach
    </div>
</main>
@endsection
@section('js')
<script type="text/javascript" src="{{asset('front/')}}/dist/jquery.zoomslider.min.js"></script>
    
@endsection