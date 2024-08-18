import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winlab/src/app/presentation/routes/routes_navigator.dart';
import 'package:winlab/src/app/presentation/screens/auth/login_screen.dart';

class SplashServices {
  isUserlogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // TokenService tokenService = TokenService();
    // tokenService.getDeviceToken().then((value) async {
    //   debugPrint("Token Value*************");
    //   debugPrint(value);
    //   await prefs.setString('userDeviceToken', value);
    // });

    // <------------------------  FETCHING USER TOKEN ------------------------>
    // final authData = Provider.of<AuthPro>(context, listen: false);

    // await authData.getCurrentUserDetailsFunc(context);

    await Future.delayed(const Duration(seconds: 2));
    final String? userId = prefs.getString('username');
    log("username $userId");

    if (userId != null) {
    } else {
     
      RouteNavigator.replacementroute(context, const LoginScreen());
    }
  }
}
