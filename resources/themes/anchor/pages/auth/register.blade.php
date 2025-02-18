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
                <h2>Create Account</h2>
            </div>
            <div class="xdelete-account-wrap">
                <form action="{{ route('auth.register.store') }}" method="POST">
                    @csrf
                    <div class="xdelete-account-field">
                        <label>Enter your full name</label>
                        <input type="text" id="name" name="name" placeholder="Adam Smith" value="{{ old('name') }}">
                        @error('name')
                        <div class="error-message" style="color: red;">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="xdelete-account-field">
                        <label>Enter email address</label>
                        <input type="email" id="email" name="email" placeholder="example@gmail.com" value="{{ old('email') }}">
                        @error('email')
                        <div class="error-message" style="color: red;">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="xdelete-account-field">
                        <label>Enter Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter Password">
                        @error('password')
                        <div class="error-message" style="color: red;">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="xdelete-account-checkbox">
                        <input type="checkbox" id="check">
                        <label for="check">I have read and accept the </label>
                    </div>
                    <button id="xdelete-account-btn" type="submit"><span>Create account</span></button>
                    <div class="xdelete-or">
                        <p>or</p>
                    </div>
                    <a href="#" class="xdelete-connect-login">
                        <img src="assets/images/icon/google.svg" alt="">
                        Sign up with Google
                    </a>
                    <a href="#" class="xdelete-connect-login">
                        <img src="assets/images/icon/facebook.svg" alt="">
                        Sign up with Facebook
                    </a>

                    <div class="xdelete-account-bottom">
                        <p>Already have an account? <a href="{{ route('auth.login') }}">Log in here</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>

</x-layouts.marketing>
