@extends('layouts.master')
@section('css')
<link rel="stylesheet" href="{{asset('front/')}}/css/about.css">


@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
<main>
    <div class="content" style="background-image: url('{{asset('storage/' . $companyData->image)}}')">
        <div class="text">
            <h2>{{$companyData->getTranslatedAttribute('title')}}</h2>
            <p>{{$companyData->getTranslatedAttribute('info')}}.</p>
        </div>
    </div>
    <div class="container">
        <div class="left-image">
            <img src="{{asset('storage/' . $companyData->about_image)}}">
        </div>
        <div class="right-text">
            {!! $companyData->getTranslatedAttribute('about_text') !!}
        </div>
    </div>
    <div class="container2">
        <div class="items">
            <div class="left-text">
                {!! $companyData->getTranslatedAttribute('mission_text') !!}
            </div>
            <div class="right-img">
                <img src="{{asset('storage/' . $companyData->mission_image)}}">
            </div>
        </div>
    </div>
    <div class="container-service">
        <div class="service-text">
            <div class="service-content">
                <div class="title">
                    <h3>Наши сервисы и Услуги</h3>
                </div>

                @foreach ($services as $service)
                <div class="icon-text">
                    <div class="left">
                        <img src="{{asset('storage/' . $service->icon)}}">
                    </div>
                    <div class="right">
                        <h4>{{$service->getTranslatedAttribute('title')}}</h4>
                        <p>{{$service->getTranslatedAttribute('description')}} </p>
                    </div>
                </div>
                @endforeach
            
            </div>
        </div>
        <div class="service-img">
            <div class="img1">
                <img src="{{asset('storage/' . $companyData->service_img_1)}}">
            </div>
            <div class="img2">
                <img src="{{asset('storage/' . $companyData->service_img_2)}}">
            </div>
        </div>
    </div>
     <div class="container5">
        <div class="left-img5">
            <img src="{{asset('storage/' . $companyData->principle_image)}}">
        </div>
        <div class="right-text5">
            <div class="service-content5">
                <div class="title">
                    <h3>ГЛАВНЫЙ ПРИНЦИП MGM </h3>
                </div>
                @foreach ($principles as $principle)
                    
                <div class="icon-text2">
                    <div class="left">
                        <img src="{{asset('storage/' . $principle->icon)}}">
                    </div>
                    <div class="right">
                        <h4>{{$principle->getTranslatedAttribute('title')}}</h4>
                        <p>{{$principle->getTranslatedAttribute('text')}}
                        </p>
                    </div>
                </div>
           
                @endforeach
            </div>
        </div>
    </div> 
    <div class="container-partners">
        <h3>наши партнеры</h3>
        <div class="our-partners">
            @foreach ($partners as $partner)
            <div class="box">
                <img src="{{asset('storage/' . $partner->image)}}">
            </div>
            @endforeach
          
        </div>
    </div>
</main>    

@endsection
