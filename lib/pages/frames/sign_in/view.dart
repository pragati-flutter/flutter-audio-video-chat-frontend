import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/frames/sign_in/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  Widget _buildLogo(){
    return Container(
      margin: const EdgeInsets.only(top: 100,bottom: 80),
      child: Text(
        "Chatty .",
        textAlign: TextAlign.center,
        style: TextStyle(
          color:AppColors.primaryText,
          fontSize: 34.sp,
          fontWeight:FontWeight.bold,


        ),
      ),
    );
  }

  Widget _buildThirdPartyGoggleLogin(String loginType,String logo){
    return GestureDetector(
      child: Container(
       width: 295.w,
       height: 44.h,
        padding:EdgeInsets.all(10.h),
          margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1)
          )
      ]
        ),

        child:
        Row(
          mainAxisAlignment: logo == ''?MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
           logo== ''?Container(): Container(
              padding: EdgeInsets.only(left: 40.w,right: 30.w),
              child:  Image.asset("assets/icons/$logo.png"),
            ),
            Text("Sign in with $loginType",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp
            ),),
          ],
        ),


      ),
      onTap: (){
       print("...sign up from here third party $loginType.....");
        controller.handleSignIn("google");

      },
    ); }

  Widget _buildOrWidget(){
    return Container(
      margin: EdgeInsets.only(top: 20.h,bottom: 35.h),
      child:Row(
        children: [
          Expanded(child: Divider(
            indent: 50,
            height: 2.h,
            color: AppColors.primarySecondaryElementText,
          )
          ),
          const Text("or"),
          Expanded(child: Divider(
            endIndent: 50 ,
            height: 2.h,
            color: AppColors.primarySecondaryElementText,
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _buildLogo(),
              _buildThirdPartyGoggleLogin("Google","google"),
              _buildThirdPartyGoggleLogin("Facebook","facebook"),
              _buildThirdPartyGoggleLogin("Apple","apple"),
              _buildOrWidget(),
              _buildThirdPartyGoggleLogin("Sign in with phone number",""),
             SizedBox(
               height: 35.h,
             ),
             Column(
        
               children: [
                 Text("Already have an account", textAlign:TextAlign.center,
                 style: TextStyle(
                   color: AppColors.primaryText,
                   fontWeight: FontWeight.normal,
                   fontSize: 12.sp
                 ),
        
                 ),
        
                 GestureDetector(
                   child: Text("Sign up here", textAlign:TextAlign.center,
                     style: TextStyle(
                         color: AppColors.primaryElement,
                         fontWeight: FontWeight.normal,
                         fontSize: 12.sp
                     ),
        
                   ),
                 ), ],
             )
        
        
            ],
          ),
        ),
      ),
    );

  }



}