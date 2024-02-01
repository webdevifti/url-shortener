<?php

namespace App\Http\Controllers;

use App\Http\Requests\UrlShortener;
use App\Models\UrlShortener as ModelsUrlShortener;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UrlShortenerController extends Controller
{
    //

    public function store(UrlShortener $request)
    {
        try {
            $param = $this->generateRandomString(8);
            $data = ModelsUrlShortener::create([
                'user_id' => Auth::id(),
                'long_url' => $request->long_url,
                'short_url' => url('/').'/l/'.$param,
                'short_params' => $param
            ]);
            return response()->json([
                'status' => 'ok',
                'long_url' => $request->long_url,
                'short_url' => $data->short_url
            ]);
        } catch (Exception $e) {
            return  response()->json([
                'status' => 'not_ok',
                'excep' => $e
            ]);;
        }
    }

   
    function generateRandomString($length) {
        $characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
        $randomString = '';
    
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, strlen($characters) - 1)];
        }
    
        return $randomString;
    }

    public function getParams($param){
        if($param == ''){
            return redirect('/');
        }
        $getUrl = ModelsUrlShortener::where('short_params', $param)->first();
        if($getUrl){
            if($getUrl->status == 0){
                echo "This Url is disabled";
                die();
            }
            $getUrl->clicks = $getUrl->clicks + 1;
            $getUrl->save();
            return redirect($getUrl->long_url);
        }
    }
}
