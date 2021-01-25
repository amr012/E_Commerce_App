
import 'package:ecommerce/controller/base_controller.dart';
import 'package:ecommerce/model/validation_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {
 final _auth = FirebaseAuth.instance;

 final _name = ValidationItem().obs;
 final _email = ValidationItem().obs;
 final _password = ValidationItem().obs;
 final _image = Rx<String>();

 ValidationItem get name => _name.value;

 ValidationItem get email => _email.value;

 ValidationItem get password => _password.value;

 String get image => _image.value;

  changeImage(String image){
   _image.value = image;
  }

  chaneName(String name){
   if(name.trim().length > 3 ){
    _name.value = ValidationItem(value: name.trim());
   }
   else {
    _name.value = ValidationItem(error: "Name Should not be less than 3 letters ");
   }
  }

  changeEmail(String email){
   if(email.trim().length > 3 ){
    _email.value = ValidationItem(value: email.trim());
   }
   else{
    _email.value= ValidationItem(error: "Email Should not be less than 3 letters") ;
   }
  }

  changePassword(String password){
   if(password.trim().length > 7){
    _password.value = ValidationItem(value: password);
   }
   else{
    _password.value = ValidationItem(error: "Password Should not be less than 7 letters");
   }
  }

  createUser(String email, String password) {
   try {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
   }
   catch (e) {
    print(e.toString());
   }
  }

}