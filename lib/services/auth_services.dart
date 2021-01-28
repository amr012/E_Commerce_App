import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _storage = new FlutterSecureStorage();

  Future<UserModel> register(UserModel userModel) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await addNewUSer(userModel);
    // updateSecureStorage(createdUser);
    return createdUser;
  }

  Future<UserModel> addNewUSer(UserModel userModel) async {
    final user = await _fireStore.collection("users").add(userModel.toJson());
    userModel.key = user.id;
    return userModel;
  }

  Future<UserModel> login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print(e.toString());
    }

    UserModel createdUser = await getUserByEmail(email);
    // updateSecureStorage(createdUser);
    return createdUser;
  }


  // updateSecureStorage(UserModel userModel) async {
  //   await _storage.write(key: "user", value: userModel.key);
  // }

  Future<UserModel> getUserByEmail(String email) async {
    final data = await _fireStore.collection("users").where("email",isEqualTo: email).get();
    if(data.docs.length > 0){
     return UserModel.fromJson(data.docs.first);
    }
    throw "error at loading user ";

  }

  // Future<UserModel> getCurrentUser() async {
  //   final userKey = await _storage.read(key: "user");
  //   if(userKey == null){
  //     return null;
  //   }
  //   else{
  //     return UserModel.fromJson(
  //         await _fireStore.collection("users").doc(userKey).get());
  //   }
  // }
  //
  // signOut() async {
  //   await _auth.signOut();
  //   await _storage.delete(key: 'user');
  // }
  //
  insert() async {
    await _storage.write(key: "user1", value: "merooooo");
    print("------------> write");
  }

  read() async {
    final data = await _storage.read(key: "user1");

    print("--------->>> $data");
  }
  delete() async {
    await _storage.delete(key: "user1");
    print("----------> delete data done ");
  }

}
