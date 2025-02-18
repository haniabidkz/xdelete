<?php

use function Laravel\Folio\{name};

name('login');
?>

<x-layouts.marketing
    :seo="[
        'title'         => setting('site.title', 'Laravel Wave'),
        'description'   => setting('site.description', 'Software as a Service Starter Kit'),
        'image'         => url('/og_image.png'),
        'type'          => 'website'
    ]">

    <div class="section xdelete-extra-section">
    <div class="container">
        <div class="xdelete-section-title center">
            <h2>Admin Login</h2>
        </div>
        <div class="xdelete-account-wrap">
            <form action="{{ route('auth.login.submit') }}" method="POST">
                @csrf <!-- Laravel CSRF Token -->
                <div class="xdelete-account-field">
                    <label for="email">Enter email address</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="example@gmail.com"
                        value="{{ old('email') }}"
                        required
                    >
                    @error('email')
                        <p class="text-danger" style="color: red; font-size: 0.9rem;">{{ $message }}</p>
                    @enderror
                </div>
                <div class="xdelete-account-field">
                    <label for="password">Enter Password</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter Password"
                        required
                    >
                    @error('password')
                        <p class="text-danger" style="color: red; font-size: 0.9rem;">{{ $message }}</p>
                    @enderror
                </div>
                <!-- <div class="xdelete-account-checkbox-wrap">
                    <div class="xdelete-account-checkbox">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Remember me</label>
                    </div>
                    <a class="forgot-password" href="{{ route('auth.password.request') }}">Forgot password?</a>
                </div> -->
                <button id="xdelete-account-btn" type="submit">
                    <span>Sign in</span>
                </button>
                <!-- <div class="xdelete-or">
                    <p>or</p>
                </div>
                <a href="#" class="xdelete-connect-login">
                    <img src="{{ asset('assets/images/icon/google.svg') }}" alt="">
                    Sign up with Google
                </a>
                <a href="#" class="xdelete-connect-login">
                    <img src="{{ asset('assets/images/icon/facebook.svg') }}" alt="">
                    Sign up with Facebook
                </a>
                <div class="xdelete-account-bottom">
                    <p>Not a member yet? <a href="{{ route('auth.register') }}">Sign up here</a></p>
                </div> -->
            </form>
        </div>
    </div>
</div>



</x-layouts.marketing>