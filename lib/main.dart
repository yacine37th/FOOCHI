import 'package:animate_do/animate_do.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluter_ecom/firebase_options.dart';
import 'package:fluter_ecom/theme/themes.dart';
import 'package:fluter_ecom/utils/more_food_bindings.dart';
import 'package:fluter_ecom/utils/onboarding_bindings.dart';
import 'package:fluter_ecom/utils/signup_phone_bindings.dart';
import 'package:fluter_ecom/view/foochi_singup.dart';
import 'package:fluter_ecom/view/home.dart';
import 'package:fluter_ecom/view/more_food.dart';
import 'package:fluter_ecom/view/signin.dart';
import 'package:fluter_ecom/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import 'functions/functions.dart';
import 'middleware/app_oppend.dart';
import 'middleware/auth_middleware.dart';
import 'model/user_model.dart';
import 'theme/assets.dart';
import 'theme/main_colors.dart';
import 'utils/forgot_password_bindings.dart';
import 'utils/home_bindings.dart';
import 'utils/signup_bindings.dart';
import 'utils/singin_bindings.dart';
import 'utils/verify_email_bindings.dart';
import 'view/foochi_onboarding_view.dart';
import 'view/forgot_password.dart';
import 'view/phone_singup.dart';
import 'view/verify_email.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
SharedPreferences? sharedPreferences;
UserModel currentUserInfos =
    UserModel(uID: "", email: "", name: "", foodFavoris: [""]);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    await MainFunctions.getcurrentUserInfos();
  }
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
            middlewares: [AuthMiddleware()]),
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
          page: () => Home(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/PhoneSignup",
          page: () => const PhoneSignUp(),
          binding: SignUpPhoneBindings(),
        ),
        GetPage(
          name: "/MoreFood",
          page: () => const MoreFood(),
          binding: MoreFoodBindings(),
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

class APP extends StatefulWidget {
  const APP({super.key});

  @override
  State<APP> createState() => _APPState();
}

class _APPState extends State<APP> {
  final _controller00 = ValueNotifier<bool>(false);
  final _controller01 = ValueNotifier<bool>(false);
  final _controller02 = ValueNotifier<bool>(false);
  final _controller03 = ValueNotifier<bool>(false);
  final _controller04 = ValueNotifier<bool>(false);
  final _controller05 = ValueNotifier<bool>(false);
  final _controller06 = ValueNotifier<bool>(false);
  final _controller07 = ValueNotifier<bool>(false);
  final _controller08 = ValueNotifier<bool>(false);
  final _controller09 = ValueNotifier<bool>(false);
  final _controller10 = ValueNotifier<bool>(false);
  final _controller11 = ValueNotifier<bool>(false);
  final _controller12 = ValueNotifier<bool>(false);
  final _controller13 = ValueNotifier<bool>(false);
  final _controller14 = ValueNotifier<bool>(false);
  final _controller15 = ValueNotifier<bool>(false);
  bool _enabled = false;
  bool _themeDark = false;

  @override
  void initState() {
    super.initState();

    _controller00.addListener(() {
      setState(() {
        if (_controller00.value) {
          _themeDark = true;
        } else {
          _themeDark = false;
        }
      });
    });
  }

  Widget _buildLabel(String value) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
        bottom: 5,
      ),
      child: Text(
        '$value',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller01.dispose();
    _controller02.dispose();
    _controller03.dispose();
    _controller04.dispose();
    _controller05.dispose();
    _controller06.dispose();
    _controller07.dispose();
    _controller08.dispose();
    _controller09.dispose();
    _controller10.dispose();
    _controller11.dispose();
    _controller12.dispose();
    _controller13.dispose();
    _controller14.dispose();
    _controller15.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Switch Example'),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 40,
            ),
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLabel('Switch Theme'),
                AdvancedSwitch(
                  controller: _controller00,
                  thumb: ValueListenableBuilder<bool>(
                    valueListenable: _controller00,
                    builder: (_, value, __) {
                      return Icon(
                          value ? Icons.lightbulb : Icons.lightbulb_outline);
                    },
                  ),
                ),
                UnconstrainedBox(
                  child: AdvancedSwitch(
                    controller: _controller01,
                    width: 110,
                    enabled: false,
                    inactiveColor: Colors.red,
                    activeColor: Colors.green,
                    activeChild: Text(
                      'File selected',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    inactiveChild: Text(
                      'No File Selected',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                _buildLabel('Default Switch'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AdvancedSwitch(
                      controller: _controller01,
                    ),
                    SizedBox(width: 25),
                    AdvancedSwitch(
                      controller: _controller01,
                      thumb: ValueListenableBuilder<bool>(
                        valueListenable: _controller01,
                        builder: (_, value, __) {
                          return Icon(value
                              ? Icons.cloud_upload
                              : Icons.cloud_download);
                        },
                      ),
                    ),
                  ],
                ),
                _buildLabel('Disabled Switch'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AdvancedSwitch(
                      enabled: _enabled,
                      controller: ValueNotifier(false),
                    ),
                    SizedBox(width: 25),
                    AdvancedSwitch(
                      enabled: _enabled,
                      controller: ValueNotifier(true),
                    ),
                    SizedBox(width: 25),
                    ElevatedButton(
                      onPressed: () => setState(() => _enabled = !_enabled),
                      child: Text('Enable/Disable'),
                    )
                  ],
                ),
                _buildLabel('Color/Icon/Image Switch'),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdvancedSwitch(
                      activeColor: Colors.yellow,
                      inactiveColor: Colors.indigo,
                      activeChild: Text('Yellow'),
                      inactiveChild: Text('Indigo'),
                      width: 80,
                      controller: _controller03,
                    ),
                    AdvancedSwitch(
                      activeChild: Icon(
                        Icons.terrain,
                        color: Colors.blue,
                      ),
                      inactiveChild: Icon(Icons.cloud),
                      activeColor: Colors.yellowAccent,
                      inactiveColor: Colors.deepPurple,
                      width: 60,
                      controller: _controller15,
                    ),
                    AdvancedSwitch(
                      controller: _controller13,
                      activeImage: AssetImage('assets/images/day_sky.png'),
                      inactiveImage: AssetImage('assets/images/night_sky.jpg'),
                    ),
                    AdvancedSwitch(
                      controller: _controller14,
                      width: 80,
                      activeChild: Text('DAY'),
                      inactiveChild: Text('NIGHT'),
                      activeImage: AssetImage('assets/images/day_sky.png'),
                      inactiveImage: AssetImage('assets/images/night_sky.jpg'),
                    ),
                  ],
                ),
                _buildLabel('ON/OFF Switch'),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdvancedSwitch(
                      activeChild: Text('1'),
                      inactiveChild: Text('0'),
                      width: 70,
                      controller: _controller02,
                    ),
                    AdvancedSwitch(
                      activeChild: Text('ON'),
                      inactiveChild: Text('OFF'),
                      borderRadius: BorderRadius.circular(5),
                      width: 76,
                      controller: _controller04,
                    ),
                    AdvancedSwitch(
                      activeChild: Text('true'),
                      inactiveChild: Text('false'),
                      borderRadius: BorderRadius.zero,
                      width: 76,
                      controller: _controller05,
                    ),
                  ],
                ),
                _buildLabel('XXS/XS Switch'),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdvancedSwitch(
                      width: 16,
                      height: 8,
                      controller: _controller06,
                    ),
                    AdvancedSwitch(
                      width: 32,
                      height: 16,
                      controller: _controller07,
                    ),
                  ],
                ),
                _buildLabel('S/M/L Switch'),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdvancedSwitch(
                      width: 48,
                      height: 24,
                      controller: _controller08,
                    ),
                    AdvancedSwitch(
                      width: 56,
                      height: 28,
                      controller: _controller09,
                    ),
                    AdvancedSwitch(
                      width: 72,
                      height: 36,
                      controller: _controller10,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ],
                ),
                _buildLabel('XL/XXL Switch'),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdvancedSwitch(
                      width: 96,
                      height: 48,
                      controller: _controller11,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    AdvancedSwitch(
                      width: 112,
                      height: 56,
                      controller: _controller12,
                      borderRadius: BorderRadius.circular(29),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
// class CustomLiteRollingSwitch extends StatefulWidget {
//   const CustomLiteRollingSwitch({super.key});

//   @override
//   State<CustomLiteRollingSwitch> createState() =>
//       _CustomLiteRollingSwitchState();
// }

// class _CustomLiteRollingSwitchState extends State<CustomLiteRollingSwitch> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: LiteRollingSwitch(
//           value: true,
//           // textOn: 'disponible',
          
//           // textOff: 'ocupado',
//           animationDuration: Duration(milliseconds: 250),
//           colorOn: Colors.greenAccent[700]!,
//           colorOff: Colors.redAccent[700]!,
//           iconOn: Icons.done,
//           iconOff: Icons.remove_circle_outline,
//           textSize: 16.0,
//           onChanged: (bool state) {
//             //Use it to manage the different states
//             print('Current State of SWITCH IS: state');
//           },
//           onTap: () {},
//           onDoubleTap: () {},
//           onSwipe: () {},
//         ),
//       ),
//     );
//   }
// }

// class MyPhone extends StatefulWidget {
//   const MyPhone({Key? key}) : super(key: key);

//   @override
//   State<MyPhone> createState() => _MyPhoneState();
// }

// class _MyPhoneState extends State<MyPhone> {
//   TextEditingController countryController = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     countryController.text = "+213";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 AppAssets.kAppLogo,
//                 width: 150,
//                 height: 150,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 "Phone Verification",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "We need to register your phone without getting started!",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: countryController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       "|",
//                       style: TextStyle(fontSize: 33, color: Colors.grey),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: TextField(
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Phone",
//                       ),
//                     ))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.green.shade600,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'verify');
//                     },
//                     child: Text("Send the code")),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyVerify extends StatefulWidget {
//   const MyVerify({Key? key}) : super(key: key);

//   @override
//   State<MyVerify> createState() => _MyVerifyState();
// }

// class _MyVerifyState extends State<MyVerify> {
//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(30, 60, 87, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: Container(
//         margin: EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 AppAssets.kAppLogo,
//                 width: 150,
//                 height: 150,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 "Phone Verification",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "We need to register your phone without getting started!",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Pinput(
//                 length: 6,
//                 // defaultPinTheme: defaultPinTheme,
//                 // focusedPinTheme: focusedPinTheme,
//                 // submittedPinTheme: submittedPinTheme,

//                 showCursor: true,
//                 onCompleted: (pin) => print(pin),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.green.shade600,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () {},
//                     child: Text("Verify Phone Number")),
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           'phone',
//                           (route) => false,
//                         );
//                       },
//                       child: Text(
//                         "Edit Phone Number ?",
//                         style: TextStyle(color: Colors.black),
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

