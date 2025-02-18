<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;


class TwitterController extends Controller
{
    public function redirectToProvider()
    {
        // dd( env('TWITTER_CONSUMER_SECRET'));
        return Socialite::driver('twitter')->redirect();
    }


    public function handleProviderCallback()
    {
        // dd(Socialite::driver('twitter')->user());

        try {

            $twitterUser = Socialite::driver('twitter')->user();
            $user = User::where('provider_id', $twitterUser->id)->first();
            if($user){
                Auth::login($user, true);
                return redirect()->route('dashboard');
            }

            $user = User::create ([
                'name' => $twitterUser->name,
                'username' => $twitterUser->nickname,
                'email' => $twitterUser->email,
                'provider' => 'twitter',
                'provider_id' => $twitterUser->id,
                'avatar' => $twitterUser->avatar,
                'token' => $twitterUser->token,
                'token_secret' => $twitterUser->tokenSecret,
                'verified' => 1,
                'role_id' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            
            Auth::login($user, true);
            return redirect()->route('dashboard');

        } catch (\Exception $e) {
            Log::info($e->getMessage());
            Log::info($e->getLine());
            // Handle errors, e.g., redirect back with an error message.
            return redirect()->route('/')->withErrors('Unable to login using Twitter.');
        }
    }
}
