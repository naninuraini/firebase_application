import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus =>
      FirebaseAuth.instance.authStateChanges();

  void login(String email, String password) async {
    try {
      if (email.isEmpty && password.isEmpty) {
        Get.snackbar('Error', 'Please enter email and password');
      } else if (email.isEmpty) {
        Get.snackbar('Error', 'Please enter email');
      } else if (password.isEmpty) {
        Get.snackbar('Error', 'Please enter password');
      }
      
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        Get.snackbar('Success', 'User logged in successfully');
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', 'Please verify your email');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'invalid-credential') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
      } else if (e.code == 'too-many-requests') {
        log('too-many-requests');
        Get.snackbar('Error', 'Too many requests. Try again later.');
      }

      log(e.code);
    } catch (e) {
      log("e: $e");
    }
  }
}
