<?php

namespace App\Http\Controllers;

use App\Models\UrlShortener;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function userProfile()
    {
        $getLinks = UrlShortener::where('user_id', Auth::id())->get();
        return view('userlinks', compact('getLinks'));
    }

}
