@extends('layouts.master')
@section('css')
<link rel="stylesheet" href="{{asset('front/')}}/css/contact.css">


@endsection
@section('content')
@php
    $lang = Session::get('locale');
@endphp
<main>
    <div class="container">
        <div class="item">
            <div class="text">
                @if (session('success'))
                    <h4 style="background-color: green;color:whitesmoke;padding:20px">{{session('success')}}</h4>
                @endif
                <h3>свяжитесь с нами</h3>
            </div>
            <div class="openmenu2">
                <form method="POST" action="{{route('contact')}}">
                    @csrf
                    <div class="form-group">
                        <label>имя</label>
                        <input name="name" type="text" placeholder="alex mason">
                    </div>
                    <div class="form-group">
                        <label>телефон</label>
                        <input name="number" type="text" placeholder="+994xx">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="email" type="text" placeholder="@">
                    </div>
                    <div class="form-group">
                        <label>комментария</label>
                        <textarea name="message" rows="5"></textarea>
                    </div>
                    <button type="submit">Отправить</button>
                </form>
            </div>
        </div>
        <div class=" item2">
            <div class="image">
                <!-- <img src="./img/kontakt_shekil.png"> -->
                <div class="mapouter">
                    <div class="gmap_canvas"><iframe id="gmap_canvas"
                            src="https://maps.google.com/maps?q=Bak%C4%B1,%20AZ1025,%20Heyd%C9%99r%20%C6%8Fliyev%20prospekti%20115&t=&z=9&ie=UTF8&iwloc=&output=embed"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

@endsection
