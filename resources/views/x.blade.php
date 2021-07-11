@extends('layouts.master')
@section('css')
<link rel="stylesheet" type="text/css" href="{{asset('front/')}}/dist/zoomslider.css" />
<script type="text/javascript" src="{{asset('front/')}}/dist/modernizr-2.6.2.min.js"></script>

@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
    
<main>
    <div class="content">
        @php
            $images = json_decode($productSlide->image);
            $nImages = [];
            foreach ($images as $image) {
                $nImages[] = asset('storage/') . '/' . $image;
           }
        @endphp
        <div id="demo-1" data-zs-src='[
            @foreach($nImages as $n)
            "{{$n}}",
            @endforeach
        ]' data-zs-overlay="dots">
            <div class="demo-inner-content">
                <div class="text">
                    <h2>HАШ КАТАЛОГ</h2>
                    <p>Цель – видеонаблюдение в реальном времени, регистрация
                        и запись событий, индикация и уведомление о тревожных событиях</p>
                </div>
            </div>
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
                <a href="product.html">подробнее <span><i class="fas fa-chevron-right"></i></span></a>
            </div>
        </div>
    @endforeach
    </div>
</main>
@section('js')
<script type="text/javascript" src="{{asset('front/')}}/dist/jquery.zoomslider.min.js"></script>
    
@endsection
@endsection
