import 'package:get/get.dart';
import 'package:chatty/pages/message/chat/index.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
