import 'package:ecommerce/controller/auth_conroller.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/routes/app_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      getPages: AppScreens.screens,
      initialRoute: Routes.LOGIN_SCREEN,

    );
  }
}
