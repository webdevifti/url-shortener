@extends('layouts.app')
@section('myStyles')
    <style>
        .response-error {
            display: none;
        }

        #afterUrlGeneratedCard {
            display: none;
        }

        .fa-copy {
            font-size: 20px;
            margin-right: 20px;
            cursor: pointer;
            color: rgb(180, 180, 180);
        }

        .fa-copy:hover {
            color: black;
        }
      
    </style>
@endsection
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="text-center">
                    <h3> Short URLs</h3>
                    <p>{{env('APP_NAME')}} is the World's Shortest Link Shortener service to track, brand, and share short URLs.</p>
                    <a href="{{ route('register') }}" class="action-btn get-started-btn">Get Started</a>
                </div>
                <div class="form-content">
                    <div class="form-content-body">
                        <form>
                            <span class="text-danger mb-2 mt-1 response-error"></span>
                            <div class="form-group d-flex align-items-center justify-content-between gap-3">
                                <input type="text" class="form-control @error('long_url') is-invalid @enderror"
                                    placeholder="Enter a link to shorten it." name="long_url" id="long_url">
                                <button type="button" onclick="urlShortener()" class="shorten-btn">Shorten Url</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="result-content mt-3" id="afterUrlGeneratedCard">
                    <div class="result-content-body">
                        <div class="d-flex align-items-center justify-content-between border">
                            <a href="" target="_blank" class="d-block p-2" id="generated_short_url"></a>
                            <i class="fa fa-copy" onclick="copyUrl()"></i>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection


@section('myScripts')
    <script>
        function urlShortener() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            let long_url = document.getElementById('long_url');
            if (long_url.value != '') {
                $.ajax({
                    url: "{{ route('url.store') }}",
                    type: 'POST',
                    data: {
                        long_url: long_url.value,
                    },
                    success: function(res) {
                        if (res.status === 'ok') {
                            $('#generated_short_url').text(res.short_url);
                            $('#generated_short_url').attr('href', res.short_url);
                            $('#afterUrlGeneratedCard').css('display', 'block');
                            long_url.value = '';
                        }
                        if (res.status === 'not_ok') {
                            $('.response-error').css('display', 'block');
                            $('.response-error').text(res.excep);
                        }
                    },
                    error: function(error) {
                        console.log('Ajax request failed:', error);
                    }
                });
            }
        }

        function copyUrl() {
            var anchorText = document.getElementById('generated_short_url').innerText;
            var tempInput = document.createElement('input');
            tempInput.setAttribute('value', anchorText);
            document.body.appendChild(tempInput);

            tempInput.select();
            tempInput.setSelectionRange(0, 99999);

            document.execCommand('copy');
            document.body.removeChild(tempInput);
            alert('Text copied: ' + anchorText);
        }
    </script>
@endsection
