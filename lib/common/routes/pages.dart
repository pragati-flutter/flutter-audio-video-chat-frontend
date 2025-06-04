import 'package:chatty/common/middlewares/router_auth.dart';
import 'package:chatty/pages/contact/binding.dart';
import 'package:chatty/pages/contact/view.dart';
import 'package:chatty/pages/frames/welcome/index.dart';
import 'package:chatty/pages/message/chat/binding.dart';
import 'package:chatty/pages/message/chat/view.dart';

import 'package:chatty/pages/message/index.dart';
import 'package:chatty/pages/message/videocall/binding.dart';
import 'package:chatty/pages/message/videocall/view.dart';
import 'package:chatty/pages/message/voicecall/binding.dart';
import 'package:chatty/pages/message/voicecall/view.dart';

import 'package:chatty/pages/profile/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'routes.dart';
import 'package:chatty/pages/frames/sign_in/index.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
/*
    // 需要登录
    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),




    // 最新路由
    GetPage(name: AppRoutes.EmailLogin, page: () => EmailLoginPage(), binding: EmailLoginBinding()),
    GetPage(name: AppRoutes.Register, page: () => RegisterPage(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.Forgot, page: () => ForgotPage(), binding: ForgotBinding()),
    GetPage(name: AppRoutes.Phone, page: () => PhonePage(), binding: PhoneBinding()),
    GetPage(name: AppRoutes.SendCode, page: () => SendCodePage(), binding: SendCodeBinding()),
    // 首页 */
    //contact page
    GetPage(
        name: AppRoutes.Contact,
        page: () => ContactPage(),
        binding: ContactBinding()),
    //message page
    GetPage(
      name: AppRoutes.Message,
      page: () =>  MessagePage(),
      binding: MessageBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    //Profile section
    GetPage(
        name: AppRoutes.Profile,
        page: () => ProfilePage(),
        binding: ProfileBinding()),

    //聊天详情
    GetPage(
        name: AppRoutes.Chat,
        page: () =>  ChatPage(),
        binding: ChatBinding()),
/*
    GetPage(name: AppRoutes.Photoimgview, page: () => PhotoImgViewPage(), binding: PhotoImgViewBinding()),
    */
    GetPage(
        name: AppRoutes.VoiceCall,
        page: () => VoiceCallViewPage(),
        binding: VoiceCallViewBinding()),
    GetPage(
        name: AppRoutes.VideoCall,
        page: () => VideoCallPage(),
        binding: VideoCallBinding()),
  ];
}
