import 'package:ecommerce/components/Custom_flat_button.dart';
import 'package:ecommerce/components/custom_button_social.dart';
import 'package:ecommerce/components/custom_text.dart';
import 'package:ecommerce/components/custom_text_fromfield.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controller/auth_view_model.dart';
import 'package:ecommerce/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final _controller = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome,",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(SignUpScreen());
                    },
                    child: CustomText(
                        text: "SignUp", fontSize: 22, color: K.MAIN_COLOR),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 40),
                child: CustomText(
                  text: "Sign in to Continue",
                  fontSize: 16,
                  color: K.GREY_COLOR,
                ),
              ),
              CustomTextFromField(
                text: "Email",
                hintText: "amr@gmail.com",
                onSaved: (value) {},
                validator: (value) {},
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFromField(
                text: "Password",
                hintText: "**********",
                onSaved: (value) {},
                validator: (value) {},
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "Forget Password?",
                fontSize: 15,
                alignment: Alignment.topRight,
              ),
              SizedBox(
                height: 10,
              ),
              CustomFlatButton(
                text: "SIGN IN",
                onPress: () {},
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "-OR-",
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 15,
              ),
              CustomButtonSocial(
                image: "assets/images/facebook_icon.png",
                text: "Sign In With Facebook",
                onPress: () {},
              ),
              SizedBox(
                height: 15,
              ),
              CustomButtonSocial(
                image: "assets/images/google_icon.png",
                text: "Sign In With Google       ",
                onPress: () {
                  _controller.googleSignInMethod();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
