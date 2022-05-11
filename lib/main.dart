import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maak_prject/Screens/Const/colors.dart';
import 'package:maak_prject/Screens/Introduction/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'AppProviders/Auth/auth_repo.dart';
import 'AppProviders/appProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppProvider()),
            ChangeNotifierProvider(create: (_) => AuthentiRepo()),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                focusColor: kPrimaryWhite, disabledColor: kPrimaryWhite),
            home: SplashScren(),
          ),
        );
      },
    );
  }
}
