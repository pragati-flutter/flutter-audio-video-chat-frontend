import 'package:chatty/common/entities/msgcontent.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChatState{

  //for holding our data from firebase firestore
RxList<Msgcontent> msgcontentList = <Msgcontent>[].obs;
var to_token = "".obs;
var to_name = "".obs;
var to_avatar = "".obs;
var to_online = "".obs;
RxBool more_status = false.obs;
RxBool isloading = false.obs;
}