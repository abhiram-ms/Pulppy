import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:AnimatedSplashScreen(
          backgroundColor:Colors.transparent,
          nextScreen: const Login(),
          splashIconSize: 200,
          splash: const Center(child:Icon(Icons.link,size: 60,color: Colors.white,) ),
        ),
      ),
    );
  }
}
