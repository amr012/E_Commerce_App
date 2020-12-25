
import 'package:ecommerce/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final String image;
  final String text;
  final Function onPress;
  CustomButtonSocial({this.image,this.text,this.onPress});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        height: 60,
        onPressed: onPress,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(image),
            ),
            CustomText(
              text: text,
            )
          ],
        ));
  }
}
