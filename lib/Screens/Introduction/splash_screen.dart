import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maak_prject/Screens/Introduction/select_language.dart';

import '../Const/images.dart';


class SplashScren extends StatefulWidget {
  const SplashScren({Key? key}) : super(key: key);

  @override
  State<SplashScren> createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SelectLanguage(),
          ));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(background),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(logo),
              ],
            )));
  }
}
