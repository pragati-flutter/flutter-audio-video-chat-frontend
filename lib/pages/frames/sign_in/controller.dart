import 'dart:convert';

import 'package:chatty/common/apis/apis.dart';
import 'package:chatty/common/entities/user.dart';
import 'package:chatty/common/routes/names.dart';
import 'package:chatty/common/store/store.dart';
import 'package:chatty/common/store/user.dart';
import 'package:chatty/common/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid', 'profile', 'email']);


  Future<void> handleSignIn(String type) async {
    try {
      if (type == "phone number") {
        if (kDebugMode) {
          print("Logging in with phone number...");
        }
      } else if (type == "google") {
        var user = await _googleSignIn.signIn();
        debugPrint("...Google Sign-In Result: $user");

        if (user != null) {
          print("user is not null");
          final gAuthentication = await user.authentication;
          print(
              "...gAuthenticationToken ${gAuthentication.idToken}"); // buggu retry krna...
          print(
              "...gAuthenticationAccess ${gAuthentication.accessToken}"); // buggu retry krna...

          final credential = GoogleAuthProvider.credential(
            // idToken: user.id,
            accessToken: gAuthentication.accessToken,
          );
          User? firebaseUser;

          try{
            UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

            // Get the authenticated user
            firebaseUser =  userCredential.user;

            print("Firebase UID: ${firebaseUser!.uid}");
            print("Firebase Name: ${firebaseUser.displayName}");
            print("Firebase Email: ${firebaseUser.email}");
            print("Firebase Photo URL: ${firebaseUser.photoURL}");
          }catch(e){
            debugPrint(e.toString());
          }

          String? displayName = user.displayName ?? "unknown";
          String email = user.email;
          String id = user.id;
          String photoUrl = firebaseUser?.photoURL ?? "assets/icons/google.png";

          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.type = 2;
          print(
              "77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777");
          print(jsonEncode(loginPanelListRequestEntity));
          asyncPostAllData(loginPanelListRequestEntity);
        }
      } else {
        if (kDebugMode) {
          print("Unknown login type: $type");
        }
      }
    } catch (e) {
      print("Login error: $e");
      Get.snackbar("Login Error", "Failed to sign in. Please try again.");
    }
  }

  asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    try {
      var result = await UserAPI.Login(params: loginRequestEntity);
      print("...post data res -> ${result.code}, ${result.data?.name}");
      if (result.code == 0) {
        await UserStore.to.saveProfile(result.data!);
      } else {
        toastInfo(msg: "Internet Error");
      }

      Get.offAllNamed(AppRoutes.Message);
    } catch (e, stackTrace) {
      print("error occurred: path -> ${stackTrace.toString()}, error -> $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
