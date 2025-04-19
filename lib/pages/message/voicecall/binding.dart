import 'package:chatty/pages/message/voicecall/controller.dart';
import 'package:get/get.dart';

class VoiceCallBinding extends Bindings{



  @override
  void dependencies() {
    Get.lazyPut<VoiceCallController>(()=>VoiceCallController());
  }
}
