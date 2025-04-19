import 'package:chatty/common/routes/names.dart';
import 'package:chatty/common/store/user.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'index.dart';

class ProfileController extends GetxController {
  ProfileController();

  final title = "Chatty .";
  final state = ProfileState();

  void onReady() {
    super.onReady();
   print("I am profile controller");
  }

  Future<void> goLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
