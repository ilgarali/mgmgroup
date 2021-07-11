@extends('layouts.master')
@section('css')
<link rel="stylesheet" href="{{asset('front/')}}/css/project-galery.css">


@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
<main>
    <div class="container">
        <div class="back">
           <a href="{{url($projecttSlug->slug)}}" class="circle"><span><i class="fas fa-angle-left"></i></span></a>
           <p> Layihələrə qayıt </p>
        </div>
    </div>
    <div class="content">
        <div class="text ">
            <h3>{{$project->getTranslatedAttribute('title')}} </h3>
             <ul>
                 <li><span><i class="fas fa-user-alt"></i></span> Client: {{$project->client}}</li>
                 <li><span style="padding-left: 2px;"><i class="fas fa-map-marker-alt"></i></span> Place : {{$project->place}}</li>
                 <li><span><i class="far fa-clock"></i></span> Duration : {{$project->duration}}</li>
             </ul>
             <p>
                {{$project->getTranslatedAttribute('text')}}
            </p>
        </div>
    </div>
     <div class="galery">
         @php
         
             $images = json_decode($project->gallery);
             $i = 0;   
         @endphp
            @foreach ($images as $image)
                @if ($i < 2)
                <div class="box @if($i ==1) box2 @endif">
                    <img src="{{asset('storage/' . $image)}}">
                </div>
                @endif
                @php
                    $i++;
                @endphp
            @endforeach
           
          
    </div>
    <div class="galery2">
        @php
            $imageLength = count($images);
        @endphp
        @if ($imageLength > 2)
            
        <div class="left">
            @for ($i = 2; $i < 3; $i++)
                
            <img src="{{asset('storage/' . $images[$i])}}">
            @endfor
        </div>
        @endif
        @if($imageLength > 3)
        <div class="right">
            @for ($i = 3; $i < $imageLength; $i++)
                
            <div class="item-box">
                <img src="{{asset('storage/' . $images[$i])}}">
            </div>
            @endfor
           
        </div>
        @endif
    </div>
</main>
@endsection


