import 'package:get/get.dart';
import 'package:chatty/pages/profile/controller.dart';
class ProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(()=>ProfileController());
  }

}