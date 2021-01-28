// import 'package:ecommerce/controller/base_controller.dart';
// import 'package:ecommerce/enums/view_state.dart';
// import 'package:ecommerce/model/user_model.dart';
// import 'package:ecommerce/routes/app_routes.dart';
// import 'package:ecommerce/services/auth_services.dart';
// import 'package:get/get.dart';
//
// class AuthController extends BaseController {
//   static AuthController to = Get.find();
//   final _isLogged = false.obs;
//   final _currentUser = Rx<UserModel>();
//   final _services = new AuthServices();
//
//   bool get isLogged => _isLogged.value;
//
//   UserModel get currentUser => _currentUser.value;
//
//   @override
//   void onInit() async {
//     super.onInit();
//     setState(ViewState.busy);
//     ever(_isLogged, handleAuthChanged);
//     // final user = await _services.getCurrentUser();
//     if (user != null) {
//       _currentUser.value = user;
//       _isLogged.value = true;
//     } else {
//       _isLogged.value = false;
//     }
//     setState(ViewState.idle);
//   }
//
//   handleAuthChanged(isLoggedIn) async {
//     await Future.delayed(Duration(seconds: 1));
//     if (isLoggedIn) {
//       Get.offAllNamed(Routes.HOME_SCREEN);
//     } else {
//       Get.offAllNamed(Routes.SIGNUP_SCREEN);
//     }
//   }
//
//   changeLoggedIn(bool isLoggedIn, UserModel user,) async {
//     if (isLoggedIn) {
//       _currentUser.value = user;
//       Get.offAllNamed(Routes.HOME_SCREEN);
//     } else {
//       Get.offAllNamed(Routes.SIGNUP_SCREEN);
//     }
//   }
// }