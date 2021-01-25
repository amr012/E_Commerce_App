
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

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



}