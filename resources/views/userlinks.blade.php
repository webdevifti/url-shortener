@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <div class="form-content">
                    <div class="form-content-header">{{ __('My Urls') }}</div>

                    <div class="form-content-body">
                        @if ($getLinks->count() > 0)
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Long Url</th>
                                            <th>Short Url</th>
                                            <th>Clicks</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($getLinks as $link)
                                            <tr>
                                                <td>
                                                    <a target="_blank" href="{{ $link->long_url }}">{{ $link->long_url }}</a>
                                                </td>
                                                <td>
                                                    <a target="_blank"
                                                        href="{{ $link->short_url }}">{{ $link->short_url }}</a>
                                                </td>
                                                <td>
                                                    <span class="badge bg-primary mx-3" data-bs-toggle="tooltip"
                                                        data-bs-placement="top" title="Total Clicks">Clicks:
                                                        {{ $link->clicks }}</span>
                                                </td>
                                            </tr>
                                        @endforeach

                                    </tbody>
                                </table>
                            </div>
                        @else
                            <p>No Url Found!</p>
                        @endif
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
