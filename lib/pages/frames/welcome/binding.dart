import 'package:chatty/pages/frames/welcome/controller.dart';
import 'package:get/get.dart';
class WelcomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(()=>WelcomeController());
  }

}