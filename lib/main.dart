import 'package:animate_do/animate_do.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluter_ecom/firebase_options.dart';
import 'package:fluter_ecom/utils/onboarding_bindings.dart';
import 'package:fluter_ecom/utils/signup_phone_bindings.dart';
import 'package:fluter_ecom/view/foochi_singup.dart';
import 'package:fluter_ecom/view/home.dart';
import 'package:fluter_ecom/view/signin.dart';
import 'package:fluter_ecom/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'middleware/app_oppend.dart';
import 'middleware/auth_middleware.dart';
import 'theme/assets.dart';
import 'theme/main_colors.dart';
import 'utils/forgot_password_bindings.dart';
import 'utils/signup_bindings.dart';
import 'utils/singin_bindings.dart';
import 'utils/verify_email_bindings.dart';
import 'view/foochi_onboarding_view.dart';
import 'view/forgot_password.dart';
import 'view/phone_singup.dart';
import 'view/verify_email.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
SharedPreferences? sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // currentUser = FirebaseAuth.instance.currentUser;
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter-ecom',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      // theme: Themes.customLightTheme,
      // textDirection: MainFunctions.textDirection, 
      getPages: [
        GetPage(
          name: "/SignUp",
          page: () => const SignUp(),
          binding: SignUpBinding(),
        ),
        GetPage(
            name: "/SignIn",
            page: () => const SignIn(),
            binding: SignInBinding(),
            // middlewares: [AuthMiddleware()]
            ),
        GetPage(
            name: "/EmailVerification",
            page: () => const EmailVerification(),
            binding: EmailVerificationBinding()),
        GetPage(
          name: "/ForgotPassword",
          page: () => const ForgotPassword(),
          binding: ForgotPasswordBinding(),
        ),
        GetPage(
            name: "/OnboardingView",
            page: () => const FoochiOnboardingView(),
            binding: OnboardingBindings(),
            middlewares: [AppIsOppen()]),
        GetPage(
          name: "/",
          page: () => const Home(),
          // binding: HomeScreenBinding(),
        ),
        GetPage(
          name: "/PhoneSignup",
          page: () => const PhoneSignUp(),
          binding: SignUpPhoneBindings(),
        ),
        // GetPage(
        //   name: "/Tasnifat",
        //   page: () => const Tasnifat(),
        //   binding: TasnifatBinding(),
        // ),
        // GetPage(
        //   name: "/BookDetails",
        //   page: () => const BookDetails(),
        //   binding: BookDetailsBinding(),
        // ),
        // GetPage(
        //   name: "/BookContent",
        //   page: () => const BookContent(),
        // ),
        // GetPage(
        //   name: "/RequestedBooks",
        //   page: () => const RequestedBooks(),
        //   binding: RequestedBooksBinding(),
        // ),
        // GetPage(
        //   name: "/SearchScreen",
        //   page: () => const SearchScreen(),
        //   transition: Transition.fadeIn,
        //   transitionDuration: const Duration(milliseconds: 250),
        //   binding: SearchBinding(),
        // ),
        // GetPage(
        //   name: "/AuthorScreen",
        //   page: () => const AuthorScreen(),
        //   binding: AuthorScreenBinding(),
        // ),
        // GetPage(
        //   name: "/OrderBook",
        //   page: () => const OrderBook(),
        //   binding: OrderBookBinding(),
        // ),
      ],
      initialRoute: "/OnboardingView",
    );
  }
}

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+213";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.kAppLogo,
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.pushNamed(context, 'verify');
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.kAppLogo,
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: Text("Verify Phone Number")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



 