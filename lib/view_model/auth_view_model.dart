
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

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