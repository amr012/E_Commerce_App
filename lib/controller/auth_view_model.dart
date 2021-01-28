
import 'package:ecommerce/controller/base_controller.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends BaseController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  AuthServices _services = new AuthServices();

  facebookSignInMethod() async {
  FacebookLoginResult result = await _facebookLogin.logIn(['email']);

  final accessToken = result.accessToken.token;
  if(result.status == FacebookLoginStatus.loggedIn){
    final faceCrdential = FacebookAuthProvider.credential(accessToken);
    await _auth.signInWithCredential(faceCrdential);
  }
  }

  Future<void> googleSignInMethod() async {
   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
   print(googleUser);

   GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
     idToken: googleSignInAuthentication.idToken ,
     accessToken: googleSignInAuthentication.accessToken ,
   );
  await _auth.signInWithCredential(credential);
  }

  write(){
    _services.insert();
  }
  read(){
    _services.read();
  }
  delete(){
    _services.delete();
  }


}