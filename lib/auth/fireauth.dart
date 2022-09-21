import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home.dart';
import 'databace_auth.dart';

class Authent {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String username) async {
    try {
       await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Map<String, dynamic> userInfoMap = {
        " email ": email,
        " password ": password,
        " username ": username,
      };
      DatabaseMethods().addUserInfoToDB(auth.currentUser!.uid, userInfoMap);
    } catch (error) {
      String errorMessage =
      error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.off(const Home());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> Logout() async {
    await auth.signOut();
  }

  void signInWithGoogleAccount() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication _googleSignInAuthentication =
      await _googleUser!.authentication;
      final _googleAuthCredential = GoogleAuthProvider.credential(
        idToken: _googleSignInAuthentication.idToken,
        accessToken: _googleSignInAuthentication.accessToken,
      );

      // await auth.signInWithCredential(_googleAuthCredential).then((user) {
      //   saveUser(user);
      // });
      Get.offAll(const Home());
    } catch (error) {
      String errorMessage =
      error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
