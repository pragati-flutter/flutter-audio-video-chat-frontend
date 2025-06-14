import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/common/utils/utils.dart';

class ContactAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<ContactResponseEntity> post_contact() async {
    var response = await HttpUtil().post(
      'api/contact',
    );
    print(response);
    return ContactResponseEntity.fromJson(response);
  }


}
