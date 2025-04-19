import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/profile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,

          decoration: BoxDecoration(
              color: AppColors.primarySecondaryBackground,
              borderRadius: BorderRadius.all(Radius.circular(60.w)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: const Offset(0, 1))
              ]),
          child: Image(
            fit: BoxFit.cover,
              height: 120.w,
              width: 120.w,
              image: const AssetImage("assets/images/account_header.png")),
        ),
        Positioned(
            bottom: 20.w,
            right: 0.w,

            child: GestureDetector(

              child: Container(
                height: 35.w,
                width: 35.w,
    padding:EdgeInsets.all(7.w),
                decoration: BoxDecoration(
                    color: AppColors.primaryText,
                    borderRadius: BorderRadius.all(Radius.circular(40.w))),
                child: Image.asset("assets/icons/edit.png"),
              ),
            ))
      ],
    );
  }

  Widget _buildCompleteBtn() {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: Colors.grey.withOpacity(0.1))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Complete",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            )
          ],
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return GestureDetector(
      child: Container(
        height: 44.h,
        width: 295.w,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
            color: AppColors.primarySecondaryElementText,
            borderRadius: const BorderRadiusDirectional.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logout",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.defaultDialog(
            title: "Are you  sure to log out?",
            content: Container(),
            onConfirm: () {
              controller.goLogout();
              print("...its confirmed...");
            },
            onCancel: () {},
            textConfirm: "confirm",
            textCancel: "Cancel",
            confirmTextColor: Colors.white);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  _buildProfilePhoto(),
                  _buildCompleteBtn(),
                  _logoutButton()
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
