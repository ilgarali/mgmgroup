<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\PostController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
Route::get('/lang', [MainController::class,'lang']);
Route::post('/contact', [PostController::class,'contact'])->name('contact');

Route::get('/{slug1?}/{slug2?}/{slug3?}/{slug4?}/{slug5?}', [MainController::class, 'slug']);