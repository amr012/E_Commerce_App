
import 'package:ecommerce/controller/auth_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => AuthViewModel());
  }

}