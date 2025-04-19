import 'package:chatty/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatty/pages/message/voicecall/index.dart';

class VoiceCallPage extends GetView<VoiceCallController> {
  const VoiceCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary_bg,
        body: SafeArea(
          child: Obx(
            () => Container(
              child: Stack(
                children: [
                  Positioned(
                      top: 10.h,
                      left: 30.w,
                      right: 30.w,
                      child: Column(
                        children: [
                          Container(
                              child: Text(
                            controller.state.callTime.value,
                            style: TextStyle(
                                color: AppColors.primaryElementText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal),
                          )),
                          Container(
                            width: 70.h,
                            height: 70.h,
                            margin: EdgeInsets.only(top: 150.h),
                            child: controller.state.to_avatar.value == "assets/icons/google.png"
                                ? const Image(
                              image: AssetImage('assets/icons/user.png'),
                            )
                                : Image.network(
                              controller.state.to_avatar.value,
                              errorBuilder: (context, error, stackTrace) {
                                return const Image(
                                  image: AssetImage('assets/icons/user.png'),
                                );
                              },
                            ),
                          ),

                          Container(
                              margin: EdgeInsets.only(top: 5.h),
                              child: Text(
                                controller.state.to_name.value,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.sp,
                                ),
                              ))
                        ],
                      )),
                  Positioned(
                      bottom: 80.h,
                      left: 30.w,
                      right: 30.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(15.w),
                                  width: 60.h,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.w)),
                                    color: controller.state.openMicrophone.value
                                        ? AppColors.primaryElementText
                                        : AppColors.primaryText,
                                  ),
                                  child:
                                      controller.state.openMicrophone.value ==
                                              false
                                          ? Image.asset(
                                              "assets/icons/a_microphone.png")
                                          : Image.asset(
                                              "assets/icons/b_microphone.png"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  "MicroPhone",
                                  style: TextStyle(
                                      color: AppColors.primaryElementText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: controller.state.isJoined.value
                                    ? controller.leaveChannel
                                    : controller.joinChannel,
                                child: Container(
                                  padding: EdgeInsets.all(15.w),
                                  width: 60.h,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.w)),
                                    color: controller.state.isJoined.value
                                        ? AppColors.primaryElementBg
                                        : AppColors.primaryElementStatus,
                                  ),
                                  child: controller.state.isJoined.value ==
                                          false
                                      ? Image.asset("assets/icons/a_phone.png")
                                      : Image.asset(
                                          "assets/icons/a_telephone.png"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  controller.state.isJoined.value
                                      ? "Disconnect"
                                      : "Connect",
                                  style: TextStyle(
                                      color: AppColors.primaryElementText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(15.w),
                                  width: 60.h,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.w)),
                                    color: controller.state.enableSpeaker.value
                                        ? AppColors.primaryElementText
                                        : AppColors.primaryText,
                                  ),
                                  child: controller.state.enableSpeaker.value ==
                                          false
                                      ? Image.asset(
                                          "assets/icons/a_trumpet.png")
                                      : Image.asset(
                                          "assets/icons/b_trumpet.png"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  "Speaker",
                                  style: TextStyle(
                                      color: AppColors.primaryElementText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
