export default defineConfig({
    plugins: [
      laravel({
        input: [
          'resources/themes/anchor/assets/css/app.css',
          'resources/themes/anchor/assets/js/app.js', // (If it's purely *your* ES code)
          
          // Or any other CSS you want to bundle
          'resources/themes/anchor/assets-custom/css/bootstrap.min.css',
          'resources/themes/anchor/assets-custom/css/magnific-popup.css',
          'resources/themes/anchor/assets-custom/css/slick.css',
          // etc...
        ],
        refresh: ['resources/themes/anchor/**/*'],
      }),
    ],
  });
  