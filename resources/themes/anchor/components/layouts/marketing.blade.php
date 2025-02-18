<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>xdelete</title>

    <link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    <!--- End favicon-->

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Raleway:wght@600;700&display=swap" rel="stylesheet">
    <!-- End google font  -->

    @vite([

    'resources/themes/anchor/assets-custom/css/bootstrap.min.css',
    'resources/themes/anchor/assets-custom/css/magnific-popup.css',
    'resources/themes/anchor/assets-custom/css/slick.css',
    'resources/themes/anchor/assets-custom/css/animate.css',
    'resources/themes/anchor/assets-custom/css/fontawesome.css',
    'resources/themes/anchor/assets-custom/css/main.css',
    'resources/themes/anchor/assets-custom/css/app.min.css'
    ])


</head>

<body x-data class="flex flex-col min-h-screen overflow-x-hidden @if($bodyClass ?? false){{ $bodyClass }}@endif" x-cloak>

    <header class="site-header xdelete-header-section" id="sticky-menu">
        <div class="container">
            <nav class="navbar site-navbar">
                <!-- Brand Logo-->
                <div class="brand-logo">
                    <a href="/">
                        <h3>X Delete</h3>
                    </a>
                </div>
                <div class="menu-block-wrapper">
                    <div class="menu-overlay"></div>
                    <nav class="menu-block" id="append-menu-header">
                        <div class="mobile-menu-head">
                            <div class="go-back">
                                <i class="fa fa-angle-left"></i>
                            </div>
                            <div class="current-menu-title"></div>
                            <div class="mobile-menu-close">&times;</div>
                        </div>
                        <ul class="site-menu-main">

                            <li class="nav-item nav-item-has-children">
                                <a href="/" class="nav-link-item drop-trigger">Home</a>

                            </li>
                            <li class="nav-item">
                                <a href="/" class="nav-link-item">About Us</a>
                            </li>

                            <li class="nav-item">
                                <a href="/" class="nav-link-item">Features</a>
                            </li>
                            <li class="nav-item">
                                <a href="/" class="nav-link-item">FAQs</a>
                            </li>
                            <li class="nav-item">
                                <a href="/" class="nav-link-item">Pricing</a>
                            </li>
                        </ul>
                    </nav>
                </div>

                <div class="header-btn header-btn-l1 ms-auto d-none d-xs-inline-flex">


                   

                    <a class="xdelete-default-btn xdelete-header-btn" href="{{ route('twitter.login') }}">
                        <span><svg width="25" height="20" viewBox="0 0 1200 1227" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M714.163 519.284L1160.89 0H1055.03L667.137 450.887L357.328 0H0L468.492 681.821L0 1226.37H105.866L515.491 750.218L842.672 1226.37H1200L714.137 519.284H714.163ZM569.165 687.828L521.697 619.934L144.011 79.6944H306.615L611.412 515.685L658.88 583.579L1055.08 1150.3H892.476L569.165 687.854V687.828Z" fill="white"></path>
                </svg> Sign in with X.com</span>
                    </a>
                </div>
                <!-- mobile menu trigger -->
                <div class="mobile-menu-trigger light">
                    <span></span>
                </div>
                <!--/.Mobile Menu Hamburger Ends-->
            </nav>
        </div>
    </header>

    <main class="flex-grow overflow-x-hidden">
        {{ $slot }}
    </main>

    <script src="{{ asset('assets-custom/js/jquery-3.6.0.min.js') }}"></script>
    <script src="{{ asset('assets-custom/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets-custom/js/menu/menu.js') }}"></script>
    <script src="{{ asset('assets-custom/js/isotope.pkgd.min.js') }}"></script>
    <script src="{{ asset('assets-custom/js/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('assets-custom/js/slick.js') }}"></script>
    <script src="{{ asset('assets-custom/js/countdown.js') }}"></script>
    <script src="{{ asset('assets-custom/js/wow.min.js') }}"></script>
    <script src="{{ asset('assets-custom/js/faq.js') }}"></script>
    <script src="{{ asset('assets-custom/js/app.js') }}"></script>


</body>

</html>