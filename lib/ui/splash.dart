import 'dart:async';

import 'package:book_reader/ui/main/main_screen.dart';
import 'package:book_reader/utils/router.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  startDelay() => Timer(const Duration(seconds: 2), callbackHandleTimeout);

  void callbackHandleTimeout() => changeScreen();

  changeScreen() async {
    MyRouter.pushPageReplacement(context, const MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello world"),
            Image.asset("assets/images/app-icon.png", width: 300, height: 300),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startDelay();
  }
}
