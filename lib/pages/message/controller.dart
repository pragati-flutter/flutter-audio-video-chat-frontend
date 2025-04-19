import 'package:chatty/common/apis/apis.dart';
import 'package:chatty/common/entities/base.dart';
import 'package:chatty/common/routes/names.dart';
import 'package:chatty/pages/message/state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';


class MessageController extends GetxController{
  MessageController();
  final title = "Chatty .";
  final state = MessageState();




  void goProfile()async{
    await Get.toNamed(AppRoutes.Profile);
  }


  @override
  void onReady(){
    super.onReady();
    firebaseMessageSetup();
  }

  firebaseMessageSetup() async {
    String?fcmToken = await FirebaseMessaging.instance.getToken();
    print("...my device token is $fcmToken end\n");
    if(fcmToken != null){
      BindFcmTokenRequestEntity bindFcmTokenRequestEntity = BindFcmTokenRequestEntity();
      bindFcmTokenRequestEntity.fcmtoken = fcmToken;
       var choco =  await ChatAPI.bind_fcmtoken(params: bindFcmTokenRequestEntity);
       print("my choco is ${choco.msg}");

    }
  }
}

