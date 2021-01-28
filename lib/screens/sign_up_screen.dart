import 'package:ecommerce/components/Custom_flat_button.dart';
import 'package:ecommerce/components/custom_text.dart';
import 'package:ecommerce/components/custom_text_field.dart';
import 'package:ecommerce/controller/sign_up_controller.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpScreen extends StatelessWidget {
  final _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.off(LoginScreen());
              }),
        ),
        body: Obx(() => ModalProgressHUD(
            inAsyncCall: _controller.saving,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Sign Up,",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => CustomTextField(
                          text: "Name",
                          label: 'meroo',
                          onChanged: (v) {
                            _controller.chaneName(v);
                          },
                          errorLabel: _controller.name.error,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(() => CustomTextField(
                          text: "Email",
                          label: 'amr@gmail.com',
                          onChanged: (v) {
                            _controller.changeEmail(v);
                          },
                          errorLabel: _controller.email.error,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(() => CustomTextField(
                          text: "Password",
                          label: '**********',
                          onChanged: (v) {
                            _controller.changePassword(v);
                          },
                          errorLabel: _controller.password.error,
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    CustomFlatButton(
                      text: "SIGN IN",
                      onPress: () {
                        _controller.registerValidation(context);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ))));
  }
}
