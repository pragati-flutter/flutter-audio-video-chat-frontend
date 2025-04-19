import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/frames/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  Widget _buildPageHeadTitle(String title){
    return Container(
      margin: const EdgeInsets.only(top: 350),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style:  TextStyle(
          color: AppColors.primaryElementText,
          fontFamily: "Montserrat",
            fontWeight:FontWeight.bold,
          fontSize:45.sp ,

        ),
      ),

    );



  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:const Size(360,780),
        builder:(context,child)=> Scaffold(
      backgroundColor: AppColors.primaryElement,
      body: Container(
        height: 780.h,
        width: 360.w,
        child: _buildPageHeadTitle(controller.title),

      ),
    ));
  }
}
