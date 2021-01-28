
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/sign_up_screen.dart';
import 'package:get/get.dart';

class AppScreens{

  static final screens = [
    GetPage(name: Routes.SIGNUP_SCREEN,
        page: ()=>SignUpScreen()),

    GetPage(name: Routes.HOME_SCREEN,
        page:()=> HomeScreen()),

    GetPage(name: Routes.LOGIN_SCREEN,
        page: ()=>LoginScreen())

  ];
}