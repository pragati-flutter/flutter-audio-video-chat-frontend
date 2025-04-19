import 'package:chatty/common/services/services.dart';
import 'package:chatty/common/store/user.dart';
import 'package:chatty/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {

    WidgetsFlutterBinding.ensureInitialized();
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await Get.putAsync(() async => await StorageService().init());
      Get.put<UserStore>(UserStore());
      print("firebase initialize successfully");



    } catch (e) {
      debugPrint("Firebase Initialization Error..........................................................................................................................................................................................: $e");
    }
  }
}
