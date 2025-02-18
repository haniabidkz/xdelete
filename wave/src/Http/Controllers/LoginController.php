<?php

namespace Wave\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use App\Models\User;
use Illuminate\Support\Facades\Password;
class LoginController extends Controller
{
    public function showLoginForm()
    {
        
        return view('theme::pages.auth.login');
    }

    public function login(Request $request)
    {
        // Validate incoming request data
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        // Attempt authentication with the given credentials
        if (Auth::attempt($credentials, $request->boolean('remember'))) {
            $request->session()->regenerate();

            // Check if 2FA is enabled for the user
            $user = Auth::user();
            if (!is_null($user->two_factor_confirmed_at)) {
                // Redirect to two-factor authentication challenge
                session()->put(['login.id' => $user->getKey()]);
                return redirect()->route('auth.two-factor-challenge');
            }


            // Redirect to the intended route after successful login
            return redirect()->intended(route('admin')); // Adjust 'home' as needed
        }

        // Handle login failure and return validation error
        throw ValidationException::withMessages([
            'email' => __('auth.failed'),
        ]);
    }

    public function showRegisterForm()
    {
        return view('theme::pages.auth.register');
    }
    public function register(Request $request)
    {
        
        // Validate the request data
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string',
        ]);

        // Create the user
        $user = User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'password' => Hash::make($validated['password']),
        ]);

        // Trigger the Registered event
        event(new Registered($user));

        // Log the user in
        Auth::login($user);


        return redirect()->route('verification.notice');


        return redirect()->intended(route('home'));
    }


    public function showResetForm()
    {
        return view('theme::pages.auth.reset');
    }

    public function handleReset(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed', // Ensure there's a password confirmation
        ]);

        $response = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->password = bcrypt($password);
                $user->save();
            }
        );

        return $response == Password::PASSWORD_RESET
            ? redirect()->route('auth.login')->with('status', __('Password has been reset.'))
            : back()->withErrors(['email' => [trans($response)]]);
    }
    // public function logout(Request $request)
    // {
    //     Auth::logout();

    //     $request->session()->invalidate();
    //     $request->session()->regenerateToken();

    //     return redirect('/');
    // }
}
