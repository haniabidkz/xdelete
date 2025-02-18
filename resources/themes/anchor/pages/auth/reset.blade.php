<?php

use function Laravel\Folio\{name};

name('register');
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
        <h2>Reset Password</h2>
      </div>
      <div class="xdelete-account-wrap">
        <form action="{{ route('auth.password.reset.submit') }}" method="POST">
          @csrf

          <input type="hidden" name="token" value="">
          <div class="xdelete-account-field">
            <label>Enter email address</label>
            <input type="email" name="email" placeholder="example@gmail.com" value="{{ old('email') }}" required>
            @error('email')
            <div class="error-message" style="color: red;">{{ $message }}</div>
            @enderror
          </div>
          <div class="xdelete-account-field">
            <label>Enter Password</label>
            <input type="password" name="password" placeholder="Enter Password" required>
            @error('password')
            <div class="error-message" style="color: red;">{{ $message }}</div>
            @enderror
          </div>
          <div class="xdelete-account-field">
            <label>Confirm Password</label>
            <input type="password" name="password_confirmation" placeholder="Confirm Password" required>
          </div>
          <button id="xdelete-account-btn" type="submit"><span>Change password</span></button>
          <div class="xdelete-account-bottom m-0">
            <p>If you didn’t request a password recovery link, please ignore this.</p>
          </div>
        </form>
      </div>
    </div>
  </div>


    </x-layouts.marketing>