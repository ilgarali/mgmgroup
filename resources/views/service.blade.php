@extends('layouts.master')
@section('css')
<link rel="stylesheet" href="{{asset('front/')}}/css/sevice.css">


@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
<main>
    <div class="container" style="background-image: url('{{asset('storage/' . $service->image)}}')">
        <div class="text">
            <h3>{{$service->getTranslatedAttribute('title')}}</h3>
            <p>{{$service->getTranslatedAttribute('text')}}</p>
        </div>
    </div>
    <div class="container2">
        @foreach ($services as $ser)
            
        <div class="card-item">
            <div class="card-img">
                <img src="{{asset('storage/' . $ser->image)}}">
            </div>
            <div class="card-text">
                <h3>{{$service->getTranslatedAttribute('title')}}</h3>
                <p>{{$service->getTranslatedAttribute('text')}}
                    </p>
            </div>
        </div>
        @endforeach
      
    </div>
</main> 

@endsection
