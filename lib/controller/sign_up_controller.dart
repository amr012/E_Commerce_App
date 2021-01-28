import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/auth_conroller.dart';
import 'package:ecommerce/controller/base_controller.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/model/validation_item.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:ecommerce/utilis/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {
  AuthServices authServices = new AuthServices();

  final _name = ValidationItem().obs;
  final _email = ValidationItem().obs;
  final _password = ValidationItem().obs;
  final _image = Rx<String>();
  RxBool _saving = false.obs;

  ValidationItem get name => _name.value;

  ValidationItem get email => _email.value;

  ValidationItem get password => _password.value;

  String get image => _image.value;

  bool get saving => _saving.value;

  changeImage(String image) {
    _image.value = image;
  }

  chaneName(String name) {
    if (name.trim().length > 3) {
      _name.value = ValidationItem(value: name.trim());
    } else {
      _name.value =
          ValidationItem(error: "Name Should not be less than 3 letters ");
    }
  }

  changeEmail(String email) {
    if (email.trim().length > 3) {
      _email.value = ValidationItem(value: email.trim());
    } else {
      _email.value =
          ValidationItem(error: "Email Should not be less than 3 letters");
    }
  }

  changePassword(String password) {
    if (password.trim().length > 7) {
      _password.value = ValidationItem(value: password);
    } else {
      _password.value =
          ValidationItem(error: "Password Should not be less than 7 letters");
    }
  }

  registerValidation(BuildContext context) async {
    if (_name.value.isValid() &&
        _email.value.isValid() &&
        _password.value.isValid()) {
      _saving.value = true;
      UserModel user = await authServices.register(UserModel(
          name: _name.value.value,
          email: _email.value.value,
          password: _password.value.value));
      _saving.value = false;
      // AuthController.to.changeLoggedIn(true, user);
    } else {
      Utility.displayErrorAlert(
          "Enter The Value Correctly!", "Wrong Value", context);
    }
  }
}
