import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/common/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ChatRightList(Msgcontent item) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 250.w,
              minHeight: 40.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: 10.w, bottom: 10.w, right: 10.w, left: 10.w),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryElement,
                    ),
                    child: item.type == "text"
                        ? Text("${item.content}")
                        : Text(
                            "image",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.primaryElementText,
                            ),
                          ))
              ],
            ),
          )
        ],
      ));
}
