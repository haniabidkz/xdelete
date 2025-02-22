<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\TwitterController;


Route::impersonate();

// Documentation routes
Route::view('docs/{page?}', 'docs::index')->where('page', '(.*)');

// Additional Auth Routes
Route::get('logout', '\Wave\Http\Controllers\LogoutController@logout')->name('wave.logout');



Route::get('admin/login', '\Wave\Http\Controllers\LoginController@showLoginForm')->name('auth.login');
Route::post('auth/login', '\Wave\Http\Controllers\LoginController@login')->name('auth.login.submit');

Route::get('auth/register', '\Wave\Http\Controllers\LoginController@showRegisterForm')->name('auth.register');
Route::post('/register/store', '\Wave\Http\Controllers\LoginController@register')->name('auth.register.store');

Route::get('auth/password/reset','\Wave\Http\Controllers\LoginController@showResetForm')->name('auth.password.reset');
Route::post('/password/reset','\Wave\Http\Controllers\LoginController@handleReset')->name('auth.password.reset.submit');
// Route::get('user/verify/{verification_code}', '\Wave\Http\Controllers\Auth\RegisterController@verify')->name('verify');
// Route::post('register/complete', '\Wave\Http\Controllers\Auth\RegisterController@complete')->name('wave.register-complete');

Route::view('install', 'wave::install')->name('wave.install');


Route::get('contact-us', '\Wave\Http\Controllers\PageController@contactUs')->name('wave.contact.us');

Route::group(['middleware' => 'auth'], function () {
    Route::redirect('settings', 'settings/profile')->name('settings');

    if (config("wave.billing_provider") == 'paddle') {
        Route::get('settings/invoices/{invoice}', '\Wave\Http\Controllers\SubscriptionController@invoice')->name('wave.paddle.invoice');
    }

    Route::post('notification/read/{id}', '\Wave\Http\Controllers\NotificationController@delete')->name('wave.notification.read');
    Route::post('changelog/read', '\Wave\Http\Controllers\ChangelogController@read')->name('changelog.read');

    /********** Checkout/Billing Routes ***********/
    Route::post('cancel', '\Wave\Http\Controllers\SubscriptionController@cancel')->name('wave.cancel');
    Route::view('checkout/welcome', 'theme::welcome');

    Route::post('subscribe', '\Wave\Http\Controllers\SubscriptionController@subscribe')->name('wave.subscribe');
    Route::post('switch-plans', '\Wave\Http\Controllers\SubscriptionController@switchPlans')->name('wave.switch-plans');
});

Route::get('wave/theme/image/{theme_name}', '\Wave\Http\Controllers\ThemeImageController@show');
Route::get('wave/plugin/image/{plugin_name}', '\Wave\Http\Controllers\PluginImageController@show');
Route::redirect('admin/login', '/auth/login');

Route::get('reset', \Wave\Actions\Reset::class);

/***** Billing Routes *****/
Route::post('webhook/paddle', '\Wave\Http\Controllers\Billing\Webhooks\PaddleWebhook@handler')->middleware('paddle-webhook-signature');
Route::post('webhook/stripe', '\Wave\Http\Controllers\Billing\Webhooks\StripeWebhook@handler');
Route::get('stripe/portal', '\Wave\Http\Controllers\Billing\Stripe@redirect_to_customer_portal')->name('stripe.portal');
Route::redirect('billing', 'settings/subscription')->name('billing');

try {
    if (App\Models\User::first()) {
        /***** Dynamic Page Routes *****/
        foreach (Wave\Page::all() as $page) {
            Route::view($page->slug, 'theme::page', ['page' => $page->toArray()])->name($page->slug);
        }
    }

    // If no users are found, redirect to the installer or dummy page
    if (!App\Models\User::first()) {
        Route::view('/', 'wave::welcome');
    }
} catch (\Illuminate\Database\QueryException $e) {
    // Handle the exception or log it if needed
}



Route::get('login/twitter', [TwitterController::class, 'redirectToProvider'])->name('twitter.login');
Route::get('login/twitter/callback', [TwitterController::class, 'handleProviderCallback'])->name('twitter.callback');
