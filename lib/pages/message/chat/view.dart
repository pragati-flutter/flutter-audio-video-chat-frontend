import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/message/chat/controller.dart';
import 'package:chatty/pages/message/chat/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatty/pages/message/chat/index.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  AppBar _buildAppBar() {
    String avatar = controller.state.to_avatar.value;
    return AppBar(
      title: Obx(() {
        return Container(
          child: Text(
            "${controller.state.to_name}",
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: TextStyle(
              fontFamily: "Avenir",
              fontSize: 16.sp,
              color: AppColors.primaryText,
            ),
          ),
        );
      }),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: (avatar != null &&
                    avatar.isNotEmpty &&
                    avatar.startsWith('http'))
                    ? CachedNetworkImage(
                  imageUrl: avatar,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  errorWidget: (_, __, ___) => Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/icons/user.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                    : Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/icons/user.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ),
              Positioned(
                  bottom: 0.w,
                  right: 0.w,
                  height: 14.w,
                  child: Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                        color: controller.state.to_online.value == "1"
                            ? AppColors.primaryElementStatus
                            : AppColors.primarySecondaryElementText,
                        borderRadius: BorderRadius.circular(12.w),
                        border: Border.all(
                          width: 2,
                          color: AppColors.primaryElementText,
                        )),
                  ))
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: _buildAppBar(),
        body: Obx(
          () => SafeArea(
              child: Stack(children: [
                const ChatList(),
            Positioned(
                bottom: 0.h,
                child: Container(
                  width: 360.w,
                  padding: EdgeInsets.only(
                      left: 20.w, bottom: 10.h, top: 5.h, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 270.w,
                        padding:
                            EdgeInsets.only(top: 10.h, bottom: 10.h, left: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                            color: AppColors.primaryBackground,
                            border: Border.all(
                                color: AppColors.primarySecondaryElementText)),
                        child: Row(
                          children: [
                            Container(
                                width: 220.w,
                                child: TextField(
                                  controller: controller.myInputController,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      hintText: "Message",
                                      contentPadding: EdgeInsets.only(
                                        left: 15.w,
                                        top: 0,
                                        bottom: 0,
                                      ),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.pink,
                                      )),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.transparent,
                                      )),
                                      disabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.transparent,
                                      )),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.transparent,
                                      )),
                                      hintStyle: const TextStyle(
                                        color: AppColors
                                            .primarySecondaryElementText,
                                      )),
                                )),
                            GestureDetector(
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                color: Colors.transparent,
                                child: Image.asset("assets/icons/send.png"),
                              ),
                              onTap: () {
                                controller.sendMessage();
                              },
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 40.w,
                          width: 40.w,
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                              borderRadius: BorderRadius.circular(40.w),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1))
                              ]),
                          child: Image.asset("assets/icons/add.png"),
                        ),
                        onTap: () {
                          controller.goMore();
                        },
                      ),
                    ],
                  ),
                )),
            controller.state.more_status.value
                ? Positioned(
                    right: 20.w,
                    bottom: 70.w,
                    height: 200.h,
                    width: 40.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 40.h,
                            width: 40.h,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.w),
                                color: AppColors.primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 1))
                                ]),
                            child: Image.asset("assets/icons/file.png"),
                          ),
                          onTap: () {},
                        ),
                        GestureDetector(
                          child: Container(
                            height: 40.h,
                            width: 40.h,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.w),
                                color: AppColors.primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 1))
                                ]),
                            child: Image.asset("assets/icons/photo.png"),
                          ),
                          onTap: () {},
                        ),
                        GestureDetector(
                          child: Container(
                            height: 40.w,
                            width: 40.w,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.w),
                                color: AppColors.primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 1))
                                ]),
                            child: Image.asset("assets/icons/call.png"),
                          ),
                          onTap: () {
                            controller.audioCall();
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 40.h,
                            width: 40.h,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.w),
                                color: AppColors.primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 1))
                                ]),
                            child: Image.asset("assets/icons/video.png"),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ))
                : Container(),
          ]),

          ),
        ));
  }
}
