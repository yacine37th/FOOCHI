import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluter_ecom/firebase_options.dart';
import 'package:fluter_ecom/view/foochi_singup.dart';
import 'package:fluter_ecom/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/signup_bindings.dart';
User? currentUser = FirebaseAuth.instance.currentUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // currentUser = FirebaseAuth.instance.currentUser;
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
        // GetPage(
        //     name: "/SignIn",
        //     page: () => const SignIn(),
        //     binding: SignInBinding(),
        //     middlewares: [AuthMiddleware()]),
        // GetPage(
        //     name: "/EmailVerification",
        //     page: () => const EmailVerification(),
        //     binding: EmailVerificationBinding()),
        // GetPage(
        //   name: "/ForgotPassword",
        //   page: () => const ForgotPassword(),
        //   binding: ForgotPasswordBinding(),
        // ),
        // GetPage(
        //   name: "/HomeScreen",
        //   page: () => const HomeScreen(),
        //   binding: HomeScreenBinding(),
        // ),
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
      initialRoute: "/SignUp",
    );
 
  }
}
