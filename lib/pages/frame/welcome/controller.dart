import 'package:chatty/common/routes/routes.dart';
import 'package:chatty/common/store/store.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();
  final title = "Chatty .";

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.Message));
  }

}
