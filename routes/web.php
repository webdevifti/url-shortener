<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\UrlShortenerController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('index');
});


Auth::routes();
Route::middleware(['auth'])->group(function(){
    Route::get('/profile',[HomeController::class, 'userProfile'])->name('user.profile');
});
Route::post('url/store',[UrlShortenerController::class, 'store'])->name('url.store');
Route::get('/l/{param}', [UrlShortenerController::class, 'getParams'])->name('get.param');