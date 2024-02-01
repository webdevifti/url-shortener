<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UrlShortener extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            //
            'long_url' => 'required|url'
        ];
    }
    public function messages()
    {
        return [
            'long_url.required' => 'Long Url is required',
            'long_url.url' => 'Long Url should be an url',
        ];
    }
}
