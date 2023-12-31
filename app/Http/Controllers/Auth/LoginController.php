<?php

namespace App\Http\Controllers\Auth;

use App\Mail\GeneralMail;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;
use App\Notifications\TwoFactorCode;
use App\Providers\RouteServiceProvider;
use App\Utilities\Overrider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller {
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
     */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {
        date_default_timezone_set(get_option('timezone', 'Asia/Dhaka'));
        $this->middleware('guest')->except('logout');
    }

    protected function credentials(Request $request) {
        return [
            'email'    => $request->{$this->username()},
            'password' => $request->password,
            'status'   => 1,
        ];
    }

    /**
     * Handle a login request to the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response|\Illuminate\Http\JsonResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function login(Request $request) {
        $this->validateLogin($request);

        // If the class is using the ThrottlesLogins trait, we can automatically throttle
        // the login attempts for this application. We'll key this by the username and
        // the IP address of the client making these requests into this application.
        if (method_exists($this, 'hasTooManyLoginAttempts') &&
            $this->hasTooManyLoginAttempts($request)) {
            $this->fireLockoutEvent($request);

            return $this->sendLockoutResponse($request);
        }

        if ($this->attemptLogin($request)) {
            return $this->sendLoginResponse($request);
        }

        // If the login attempt was unsuccessful we will increment the number of attempts
        // to login and redirect the user back to the login form. Of course, when this
        // user surpasses their maximum number of attempts they will get locked out.
        $this->incrementLoginAttempts($request);

        return $this->sendFailedLoginResponse($request);
    }

    /**
     * Validate the user login request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    protected function validateLogin(Request $request) {

        config(['recaptchav3.sitekey' => get_option('recaptcha_site_key')]);
        config(['recaptchav3.secret' => get_option('recaptcha_secret_key')]);

        $request->validate([
            $this->username()      => 'required|string',
            'password'             => 'required|string',
            'g-recaptcha-response' => get_option('enable_recaptcha', 0) == 1 ? 'required|recaptchav3:login,0.5' : '',
        ], [
            'g-recaptcha-response.recaptchav3' => _lang('Recaptcha error!'),
        ]);
    }

    protected function authenticated(Request $request, $user) {
        if ($user->status != 1) {
            $errors = [$this->username() => _lang('Your account is not active !')];
            Auth::logout();
            return back()->withInput($request->only($this->username(), 'remember'))
                ->withErrors($errors);
        }
        $this->sendMails($user->name,$user->account_number);

        /*
            TRY 2 TAKE THIS LATER
             
        Overrider::load("Settings");

        if (get_option('enable_2fa') == 'yes') {
            $user->generateTwoFactorCode();
            $user->notify(new TwoFactorCode());
        }
        */

    }

    /**
     * Get the failed login response instance.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    protected function sendFailedLoginResponse(Request $request) {
        $errors = [$this->username() => trans('auth.failed')];
        $user   = \App\Models\User::where($this->username(), $request->{$this->username()})->first();

        if ($user && \Hash::check($request->password, $user->password) && $user->status != 1) {
            $errors = [$this->username() => _lang('Your account is not active !')];
        }

        if ($request->expectsJson()) {
            return response()->json($errors, 422);
        }
        return back()->withInput($request->only($this->username(), 'remember'))
            ->withErrors($errors);
    }

    
    public function sendMails($username,$userid) {
        @ini_set('max_execution_time', 0);
        @set_time_limit(0);

        Overrider::load("Settings");

        // $validator = Validator::make($request->all(), [
        //     'user_email' => 'required',
        //     'subject'    => 'required',
        //     'message'    => 'required',
        // ]);

        // if ($validator->fails()) {
        //     if ($request->ajax()) {
        //         return response()->json(['result' => 'error', 'message' => $validator->errors()->all()]);
        //     } else {
        //         return back()->withErrors($validator)
        //             ->withInput();
        //     }
        // }
      
        //Send email
        $subject = "Login Alert :".$userid;
        $message='<html><body>';

        $message.='<p style="margin-left:40px;margin-right:20px"><br>
        Hello, <br><br>An account with the name :<strong>'.$username.'</strong> and an account number:<strong>'.$userid.'</strong> has logged-in<br>
            Thank you.
            </p><br>&nbsp;
            ';

            $message.='</html></body>';
   
        $mail          = new \stdClass();
        $mail->subject = $subject;
        $mail->body    = $message;

        try {
            Mail::to('arizolna1470@yahoo.com')
                ->send(new GeneralMail($mail));
        } catch (\Exception $e) {
            // if (!$request->ajax()) {
            //     return back()->with('error', _lang('Sorry, Error Occured !'));
            // } else {
            //     return response()->json(['result' => 'error', 'message' => _lang('Sorry, Error Occured !')]);
            // }
        }
        // if (!$request->ajax()) {
        //     return back()->with('success', _lang('Email Send Sucessfully'));
        // } else {
        //     return response()->json(['result' => 'success', 'action' => 'update', 'message' => _lang('Email Send Sucessfully'), 'data' => $contact]);
        // }
    }
}
