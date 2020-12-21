import 'package:ecommerce/components/custom_text.dart';
import 'package:ecommerce/components/custom_text_fromfield.dart';
import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
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
                CustomText(text: "Sign", fontSize: 22, color: K.MAIN_COLOR)
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
            SizedBox(height: 30,),
            CustomTextFromField(
              text: "Password",
              hintText: "**********",
              onSaved: (value) {},
              validator: (value) {},
            ),
            SizedBox(height: 15,),
            CustomText(text: "Forget Password?",fontSize: 14,alignment: Alignment.topRight,)
          ],
        ),
      ),
    );
  }
}
