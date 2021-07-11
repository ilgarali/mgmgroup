@extends('layouts.master')
@section('css')
<link rel="stylesheet" href="{{asset('front/')}}/css/project.css">


@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
<main>
    <div class="container">
        <div class="title">
            <h3>Наши Проекты</h3>
        </div>
        <div class="project">
            @foreach ($projects as $project)
                
            <div class="item ">
               <a href="{{url($projecttSlug->slug . '/'.$project->slug)}}">
                    <div class="top-img">
                        <img src="{{asset('storage/' . $project->main_image)}}">
                        <div class="hoverTitle">
                            <h3>{{$project->getTranslatedAttribute('title')}} <span><i class="fas fa-long-arrow-alt-right"></i></span></h3>
                            <span class="line"></span>
                        </div>
                    </div>
                </a>
                <div class="text ">
                    <p><span><i class="fas fa-user-alt"></i></span> Client: {{$project->client}}</p>
                    <p><span ><i class="fas fa-map-marker-alt"></i></span>  Place : {{$project->place}}</p>
                </div>
            </div>
            @endforeach
             
        </div>
    </div>
</main>  
@endsection
